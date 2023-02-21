/*
    ---------------------------------------
    Multiple Inheritance and Linearization
    ---------------------------------------


    ------------------------------------
    Diamond Problem
    ------------------------------------
    Languages that allow multiple inheritance have to deal with several problems. 
        One is the Diamond Problem. 
    

    ------------------------------------
              C3 Linearization 
                    and
        directed acyclic graph (DAG)
    ------------------------------------
    Solidity is similar to Python in that it uses “C3 Linearization” 
    to force a specific order in the directed acyclic graph (DAG) of base classes. 
    This results in the desirable property of 'monotonicity' but disallows some inheritance graphs. 
    Especially, the order in which the base classes are given in the is directive is important: 

        You have to list the direct base contracts in the order:

             “most base-like” , .. , “most derived”

        {   Note that this order is the reverse of the one used in Python   }


    Another simplifying way to explain this is that :

    when a function is called that is defined multiple times in different contracts, 
    the given bases are searched from :

    
        right to left  in a depth-first manner and stopping at the first match.

                              <-----------------
        contract Inherited is Base1, Base2, Base3

    
    If a base contract has already been searched, it is skipped.

    ----------------
    Note
    ----------------
    in Python, bases are searched from left to right!



    ------------------------------------------------------
    C3 linearization is not too important in practice
    ------------------------------------------------------
    Due to the fact that :

        you have to explicitly override a function 
        that is inherited from multiple bases without a unique override

    C3 linearization is not too important in practice.

    One area where inheritance linearization is especially important and perhaps not as clear 
    is when :
        there are multiple constructors in the inheritance hierarchy 

     The constructors will always be executed in the linearized order
     regardless of the order in which their arguments are provided in the inheriting contract’s constructor.







*/