/*
    -----------------------------------
    SMTChecker and Formal Verification
    -----------------------------------
    https://docs.soliditylang.org/en/latest/smtchecker.html


    Using formal verification it is possible to perform 
    an automated mathematical proof that your source code fulfills a certain formal specification. 
    The specification is still formal (just as the source code), but usually much simpler.

    Note that formal verification itself can only help you 
    understand the difference between 

        - what you did (the specification) and
        - how you did it (the actual implementation). 
        
    You still need to check whether the specification is 

        - what you wanted and that 
        - you did not miss any unintended effects of it.

    Solidity implements a formal verification approach 
        based on SMT (Satisfiability Modulo Theories) and Horn solving. 
    
    The SMTChecker module automatically tries to prove 
    that the code satisfies the specification given by require and "assert" statements. 
    
    That is, it considers require statements as assumptions 
    and tries to prove that the conditions inside assert statements are always true. 
    
    If an assertion failure is found, a counterexample may be given to the user 
    showing how the assertion can be violated. 
    
    If no warning is given by the SMTChecker for a property, 
    it means that the property is safe.


    The other verification targets that the SMTChecker checks at compile time are:

        - Arithmetic underflow and overflow

        - Division by zero

        - Trivial conditions and unreachable code

        - Popping an empty array

        - Out of bounds index access

        - Insufficient funds for a transfer

    

*/