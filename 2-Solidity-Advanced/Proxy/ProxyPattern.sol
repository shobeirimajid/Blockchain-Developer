/*           
           
           
           call     ┌────────────────────┐              ┌────────────────────┐
       Proxy.foo()  │                    │              │                    │
User ───────────────►   Proxy Contract   │              │   Logic Contract   │
                    │                    │              │                    │
 ▲                  ├────────────────────┤ delegatecall └────────────────────┤
 │                  │                    ├──────────────►                    │
 │    foo() result  │     fallback()     │              │       foo()        │
 └──────────────────┤                    ◄──────────────┤                    │
                    ├────────────────────┐              └─────────┬──────────┘
                    │                    │                        │
                    │   storage/state    │                        │
                    │                    ├─ ── ── ── ── ── ── ── ─┘
                    └────────────────────┘       (shared state)




    User ---- tx ---> Proxy ----------> Implementation_v0
                     |
                      ------------> Implementation_v1
                     |
                      ------------> Implementation_v2


*/