/*
    -------------------------------
    Getter Functions
    -------------------------------
    The compiler automatically creates getter functions for all 'public' state variables. 


        --------------------------------------
        Getter functions for public variables
        --------------------------------------
        If you declare a public variable in your contract like thos:

            uint public data = 42;      // State variables can be initialized when they are declared.

        the 'compiler' will generate a function called 'data()' 
            that does not take any arguments 
            and returns a uint, the value of the state variable data. 
        
        
        -------------------------------
        The getter functions have external visibility
        -------------------------------

        If the symbol is accessed internally, it evaluates to a state variable.
            i.e. return data
        
        If it is accessed externally it evaluates to a function
            i.e. this.data() or c.data()

        
        --------------------------------------
        Getter functions for public arrays
        --------------------------------------
        If you have a public state variable of 'array' type
            then you can only retrieve single elements of the array via the generated getter function

        This mechanism exists to avoid high gas costs when returning an entire array
        You can use arguments to specify which individual element to return

        for example :
            uint[] public myArray;
             -> myArray(0)

        If you want to return an entire array in one call
            then you need to write a function, 
            for example:

                function getArray() public view returns (uint[] memory) {
                    return myArray;
                } 

        
        --------------------------------------
        Getter functions for mappings 
        --------------------------------------
        If you have a public state variable of 'mapping' type
            then you can only retrieve single elements of the mapping via the generated getter function 

        This mechanism exists to avoid high gas costs when returning an entire mapping
        You can use arguments to specify which individual element to return

        for example :
            mapping(uint => uint) public map;
             -> map(1)

        If you want to return an entire mapping in one call
            then you need to write a function, 
            for example:

                function getMapping() public view returns (mapping memory) {
                    return myArray;
                } 



*/