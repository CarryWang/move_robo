# Move Robo Contract in Sui

---

测试网部署信息

```shell
Transaction Digest: 3u3nsFTUQmy2XpvSnB5662Ekx6rKvNpe3XFhKzRwNTh2
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                   │
│ Gas Owner: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                │
│ Gas Budget: 78060800 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x00ab3ef1e72f9a3584585681f5091eee0605770c1273e4ebafbf2d5983b8f845                                    │
│  │ Version: 106565039                                                                                        │
│  │ Digest: GwPF66BjMsFpZR2zHAndLRUcsgGgapuFd2Xroge6X13s                                                      │
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
│    pMtr4on/CVhHU1zMuXJ0wU/HUcWuDDLwOO84NT+ezFnCkbzITPlBnXS3hPzc5NuerzZc5Xmu5r6er2AAfh78Bg==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 3u3nsFTUQmy2XpvSnB5662Ekx6rKvNpe3XFhKzRwNTh2                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 463                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x385b198d1ba11c8c28784c3c2034a80a2b3f5b5c31f308093f96480e74bd37b2                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )  │
│  │ Version: 106565040                                                                             │
│  │ Digest: 21RHEivBmoMmpyD3HjDd7ZNrWU3XUdkTVRPZYe4hFvDC                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x65dd8e585031e3f056d374c163c4d7239bcf2e87b3c8c1cf1346d36d6b9d3e17                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )  │
│  │ Version: 106565040                                                                             │
│  │ Digest: g1AxTawV7tFVkWhozJcVvRgAVTiaAiitem5JBuVDJyv                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x77aec5f1a0b32f4973338d52751b7f7e6d07bc73666a064357307abceca180a5                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )  │
│  │ Version: 106565040                                                                             │
│  │ Digest: GQ9sPnB9XvsD7buP9fk2ma3gk583NEDUbySPb5owpoDf                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x7837f36c11c6ecbc32fe11dbf975cfb5f6ea30f997daa9cc25c34d9bc1540049                         │
│  │ Owner: Shared( 106565040 )                                                                     │
│  │ Version: 106565040                                                                             │
│  │ Digest: Fx8aknjX5YLoZu1KN27AeTJuiwnYQ18ZTQ45p2UqHLFh                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xb33a17f0be76309c2119155f59c0ea1cf0623b58536f024276be97f5fd02128e                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: GRKZqRbhbfgLqEtMs51cANanMTj2G8TE1MAzkd3ADXrv                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xc55f9e87a529971884ae3f065c5f84f1bb61053a4a24762e3155980577407a6a                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )  │
│  │ Version: 106565040                                                                             │
│  │ Digest: GdM5wNtgYr9QCk7aXqj7Fo2q2tqXwwXC9ZZzHVKgTkuy                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x00ab3ef1e72f9a3584585681f5091eee0605770c1273e4ebafbf2d5983b8f845                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )  │
│  │ Version: 106565040                                                                             │
│  │ Digest: ExEwsjYiExDwx6HzYhLGu5oSDtuMoG592c2MzALURYon                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x00ab3ef1e72f9a3584585681f5091eee0605770c1273e4ebafbf2d5983b8f845                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )  │
│  │ Version: 106565040                                                                             │
│  │ Digest: ExEwsjYiExDwx6HzYhLGu5oSDtuMoG592c2MzALURYon                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 76060800 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4F36mKgXTMDxRbsEmHYXarEJE5WCuYrLNocKxSFTAJoU                                                   │
│    58LAir5DDFJ97j7M9gfgw6WCtvcSZFPBhndS4TH8Ck6M                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                                   │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                                       │
│  │ EventID: 3u3nsFTUQmy2XpvSnB5662Ekx6rKvNpe3XFhKzRwNTh2:0                                                                 │
│  │ PackageID: 0xb33a17f0be76309c2119155f59c0ea1cf0623b58536f024276be97f5fd02128e                                           │
│  │ Transaction Module: robo                                                                                                │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                              │
│  │ EventType: 0x2::display::DisplayCreated<0xb33a17f0be76309c2119155f59c0ea1cf0623b58536f024276be97f5fd02128e::robo::Robo> │
│  │ ParsedJSON:                                                                                                             │
│  │   ┌────┬────────────────────────────────────────────────────────────────────┐                                           │
│  │   │ id │ 0x385b198d1ba11c8c28784c3c2034a80a2b3f5b5c31f308093f96480e74bd37b2 │                                           │
│  │   └────┴────────────────────────────────────────────────────────────────────┘                                           │
│  └──                                                                                                                       │
│  ┌──                                                                                                                       │
│  │ EventID: 3u3nsFTUQmy2XpvSnB5662Ekx6rKvNpe3XFhKzRwNTh2:1                                                                 │
│  │ PackageID: 0xb33a17f0be76309c2119155f59c0ea1cf0623b58536f024276be97f5fd02128e                                           │
│  │ Transaction Module: robo                                                                                                │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                              │
│  │ EventType: 0x2::display::VersionUpdated<0xb33a17f0be76309c2119155f59c0ea1cf0623b58536f024276be97f5fd02128e::robo::Robo> │
│  │ ParsedJSON:                                                                                                             │
│  │   ┌─────────┬──────────┬───────┬─────────────────────────────────────────────────┐                                      │
│  │   │ fields  │ contents │ key   │ name                                            │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ {name}                                          │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ key   │ link                                            │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ https://robohash.org/{serial_number}            │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ key   │ image_url                                       │                                      │
│  │   │         │          ├───────┼─────────────────────────────────────────────────┤                                      │
│  │   │         │          │ value │ https://robohash.org/{serial_number}.png        │                                      │
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
│  │   │ id      │ 0x385b198d1ba11c8c28784c3c2034a80a2b3f5b5c31f308093f96480e74bd37b2 │                                      │
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
│  │ ObjectID: 0x385b198d1ba11c8c28784c3c2034a80a2b3f5b5c31f308093f96480e74bd37b2                                       │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )                      │
│  │ ObjectType: 0x2::display::Display<0xb33a17f0be76309c2119155f59c0ea1cf0623b58536f024276be97f5fd02128e::robo::Robo>  │
│  │ Version: 106565040                                                                                                 │
│  │ Digest: 21RHEivBmoMmpyD3HjDd7ZNrWU3XUdkTVRPZYe4hFvDC                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x65dd8e585031e3f056d374c163c4d7239bcf2e87b3c8c1cf1346d36d6b9d3e17                                       │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )                      │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                               │
│  │ Version: 106565040                                                                                                 │
│  │ Digest: g1AxTawV7tFVkWhozJcVvRgAVTiaAiitem5JBuVDJyv                                                                │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x77aec5f1a0b32f4973338d52751b7f7e6d07bc73666a064357307abceca180a5                                       │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )                      │
│  │ ObjectType: 0xb33a17f0be76309c2119155f59c0ea1cf0623b58536f024276be97f5fd02128e::core::AdminCap                     │
│  │ Version: 106565040                                                                                                 │
│  │ Digest: GQ9sPnB9XvsD7buP9fk2ma3gk583NEDUbySPb5owpoDf                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x7837f36c11c6ecbc32fe11dbf975cfb5f6ea30f997daa9cc25c34d9bc1540049                                       │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                         │
│  │ Owner: Shared( 106565040 )                                                                                         │
│  │ ObjectType: 0xb33a17f0be76309c2119155f59c0ea1cf0623b58536f024276be97f5fd02128e::core::GameStore                    │
│  │ Version: 106565040                                                                                                 │
│  │ Digest: Fx8aknjX5YLoZu1KN27AeTJuiwnYQ18ZTQ45p2UqHLFh                                                               │
│  └──                                                                                                                  │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0xc55f9e87a529971884ae3f065c5f84f1bb61053a4a24762e3155980577407a6a                                       │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )                      │
│  │ ObjectType: 0x2::package::Publisher                                                                                │
│  │ Version: 106565040                                                                                                 │
│  │ Digest: GdM5wNtgYr9QCk7aXqj7Fo2q2tqXwwXC9ZZzHVKgTkuy                                                               │
│  └──                                                                                                                  │
│ Mutated Objects:                                                                                                      │
│  ┌──                                                                                                                  │
│  │ ObjectID: 0x00ab3ef1e72f9a3584585681f5091eee0605770c1273e4ebafbf2d5983b8f845                                       │
│  │ Sender: 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb                                         │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )                      │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                         │
│  │ Version: 106565040                                                                                                 │
│  │ Digest: ExEwsjYiExDwx6HzYhLGu5oSDtuMoG592c2MzALURYon                                                               │
│  └──                                                                                                                  │
│ Published Objects:                                                                                                    │
│  ┌──                                                                                                                  │
│  │ PackageID: 0xb33a17f0be76309c2119155f59c0ea1cf0623b58536f024276be97f5fd02128e                                      │
│  │ Version: 1                                                                                                         │
│  │ Digest: GRKZqRbhbfgLqEtMs51cANanMTj2G8TE1MAzkd3ADXrv                                                               │
│  │ Modules: battle, core, robo, utils                                                                                 │
│  └──                                                                                                                  │
╰───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x5bdcb0dd355f072607a5643b72197ec4409ab053856165d4b32b166a6cdcd6cb )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -76082680                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```