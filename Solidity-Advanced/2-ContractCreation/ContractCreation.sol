/*
    Contract Creating

    /// https://docs.soliditylang.org/en/v0.8.18/control-structures.html#creating-contracts-via-new

    /// https://docs.soliditylang.org/en/v0.8.18/contracts.html#creating-contracts
   

    A contract can create other contracts using the new keyword. 
    The full code of the contract being created has to be known when the creating contract is compiled
     so recursive creation-dependencies are not possible.

    As seen in the example, it is possible to send Ether while creating an instance of D using the value option,
     but it is not possible to limit the amount of gas. 
    If the creation fails (due to out-of-stack, not enough balance or other problems), an exception is thrown.

*/