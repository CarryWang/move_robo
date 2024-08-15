module move_robo::core {
    use std::u64::divide_and_round_up;
    use sui::clock;
    use sui::clock::Clock;
    use sui::dynamic_field;
    use sui::math;
    use sui::tx_context::sender;
    use move_robo::utils;

    /// 全局游戏对象
    public struct GameStore has key, store {
        id: UID,
        robo_count: u64,
        robo_ids: vector<ID>,

    }

    public struct RoboData has store {
        id: ID,
        nature: u64,
        level: u64,
        experience_pool: u64,
        economy: Economy,
        military: Military,
    }

    public struct Economy has store {
        treasury: u64,
        base_power: u64,
        settle_time: u64,
        energy_buff: EconomicBuff,
        battle_buff: vector<EconomicBuff>,
    }

    public struct EconomicBuff has copy, store, drop {
        debuff: bool,
        power: u64,
        start: u64,
        end: u64,
    }

    public struct Military has store {
        attack_power: u64,
        defense_power: u64,
        total_attack_power: u64,
        total_defense_power: u64,
        energies: u64,
        battle_cooldown: u64,
    }

    /// 管理员权限，修改游戏设置的能力
    public struct AdminCap has key {
        id: UID
    }

    /// 模块初始化创建唯一的AdminCap并将其发送给发布者
    fun init(ctx: &mut TxContext) {
        transfer::transfer(
            AdminCap { id: object::new(ctx) }, sender(ctx)
        );

        transfer::share_object(
            GameStore {
                id: object::new(ctx),
                robo_count: 0,
                robo_ids: vector::empty<ID>()
            }
        );
    }


    /// 初始化机器人数据
    public(package) fun init_robo_data(id: ID,
                                       nature: u64,
                                       current_timestamp: u64,
                                       game_store: &mut GameStore) {
        // 1. 初始化机器人数据
        let (attack_power, defense_power) = get_initial_attack_defense_power(nature);
        let (energies_attack_power, energies_defense_power) = get_initial_energies_attack_defense_power(
            nature,
            INITIAL_ENERGIES
        );
        let robo_data = RoboData {
            id,
            nature,
            level: 1,
            experience_pool: 0,
            economy: Economy {
                treasury: 0,
                base_power: BASE_ECONOMIC_POWER,
                settle_time: current_timestamp,
                energy_buff: EconomicBuff {
                    debuff: false,
                    power: ENERGY_ECONOMIC_POWER * INITIAL_ENERGIES,
                    start: current_timestamp,
                    end: 0
                },
                battle_buff: vector::empty<EconomicBuff>()
            },
            military: Military {
                attack_power,
                defense_power,
                total_attack_power: attack_power + energies_attack_power,
                total_defense_power: defense_power + energies_defense_power,
                energies: INITIAL_ENERGIES,
                battle_cooldown: current_timestamp
            }
        };

        // 2. 存储机器人数据，动态添加到全局游戏对象中
        dynamic_field::add(&mut game_store.id, id, robo_data);

        // 3. 更新机器人id数组和机器人计数
        vector::push_back(&mut game_store.robo_ids, id);
        game_store.robo_count = game_store.robo_count + 1;
    }

    /// 经济体系===========================================================================================
    /// 结算机器人的经济，包括胜利奖励和失败惩罚
    public(package) fun settle_robo_economy(id: ID, clock: &Clock, game_store: &mut GameStore) {
        settle_robo_economy_inner(clock, dynamic_field::borrow_mut<ID, RoboData>(&mut game_store.id, id));
    }

    /// 结算机器人的经济, 内部函数
    public(package) fun settle_robo_economy_inner(clock: &Clock, robo_data: &mut RoboData) {
        let current_timestamp = clock::timestamp_ms(clock);

        // 1. calculate base power benefits
        // 计算一段时间内的经济收益，经济收益效率受base_power影响
        let base_benefits = calculate_economic_benefits(
            robo_data.economy.settle_time,
            current_timestamp,
            robo_data.economy.base_power
        );
        // 更新金库和结算时间
        robo_data.economy.treasury = robo_data.economy.treasury + base_benefits;
        robo_data.economy.settle_time = current_timestamp;

        // 2. calculate energy buff
        // 能量值也会带来经济收益加成，能量值带来的经济收益
        let energy_benefits = calculate_economic_benefits(
            robo_data.economy.energy_buff.start,
            current_timestamp,
            robo_data.economy.energy_buff.power
        );

        // 更新金库和结算时间
        robo_data.economy.treasury = robo_data.economy.treasury + energy_benefits;
        robo_data.economy.energy_buff.start = current_timestamp;

        // 3. calculate battle buff
        if (!vector::is_empty(&robo_data.economy.battle_buff)) {
            let length = vector::length(&robo_data.economy.battle_buff);
            let mut expired_buffs = vector::empty<u64>();
            let mut i = 0;
            while (i < length) {
                let buff = vector::borrow_mut(&mut robo_data.economy.battle_buff, i);
                let mut battle_benefit;
                if (buff.end <= current_timestamp) {
                    vector::push_back(&mut expired_buffs, i);
                    battle_benefit = calculate_economic_benefits(buff.start, buff.end, buff.power);
                } else {
                    battle_benefit = calculate_economic_benefits(buff.start, current_timestamp, buff.power);
                    buff.start = current_timestamp;
                };

                if (buff.debuff) {
                    robo_data.economy.treasury = robo_data.economy.treasury - battle_benefit;
                } else {
                    robo_data.economy.treasury = robo_data.economy.treasury + battle_benefit;
                };
                i = i + 1;
            };

            // remove expired buffs
            while (!vector::is_empty(&expired_buffs)) {
                let expired_buff_index = vector::remove(&mut expired_buffs, 0);
                vector::remove(&mut robo_data.economy.battle_buff, expired_buff_index);
            };
            vector::destroy_empty<u64>(expired_buffs);
        }
    }


    /// Calculate economic benefits based on power and time period (1 minute).
    /// 按经济力和时间段(1分钟)计算经济效益。
    fun calculate_economic_benefits(start: u64, end: u64, power: u64): u64 {
        divide_and_round_up((end - start) * power, 60u64 * 1000u64)
    }

    /// 使用金库购买能量
    public(package) fun buy_energy(id: ID, count: u64, clock: &Clock, game_store: &mut GameStore) {
        // 1. borrow the robo data
        let robo_data = dynamic_field::borrow_mut<ID, RoboData>(&mut game_store.id, id);

        // 2. update energy count
        let final_energies = robo_data.military.energies + count;

        // 3. check treasury sufficiency
        let total_soldier_price = ENERGY_PRICE * count;

        // 4. settle economy
        settle_robo_economy_inner(clock, robo_data);

        // 5. update treasury and energies
        robo_data.economy.treasury = robo_data.economy.treasury - total_soldier_price;
        robo_data.military.energies = final_energies;

        // 6. update energy economic power buff
        robo_data.economy.energy_buff.power = ENERGY_ECONOMIC_POWER * final_energies;
        robo_data.economy.energy_buff.start = clock::timestamp_ms(clock);

        // 7. update total attack/defense power
        robo_data.military.total_attack_power = get_robo_total_attack_power(freeze(robo_data));
        robo_data.military.total_defense_power = get_robo_total_defense_power(freeze(robo_data));
    }


    /// 获取机器人信息相关=================================================================================

    /// 获取机器人id
    public(package) fun get_robo_id(robo_data: &RoboData): ID {
        robo_data.id
    }

    /// 获取机器人的属性
    public(package) fun get_robo_nature(robo_data: &RoboData): u64 {
        robo_data.nature
    }

    /// 获取战斗冷却时间
    public(package) fun get_robo_battle_cooldown(robo_data: &RoboData): u64 {
        robo_data.military.battle_cooldown
    }

    /// 获取能量值
    public(package) fun get_robo_energies(robo_data: &RoboData): u64 {
        robo_data.military.energies
    }

    /// 获取基础经济值
    public(package) fun get_robo_economic_base_power(robo_data: &RoboData): u64 {
        robo_data.economy.base_power
    }


    /// 获取战斗数值相关（攻击力，防御力计算）=============================================================================

    /// 获取初始的 攻击力 和 防御力，根据属性的不同，会有变化
    fun get_initial_attack_defense_power(nature: u64): (u64, u64) {
        let (attack, defense);

        if (nature == ROBO_NATURE_JIN) {
            (attack, defense) = (BASE_ATK_JIN, BASE_DEF_JIN);
        } else if (nature == ROBO_NATURE_MU) {
            (attack, defense) = (BASE_ATK_MU, BASE_DEF_MU);
        } else if (nature == ROBO_NATURE_SHUI) {
            (attack, defense) = (BASE_ATK_SHUI, BASE_DEF_SHUI);
        } else if (nature == ROBO_NATURE_HUO) {
            (attack, defense) = (BASE_ATK_HUO, BASE_DEF_HUO);
        } else if (nature == ROBO_NATURE_TU) {
            (attack, defense) = (BASE_ATK_TU, BASE_DEF_TU);
        } else {
            abort 0
        };

        (attack, defense)
    }

    /// 获取初始的 能量值加成 攻击力 和 防御力
    fun get_initial_energies_attack_defense_power(nature: u64, energies: u64): (u64, u64) {
        let (attack, defense) = get_robo_energy_attack_defense_power(nature);
        (attack * energies, defense * energies)
    }

    /// 获取机器人 的 能量加成系数，能量加成系数会提升额外的攻击力和防御力，不同属性的机器人能量对攻击力和防御力加成值不同
    public(package) fun get_robo_energy_attack_defense_power(nature: u64): (u64, u64) {
        let (energy_attack_power, energy_defense_power);
        if (nature == ROBO_NATURE_JIN) {
            energy_attack_power = BASE_ATK_JIN / 10;
            energy_defense_power = BASE_DEF_JIN / 10;
        } else if (nature == ROBO_NATURE_MU) {
            energy_attack_power = BASE_ATK_MU / 10;
            energy_defense_power = BASE_DEF_MU / 10;
        } else if (nature == ROBO_NATURE_SHUI) {
            energy_attack_power = BASE_ATK_SHUI / 10;
            energy_defense_power = BASE_DEF_SHUI / 10;
        } else if (nature == ROBO_NATURE_HUO) {
            energy_attack_power = BASE_ATK_HUO / 10;
            energy_defense_power = BASE_DEF_HUO / 10;
        } else if (nature == ROBO_NATURE_TU) {
            energy_attack_power = BASE_ATK_TU / 10;
            energy_defense_power = BASE_DEF_TU / 10;
        } else {
            abort 0
        };

        (energy_attack_power, energy_defense_power)
    }

    /// 机器人的 总攻击力(基础 + 能量数)
    public(package) fun get_robo_total_attack_power(robo_data: &RoboData): u64 {
        robo_data.military.attack_power + get_robo_total_energies_attack_power(robo_data)
    }

    /// 机器人的 能量加成 总攻击力 = 能量数 *  能量加成系数
    public(package) fun get_robo_total_energies_attack_power(robo_data: &RoboData): u64 {
        let (energy_attack_power, _) = get_robo_energy_attack_defense_power(robo_data.nature);
        robo_data.military.energies * energy_attack_power
    }

    /// 机器人的 总防御力(基础 + 能量加成数)
    public(package) fun get_robo_total_defense_power(robo_data: &RoboData): u64 {
        robo_data.military.defense_power + get_robo_total_energies_defense_power(robo_data)
    }

    /// 机器人的 能量加成 总防御力 = 能量数 *  能量加成系数
    public(package) fun get_robo_total_energies_defense_power(robo_data: &RoboData): u64 {
        let (_, energy_defense_power) = get_robo_energy_attack_defense_power(robo_data.nature);
        robo_data.military.energies * energy_defense_power
    }

    /// 战斗相关===========================================================================

    /// 随机选择战斗对象的id
    public(package) fun random_battle_target(launch_robo: ID, game_store: &GameStore, ctx: &mut TxContext): ID {
        let total_length = vector::length<ID>(&game_store.robo_ids);
        assert!(total_length > 1, ENotEnoughRobo);

        let mut random_index = utils::random_in_range(total_length, ctx);
        let mut target = vector::borrow<ID>(&game_store.robo_ids, random_index);

        while (object::id_to_address(&launch_robo) == object::id_to_address(target)) {
            // redo random until not equals
            random_index = utils::random_in_range(total_length, ctx);
            target = vector::borrow<ID>(&game_store.robo_ids, random_index);
        };

        object::id_from_address(object::id_to_address(target))
    }

    /// 加载两个机器人的数据
    public(package) fun fetch_robo_data(id1: ID, id2: ID, game_store: &mut GameStore): (RoboData, RoboData) {
        let robo_data1 = dynamic_field::remove<ID, RoboData>(&mut game_store.id, id1);
        let robo_data2 = dynamic_field::remove<ID, RoboData>(&mut game_store.id, id2);
        (robo_data1, robo_data2)
    }

    /// 用于在战斗中判断是否有属性克制关系
    public(package) fun has_nature_advantage(robo_data1: &RoboData, robo_data2: &RoboData): bool {
        let c1_race = robo_data1.nature;
        let c2_race = robo_data2.nature;

        let has;
        if (c1_race == c2_race) {
            has = false;
        } else if (c1_race < c2_race) {
            has = (c2_race - c1_race) == 1;
        } else {
            has = (c1_race - c2_race) == 4;
        };

        has
    }

    /// 战斗胜利获得的经验值
    public(package) fun battle_winner_exp(robo_data: &RoboData): u64 {
        let battle_exp_map = BATTLE_EXP_GAIN_LEVELS;
        *vector::borrow<u64>(&battle_exp_map, robo_data.level)
    }

    // 计算能量对经济值的加成
    public(package) fun calculate_energies_economic_power(count: u64): u64 {
        ENERGY_ECONOMIC_POWER * count
    }

    /// 战斗结算
    public(package) fun battle_settlement_save_robo_data(
        game_store: &mut GameStore,
        mut robo_data: RoboData,
        win: bool,
        cooldown: u64,
        economic_base_power: u64,
        current_timestamp: u64,
        economy_buff_end: u64,
        energies_left: u64,
        exp_gain: u64
    ) {
        // 1. battle cooldown
        robo_data.military.battle_cooldown = cooldown;
        // 2. energy left
        robo_data.military.energies = energies_left;
        robo_data.economy.energy_buff.power = calculate_energies_economic_power(energies_left);
        robo_data.economy.energy_buff.start = current_timestamp;
        // 3. energies caused total attack/defense power
        robo_data.military.total_attack_power = get_robo_total_attack_power(&robo_data);
        robo_data.military.total_defense_power = get_robo_total_defense_power(&robo_data);
        // 4. exp gain
        robo_data.experience_pool = robo_data.experience_pool + exp_gain;
        // 5. economy buff
        vector::push_back(&mut robo_data.economy.battle_buff, EconomicBuff {
            debuff: !win,
            power: economic_base_power,
            start: current_timestamp,
            end: economy_buff_end,
        });
        // 6. put back to table
        dynamic_field::add(&mut game_store.id, robo_data.id, robo_data);
    }


    /// 从经验池中消耗经验值来升级机器人
    public(package) fun upgrade_robo(id: ID, game_store: &mut GameStore) {
        // 1. fetch robo data
        let robo_data = dynamic_field::borrow_mut<ID, RoboData>(&mut game_store.id, id);

        // 2. continually upgrade if exp is enough
        let initial_level = robo_data.level;
        let exp_level_map = REQUIRED_EXP_LEVELS;
        while (robo_data.level < MAX_ROBO_LEVEL) {
            let exp_required_at_current_level = *vector::borrow(&exp_level_map, robo_data.level - 1);
            if (robo_data.experience_pool < exp_required_at_current_level) {
                break
            };

            robo_data.experience_pool = robo_data.experience_pool - exp_required_at_current_level;
            robo_data.level = robo_data.level + 1;
        };

        // 3. update powers if upgraded
        if (robo_data.level > initial_level) {
            let base_economic_power = calculate_robo_base_economic_power(freeze(robo_data));
            robo_data.economy.base_power = base_economic_power;

            let (attack_power, defense_power) = calculate_robo_base_attack_defense_power(freeze(robo_data));
            robo_data.military.attack_power = attack_power;
            robo_data.military.defense_power = defense_power;
        }
    }

    /// 计算机器人的基础经济力
    fun calculate_robo_base_economic_power(robo_data: &RoboData): u64 {
        let initial_base_power = BASE_ECONOMIC_POWER;
        let level = robo_data.level;
        math::divide_and_round_up(initial_base_power * 12 * math::pow(10, ((level - 1) as u8)), 10)
    }


    /// 根据等级计算机器人的基础攻击力和基础防御力
    /// base attack power = (factor * initial_attack_power * (1.2 ^ (level - 1)))
    /// base defense power = (factor * initial_defense_power * (1.2 ^ (level - 1)))
    fun calculate_robo_base_attack_defense_power(robo_data: &RoboData): (u64, u64) {
        let factor = 2;
        let (initial_attack, initial_defense) = get_initial_attack_defense_power(robo_data.nature);
        let attack_power = math::divide_and_round_up(
            factor * initial_attack * 12 * math::pow(10, ((robo_data.level - 1) as u8)),
            10
        );
        let defense_power = math::divide_and_round_up(
            factor * initial_defense * 12 * math::pow(10, ((robo_data.level - 1) as u8)),
            10
        );
        (attack_power, defense_power)
    }


    /// 机器人属性，按照五行分类 =========================================================
    const ROBO_NATURE_MU: u64 = 0;
    const ROBO_NATURE_TU: u64 = 1;
    const ROBO_NATURE_SHUI: u64 = 2;
    const ROBO_NATURE_HUO: u64 = 3;
    const ROBO_NATURE_JIN: u64 = 4;

    /// 不同属性机器人的初始攻击力和防御力
    const BASE_ATK_JIN: u64 = 1000;
    const BASE_DEF_JIN: u64 = 1000;

    const BASE_ATK_MU: u64 = 1200;
    const BASE_DEF_MU: u64 = 800;

    const BASE_ATK_SHUI: u64 = 500;
    const BASE_DEF_SHUI: u64 = 1500;

    const BASE_ATK_HUO: u64 = 1500;
    const BASE_DEF_HUO: u64 = 500;

    const BASE_ATK_TU: u64 = 800;
    const BASE_DEF_TU: u64 = 1200;


    /// 初始能量值
    const INITIAL_ENERGIES: u64 = 10;

    /// 一点能量值提供的经济值
    const ENERGY_ECONOMIC_POWER: u64 = 1;

    /// 每点能量值的价格
    const ENERGY_PRICE: u64 = 100;

    /// 基础经济力
    const BASE_ECONOMIC_POWER: u64 = 100;

    /// 错误定义：购买能量值金钱不够
    const EInsufficientTreasury: u64 = 1;

    /// 错误定义：没有足够的机器人来战斗
    const ENotEnoughRobo: u64 = 2;

    /// 机器人最高等级
    const MAX_ROBO_LEVEL: u64 = 10;

    /// 每场战斗中获得的经验值，根据1-10的等级
    const BATTLE_EXP_GAIN_LEVELS: vector<u64> = vector[25, 30, 40, 55, 75, 100, 130, 165, 205, 250];
    
    /// 升级到2-10级需要的经验值
    const REQUIRED_EXP_LEVELS: vector<u64> = vector[100, 150, 225, 338, 507, 760, 1140, 1709, 2563];
}