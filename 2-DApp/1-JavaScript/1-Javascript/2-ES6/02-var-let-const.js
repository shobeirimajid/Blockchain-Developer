/*
    -------------------
    var & let
    -------------------
    In ES6 we have three ways of declaring variables:

        var a = 10;
        const b = 'hello';
        let c = true;
    
    The type of declaration used depends on the necessary scope. 
    Scope is the fundamental concept in all programming languages 
    that defines the visibility of a variable.

    var 
        defines a variable globally, or locally to an "entire function"
        regardless of block scope
    
    let 
        allows you to declare variables that are limited in scope 
        to the block, statement, or expression in which they are used.

    For example:

        if (true) {
            let name = 'Jack';
        }
        // name isn't reachable
        alert(name);


    In this case, 
    the name variable is accessible only in the scope of the if statement 
    because it was declared as let.

    To demonstrate the difference in scope between var and let,
    consider this example:


        function varTest() {
            var x = 1;
            if (true) {
                var x = 2;          // same variable
                console.log(x);     // 2
            }
            console.log(x);         // 2
        }

        function letTest() {
            let x = 1;
            if (true) {
                let x = 2;          // different variable
                console.log(x);     // 2
            }
            console.log(x);         // 1
        }

        varTest();
        letTest();


    -------------------
    const
    -------------------
    const variables have the same scope as variables declared using let.

    The difference is that const variables are immutable 
        - they are not allowed to be reassigned.
    
    For example, the following generates an exception:

        const a = 'Hello';
        a = 'Bye';

        ERROR:
        TypeError: Assignment to constant variable.
 

    const is not subject to Variable Hoisting too, 
    which means that const declarations do not move to the top of the current execution context.

    Also note that ES6 code will run only in browsers that support it. 
    Older devices and browsers that do not support ES6 will return a syntax error.




    //-----------------------------
    //  Examples
    //-----------------------------
    
    // The "let" keyword allows you to define variables in a lexical scope, 
    // as opposed to a function scope like the var keyword does.
    let myVar = "Billy";

    // Variables defined with let can be reassigned new values.
    myVar = "William";

    // The "const" keyword allows you to define a variable in a lexical scope
    // like with let, but you cannot reassign the value once one has been assigned.

    const pi = 3.14;

    pi = 4.13; // You cannot do this.

*/