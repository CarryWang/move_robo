# Move Robo Contract in Sui

---

测试网部署信息

---

## v2部署信息

game store object: `0x17a4af7e200229064f7840147f5a958f1b4455fe70850aaeed77280998baef1f`

PackageID: `0xa0649bd62a08ece48486dda4272899274bf09857c5c207fe58237971b2f6764f`

clock object: `0x6`

```shell
Transaction Digest: 3xmhC976FEuUG7UYBHMApgThagkujAC6L5QWeCNJrj3o
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                   │
│ Gas Owner: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                │
│ Gas Budget: 78668800 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x00ab3ef1e72f9a3584585681f5091eee0605770c1273e4ebafbf2d5983b8f845                                    │
│  │ Version: 113549764                                                                                        │
│  │ Digest: DGZqiQH5Uo4fvMnGaHKSaGScEssLdHDmxicnMHAKzsvp                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  └                                                                      │                                  │
│ │                                                                         │                                  │
│ │ 1  TransferObjects:                                                     │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Arguments:                                                           │                                  │
│ │  │   Result 0                                                           │                                  │
│ │  │ Address: Input  0                                                    │                                  │
│ │  └                                                                      │                                  │
│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    F9MlDaIg9gYJ8AyhUfJV5tUWpHEj+X/T//jJamD3MHuIL//zn76tEq/rs2fX5aE2H/EDntF9cFPBQQ7gIVxvDQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3xmhC976FEuUG7UYBHMApgThagkujAC6L5QWeCNJrj3o                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 463                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x17a4af7e200229064f7840147f5a958f1b4455fe70850aaeed77280998baef1f                         │
│  │ Owner: Shared( 113549765 )                                                                     │
│  │ Version: 113549765                                                                             │
│  │ Digest: 8zLWvoiMJNTTn7WbvRxFRUmTeTwM7PLCwKbccdEXnWb2                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x21a3abd4bc9480b72a103fc98ac5b50ff3897ad47dba35195225d25b2c32ee97                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )  │
│  │ Version: 113549765                                                                             │
│  │ Digest: DqwbnGuiX2XFj2CTDZGkddnz4oKQo162NpCg1pBv8Mpi                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x4b2165a880127363bd9f549a22f74b9881c607ee05f5b057bccd895e1952e525                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )  │
│  │ Version: 113549765                                                                             │
│  │ Digest: 7W813tVsYTNRBGNpd22y7MkCYMfFqCGCCy1L73GQdgPP                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x729c9dc7107b106255cd198f2188cdfb5916ade8cc2f405d04fc9a917bbd7dbd                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )  │
│  │ Version: 113549765                                                                             │
│  │ Digest: EdL5bj4Y9Si5fTAww5t2owbsazuJYjxWMroWZ3zTBW56                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xa0649bd62a08ece48486dda4272899274bf09857c5c207fe58237971b2f6764f                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 3oLPKGe9NNxTPkdcn7Rrc8yu3ng2BBvW5UJ1HmzbhTK2                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xee9dc6d9bbb4679b6523d831a298ada705ce02d09df8701ae9708fff968835c9                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )  │
│  │ Version: 113549765                                                                             │
│  │ Digest: GjPTwCyH4DijHjPS4p5FfoqvKgTexRK96pMNYLDNGQ3j                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x00ab3ef1e72f9a3584585681f5091eee0605770c1273e4ebafbf2d5983b8f845                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )  │
│  │ Version: 113549765                                                                             │
│  │ Digest: DVZQRsoEk8e53DC7k4D19vYSErHbK2jheG1ZkQqHRKyC                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x00ab3ef1e72f9a3584585681f5091eee0605770c1273e4ebafbf2d5983b8f845                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )  │
│  │ Version: 113549765                                                                             │
│  │ Digest: DVZQRsoEk8e53DC7k4D19vYSErHbK2jheG1ZkQqHRKyC                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 76668800 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4wD5n7iajMFThHKgieWJNCjQ7ExMsEK4MPnM1k2yLoUK                                                   │
│    58LAir5DDFJ97j7M9gfgw6WCtvcSZFPBhndS4TH8Ck6M                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                   │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                       │
│  │ EventID: 3xmhC976FEuUG7UYBHMApgThagkujAC6L5QWeCNJrj3o:0                                                                 │
│  │ PackageID: 0xa0649bd62a08ece48486dda4272899274bf09857c5c207fe58237971b2f6764f                                           │
│  │ Transaction Module: robo                                                                                                │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                              │
│  │ EventType: 0x2::display::DisplayCreated<0xa0649bd62a08ece48486dda4272899274bf09857c5c207fe58237971b2f6764f::robo::Robo> │
│  │ ParsedJSON:                                                                                                             │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                           │
│  │   │ id │ 0x729c9dc7107b106255cd198f2188cdfb5916ade8cc2f405d04fc9a917bbd7dbd │                                           │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                           │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ EventID: 3xmhC976FEuUG7UYBHMApgThagkujAC6L5QWeCNJrj3o:1                                                                 │
│  │ PackageID: 0xa0649bd62a08ece48486dda4272899274bf09857c5c207fe58237971b2f6764f                                           │
│  │ Transaction Module: robo                                                                                                │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                              │
│  │ EventType: 0x2::display::VersionUpdated<0xa0649bd62a08ece48486dda4272899274bf09857c5c207fe58237971b2f6764f::robo::Robo> │
│  │ ParsedJSON:                                                                                                             │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                      │
│  │   │ fields  │ contents │ key   │ name                                            │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ {name}                                          │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ key   │ link                                            │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ https://robohash.org/{image_id}                 │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ key   │ image_url                                       │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ https://robohash.org/{image_id}.png             │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ key   │ description                                     │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ {description}                                   │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ key   │ project_url                                     │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ https://github.com/CarryWang/move_robo          │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ key   │ creator                                         │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ Carry Wang                                      │                                      │
│  │   ├─────────┼──────────┴───────┴─────────────────────────────────────────────────┤                                      │
│  │   │ id      │ 0x729c9dc7107b106255cd198f2188cdfb5916ade8cc2f405d04fc9a917bbd7dbd │                                      │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                                      │
│  │   │ version │ 1                                                                  │                                      │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                                      │
│  └──                                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                        │
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x17a4af7e200229064f7840147f5a958f1b4455fe70850aaeed77280998baef1f                                       │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                         │
│  │ Owner: Shared( 113549765 )                                                                                         │
│  │ ObjectType: 0xa0649bd62a08ece48486dda4272899274bf09857c5c207fe58237971b2f6764f::core::GameStore                    │
│  │ Version: 113549765                                                                                                 │
│  │ Digest: 8zLWvoiMJNTTn7WbvRxFRUmTeTwM7PLCwKbccdEXnWb2                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x21a3abd4bc9480b72a103fc98ac5b50ff3897ad47dba35195225d25b2c32ee97                                       │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                               │
│  │ Version: 113549765                                                                                                 │
│  │ Digest: DqwbnGuiX2XFj2CTDZGkddnz4oKQo162NpCg1pBv8Mpi                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x4b2165a880127363bd9f549a22f74b9881c607ee05f5b057bccd895e1952e525                                       │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )                      │
│  │ ObjectType: 0xa0649bd62a08ece48486dda4272899274bf09857c5c207fe58237971b2f6764f::core::AdminCap                     │
│  │ Version: 113549765                                                                                                 │
│  │ Digest: 7W813tVsYTNRBGNpd22y7MkCYMfFqCGCCy1L73GQdgPP                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x729c9dc7107b106255cd198f2188cdfb5916ade8cc2f405d04fc9a917bbd7dbd                                       │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )                      │
│  │ ObjectType: 0x2::display::Display<0xa0649bd62a08ece48486dda4272899274bf09857c5c207fe58237971b2f6764f::robo::Robo>  │
│  │ Version: 113549765                                                                                                 │
│  │ Digest: EdL5bj4Y9Si5fTAww5t2owbsazuJYjxWMroWZ3zTBW56                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0xee9dc6d9bbb4679b6523d831a298ada705ce02d09df8701ae9708fff968835c9                                       │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )                      │
│  │ ObjectType: 0x2::package::Publisher                                                                                │
│  │ Version: 113549765                                                                                                 │
│  │ Digest: GjPTwCyH4DijHjPS4p5FfoqvKgTexRK96pMNYLDNGQ3j                                                               │
│  └──                                                                                                                  │
│ Mutated Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x00ab3ef1e72f9a3584585681f5091eee0605770c1273e4ebafbf2d5983b8f845                                       │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                         │
│  │ Version: 113549765                                                                                                 │
│  │ Digest: DVZQRsoEk8e53DC7k4D19vYSErHbK2jheG1ZkQqHRKyC                                                               │
│  └──                                                                                                                  │
│ Published Objects:                                                                                                    │
│  ┌──                                                                                                                  │
│  │ PackageID: 0xa0649bd62a08ece48486dda4272899274bf09857c5c207fe58237971b2f6764f                                      │
│  │ Version: 1                                                                                                         │
│  │ Digest: 3oLPKGe9NNxTPkdcn7Rrc8yu3ng2BBvW5UJ1HmzbhTK2                                                               │
│  │ Modules: battle, core, robo, utils                                                                                 │
│  └──                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -76690680                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯



```