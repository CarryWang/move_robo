module move_robo::robo {

    use std::string::{Self, utf8, String};
    use sui::clock;
    use sui::clock::Clock;
    use sui::display;
    use sui::event;
    use sui::package;
    use sui::tx_context::sender;
    use move_robo::utils;
    use move_robo::core;
    use move_robo::core::GameStore;

    /// One-Time-Witness for the module
    public struct ROBO has drop {}

    /// The robo struct
    public struct Robo has key, store {
        id: UID,
        name: String,
        description: String,
        serial_number: u64
    }

    /// Event - robo built
    public struct RoboBuilt has copy, drop {
        id: ID,
        owner: address,
    }

    fun init(otw: ROBO, ctx: &mut TxContext) {
        let keys = vector[
            utf8(b"name"),
            utf8(b"link"),
            utf8(b"image_url"),
            utf8(b"description"),
            utf8(b"project_url"),
            utf8(b"creator"),
        ];

        let values = vector[
            utf8(b"{name}"),
            utf8(b"https://robohash.org/{serial_number}"),
            utf8(b"https://robohash.org/{serial_number}.png"),
            utf8(b"{description}"),
            utf8(b"https://github.com/CarryWang/move_robo"),
            utf8(b"Carry Wang"),
        ];

        let publisher = package::claim(otw, ctx);
        let mut display = display::new_with_fields<Robo>(&publisher, keys, values, ctx);

        display::update_version(&mut display);

        transfer::public_transfer(publisher, sender(ctx));
        transfer::public_transfer(display, sender(ctx));
    }
    
    /// 创造机器人
    entry fun create_robo(
        name_bytes: vector<u8>,
        desc_bytes: vector<u8>,
        clock: &Clock,
        game_store: &mut GameStore,
        ctx: &mut TxContext
    ) {
        // robo object UID.
        let obj_uid = object::new(ctx);

        // generate serial number.
        let serial_number = utils::gen_robo_serial_number(&obj_uid);

        // new robo object.
        let robo = Robo {
            id: obj_uid,
            name: string::utf8(name_bytes),
            description: string::utf8(desc_bytes),
            serial_number,
        };

        // new robo game data
        let id = object::uid_to_inner(&robo.id);
        let nature = get_robo_nature(serial_number);
        core::init_robo_data(
            id,
            nature,
            clock::timestamp_ms(clock),
            game_store
        );

        // transfer robo object to the owner.
        let owner = sender(ctx);
        transfer::public_transfer(robo, owner);
        event::emit(RoboBuilt { id, owner });
    }

    #[allow(lint(custom_state_change))]
    /// 转移机器人
    entry fun transfer_robo(robo: Robo, to: address) {
        transfer::transfer(robo, to);
    }


    /// 结算机器人的金库收益
    entry fun settle_robo_economy(robo: &Robo, clock: &Clock, game_store: &mut GameStore) {
        core::settle_robo_economy(object::id(robo), clock, game_store);
    }


    /// 机器人使用金库购买能量值
    entry fun buy_energy(robo: &Robo, count: u64, clock: &Clock, game_store: &mut GameStore) {
        core::buy_energy(object::id(robo), count, clock, game_store);
    }


    /// 升级机器人
    entry fun upgrade_robo(robo: &Robo, game_store: &mut GameStore) {
        core::upgrade_robo(object::id(robo), game_store);
    }


    /// 获取机器人的属性
    public(package) fun get_robo_nature(serial_number: u64): u64 {
        let mut race_number = serial_number % 10;
        if (race_number >= 5) {
            race_number = race_number - 5;
        };
        race_number
    }
}
