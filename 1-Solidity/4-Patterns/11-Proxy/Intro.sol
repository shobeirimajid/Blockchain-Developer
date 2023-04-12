/*

There are many proxy standards out in the wild. 
But which one is the best fit for your application? 
Let's find out how they all work and what their use cases are.



------------------------
- Transparent proxy
------------------------
Probably the most popular proxy standard there is. 
Based on EIP-1967 it operates two roles: regular users and proxy admin. 
Calls from regular users get delegatecalled to the implementation, 
yet proxy admin (usually a separate contract) is only allowed to upgrade and interact with the proxy itself.

Transparent proxy works best with standalone contracts that neither can nor want to deal with upgradeability. 
The proxy does it all. Check EIP-6224 for reference.



------------------------
- UUPS proxy
------------------------
UUPS proxy is also based on EIP-1967, but contrary to Transparent proxy, 
there are no proxy admins and upgradeability logic is handled by the implementation directly. 
Basically, implementation reflectively upgrades itself.

UUPS proxy is designed for standalone contracts that want entire control over their upgrades. 
For example, I once used back-end signatures to perform such UUPS upgrades.



------------------------
- Beacon proxy
------------------------
Beacon proxies work on top of EIP-1967 as well, however, they are a bit different - they don't control the implementation directly. 
Rather before each delegatecall, they query a special Beacon for the implementation address. 
This approach creates an amazing opportunity to cheaply mass-upgrade many proxies that point to the same beacon.

Beacon proxy is intended for contracts that need upgradeability and are deployed via factories. 
Changing the implementation inside the beacon will upgrade the deployed proxies all at once.



------------------------
- Minimal proxy (clones)
------------------------
Minimal proxies or clones (EIP-1167) are proxy contracts with a minimal possible bytecode to become a proxy. 
They are really cheap to deploy and the implementation address (which can't be upgraded) is usually hardcoded into their bytecode.

Clones are used in applications that require numerous one-time alike contracts. 
For instance, user deposit addresses for decentralized bridges can be generated this way.


------------------------
- Diamond proxy *
------------------------
Diamond proxy (EIP-2535) is a facade pattern that is designed to deal with the 24kb bytecode limit.
Diamond proxies carefully control many implementations (facets) that operate with dedicated storage to overcome storage collisions. 
The Diamond proxy keeps track of its function selectors and uses them to deduce which facet to delegatecall.

Diamond proxy is recommended for contracts that want to crank a lot of logic in. 
Many DAOs and L2 rollup contracts leverage the diamond design.


------------------------
- Inherited storage & Eternal storage proxy
------------------------
The idea behind these proxies is to have a common storage contract that both proxy and implementation inherit. 
This allows fine control over the storage layout upgradeability that may be handled by either proxy or implementation directly.

This is a legacy pattern and its usage is discouraged.
*/