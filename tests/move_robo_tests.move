#[test_only]
module move_robo::move_robo_tests {

    use std::debug;
    use sui::test_scenario;
    use sui::object;
    use sui::object::delete;
    use sui::transfer::public_freeze_object;
    use move_robo::utils::gen_robo_serial_number;

    #[test]
    fun test_gen_robo_serial_number() {
        let mut scenario = test_scenario::begin(@0x1);

        let ctx = test_scenario::ctx(&mut scenario);


        let id = object::new(ctx);
        let serial_number = gen_robo_serial_number(&id);
        delete(id);

        debug::print(&serial_number);

        assert!(serial_number < 1000000, 0);

        test_scenario::end(scenario);
    }
}

