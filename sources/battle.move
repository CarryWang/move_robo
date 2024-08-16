module move_robo::battle {

    use std::u64::divide_and_round_up;
    use sui::clock;
    use sui::clock::Clock;
    use sui::event;
    use move_robo::core;
    use move_robo::core::GameStore;
    use move_robo::robo::Robo;

    /// Battle event
    public struct RoboBattleLog has store, copy, drop {
        attacker: ID,
        winner: ID,
        loser: ID,
        winner_energies_lost: u64,
        loser_energies_lost: u64,
        reparation_economic_power: u64,
        battle_time: u64,
        reparation_end_time: u64
    }

    entry fun battle(robo: &Robo, clock: &Clock, game_store: &mut GameStore, ctx: &mut TxContext) {
        // 1. 随机选出一个目标
        let attacker_id = object::id(robo);
        let target_id = core::random_battle_target(attacker_id, game_store, ctx);

        // 2. 获取机器人数据
        let (attacker, defender) = core::fetch_robo_data(attacker_id, target_id, game_store);

        // 3. 检查战斗冷却时间
        let current_timestamp = clock::timestamp_ms(clock);
        assert!(core::get_robo_battle_cooldown(&attacker) < current_timestamp, EBattleCooldown);
        assert!(core::get_robo_battle_cooldown(&defender) < current_timestamp, EBattleCooldown);

        // 4. 战斗
        // 4.1 计算总攻击力和防御力
        let mut attack_power = core::get_robo_total_attack_power(&attacker);
        let mut defense_power = core::get_robo_total_defense_power(&defender);
        if (core::has_nature_advantage(&attacker, &defender)) {
            attack_power = divide_and_round_up(attack_power * 15, 10)
        } else if (core::has_nature_advantage(&defender, &attacker)) {
            defense_power = divide_and_round_up(defense_power * 15, 10)
        };

        // 4.2 决定输赢
        let (mut winner, mut loser);
        if (attack_power > defense_power) {
            winner = attacker;
            loser = defender;
        } else {
            winner = defender;
            loser = attacker;
        };
        let winner_id = core::get_robo_id(&winner);
        let loser_id = core::get_robo_id(&loser);

        // 5. 战斗结算
        // 5.1 设置赢家
        core::settle_robo_economy_inner(clock, &mut winner);
        let winner_energies_total_defense_power = core::get_robo_total_energies_defense_power(&winner);
        let loser_energies_total_attack_power = core::get_robo_total_energies_attack_power(&loser);
        let winner_energies_left;
        if (winner_energies_total_defense_power > loser_energies_total_attack_power) {
            let (_, winner_energy_defense_power) = core::get_robo_energy_attack_defense_power(
                core::get_robo_nature(&winner)
            );
            winner_energies_left = divide_and_round_up(
                winner_energies_total_defense_power - loser_energies_total_attack_power,
                winner_energy_defense_power
            );
        } else {
            winner_energies_left = 0;
        };
        let winner_energies_lost = core::get_robo_energies(&winner) - winner_energies_left;
        let winner_exp_gain = core::battle_winner_exp(&winner);
        let reparation_economic_power = core::get_robo_economic_base_power(&loser);
        core::battle_settlement_save_robo_data(
            game_store,
            winner,
            true,
            current_timestamp + BATTLE_WINNER_COOLDOWN_MS,
            reparation_economic_power,
            current_timestamp,
            current_timestamp + BATTLE_LOSER_ECONOMIC_PENALTY_TIME,
            winner_energies_left,
            winner_exp_gain
        );

        // 5.2 设置输家
        core::settle_robo_economy_inner(clock, &mut loser);
        let loser_energies_left = 0;
        let loser_energies_lost = core::get_robo_energies(&loser) - loser_energies_left;
        core::battle_settlement_save_robo_data(
            game_store,
            loser,
            false,
            current_timestamp + BATTLE_LOSER_COOLDOWN_MS,
            reparation_economic_power,
            current_timestamp,
            current_timestamp + BATTLE_LOSER_ECONOMIC_PENALTY_TIME,
            loser_energies_left,
            0
        );

        // 6. 发送事件
        event::emit(RoboBattleLog {
            attacker: attacker_id,
            winner: winner_id,
            loser: loser_id,
            winner_energies_lost,
            loser_energies_lost,
            reparation_economic_power,
            battle_time: current_timestamp,
            reparation_end_time: current_timestamp + BATTLE_LOSER_ECONOMIC_PENALTY_TIME
        });
    }

    const BATTLE_WINNER_COOLDOWN_MS: u64 = 30 * 1000;
    // 30 sec
    const BATTLE_LOSER_ECONOMIC_PENALTY_TIME: u64 = 2 * 60 * 1000;
    // 2 min
    const BATTLE_LOSER_COOLDOWN_MS: u64 = 2 * 60 * 1000;
    // 2 min
    /// One or both sides of the battle are in battle cooldown
    const EBattleCooldown: u64 = 0;
}
