/*
    -----------------------------
    1. State Variable Visibility
    -----------------------------     


        -----------------
        public variables
        -----------------
        "Public" state variables differ from "internal" ones only in that the 
            compiler automatically generates "getter functions" for them
            which allows other contracts to read their values. 

            within the same contract:
            string public x;
        
                external access, invokes the getter 
                    -----------------------
                    this.x  ---->   x()
                    -----------------------
                internal access, gets the variable value directly from storage
                    -----------------------
                    x   --->    x.value
                    -----------------------
        

        -----------------
        internal variables
        -----------------
        Internal state variables can only be accessed from 

            (1) within the contract they are defined in 
            (2) in derived contracts
        
        They cannot be accessed externally!
        
        This is the "default visibility" level for state variables.
        
        
        -----------------
        private variables
        -----------------
        "Private" state variables are like "internal" ones
            but they are not visible in derived contracts.

            ------------
            ! Warning !
            ------------
            Be careful about State Visibilities!
            This is the case that usually causes misunderstood
            Making something 'private' or 'internal' 
                only prevents other contracts from reading or modifying the information, 
            but it will still be visible to the whole world outside of the blockchain.

        -------------------------------
        visibility specifier location
        -------------------------------
        visibility specifier for state variables 
        is given after the type 
        ex. 
            uint public a;

        --------------------
        Default Visibility
        --------------------
        internal



    -----------------------------
    2. Function Visibility
    -----------------------------
    Solidity knows two kinds of function calls: 

        1- external calls
            do create an actual EVM 'message call' 

        2- internal calls 
            don't create an actual EVM 'message call' 
            
    Furthermore, 'internal' functions 'can be made inaccessible' to derived contracts! 
    
    This gives rise to four types of visibility for functions:
        - external
        - public
        - internal
        - private

        -----------------
        external functions
        -----------------
        External functions are part of the contract 'interface'
        which means: 
            they can be called from 'other contracts' and via 'transactions'
        
        An 'external function' f cannot be called internally!

            f()         does not work
            this.f()    works


        -----------------
        public functions
        -----------------
        Public functions are part of the contract 'interface' 

        Public functions can be either called:

            - 'internally' 
            - 'externally via message calls'


        -----------------
        internal functions
        -----------------
        Internal functions can only be accessed from :

            - within the current contract 
            - contracts deriving from it. 
        
        They cannot be accessed externally!
            Since they are not exposed to the outside through the 'contract’s ABI'

        they can take 'parameters of internal types' like mappings or storage references.


        -----------------
        private functions
        -----------------
        Private functions are like 'internal' ones 
        but they are 'not visible' in 'derived contracts'

            ------------
            ! Warning !
            ------------
            Making something private or internal 
            only prevents other contracts from reading or modifying the information, 
            but it will still be visible to the whole world outside of the blockchain.

        -------------------------------
        visibility specifier location
        -------------------------------
        visibility specifier for functions 
        is givenand between 'parameter list' and 'return parameter list'
        ex. 
            function sum(uint a, uint b) public returns (uint s)

        --------------------
        Default Visibility
        --------------------
        private

*/