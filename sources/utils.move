module move_robo::utils {
    use std::hash;

    /// Generating the robo's serial number.
    public(package) fun gen_robo_serial_number(id: &UID): u64 {
        // hashing on the robo's UID.
        let mut hash = hash::sha2_256(object::uid_to_bytes(id));

        let mut result_num: u64 = 0;
        // convert the hash vector to u64.
        while (vector::length(&hash) > 0) {
            let element = vector::remove(&mut hash, 0);
            result_num = ((result_num << 8) | (element as u64));
        };

        // keep the last 6 digits.
        result_num = result_num % 100000u64;

        result_num
    }

    public(package) fun gen_robo_image_id(id: &UID): address {
        object::uid_to_address(id)
    }

    public(package) fun random_in_range(range: u64, ctx: &mut TxContext): u64 {
        let uid = object::new(ctx);
        let mut hash = hash::sha2_256(object::uid_to_bytes(&uid));
        object::delete(uid);

        let mut result_num: u64 = 0;
        while (vector::length(&hash) > 0) {
            let element = vector::remove(&mut hash, 0);
            result_num = (result_num << 8) | (element as u64);
        };
        result_num = result_num % range;

        result_num
    }
}