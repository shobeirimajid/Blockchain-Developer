/*
    -------------------
    var & let
    -------------------
    The let keyword was introduced in ES6 (2015).
    In ES6 we have three ways of declaring variables to store data values:
*/
        var a = 10;
        const b = 'hello';
        let c = true;
/*    
    The type of declaration used depends on the necessary scope. 
    Scope is the fundamental concept in all programming languages 
    that defines the visibility of a variable.

    Before ES6 (2015), JavaScript had only `Global Scope` and `Function Scope`
    ES6 introduced two important new JavaScript keywords: let and const.
    These two keywords provide `Block Scope` in JavaScript.
    Variables declared inside a { } block cannot be accessed from outside the block!


    var 
        defines a variable globally, or locally to an "entire function"
        regardless of block scope
    
    let 
        allows you to declare variables that are limited in scope 
        to the block, statement, or expression in which they are used.

    For example:
*/

        if (true) {
            let name = 'Jack';
        }
        // name isn't reachable
        alert(name);

/*
    In this case, 
    the name variable is accessible only in the scope of the if statement 
    because it was declared as let.

    To demonstrate the difference in scope between var and let,
    consider this example:
*/

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


/*
        Variables defined with let cannot be Redeclared  /  With var you can!
        Variables defined with let must be Declared before use.
        Variables defined with let have Block Scope.
*/




/*
    -------------------
    const
    -------------------
    The const keyword was introduced in ES6 (2015).

    const variables have the same scope as variables declared using let.

    The difference is that :
        - const variables are immutable and are not allowed to be reassigned.
            JavaScript const variables must be assigned a value when they are declared:
        - const variables cannot be Redeclared.
        - const variables have Block Scope.


    For example, the following generates an exception:
*/

        const a = 'Hello';
        a = 'Bye';

        // ERROR:
        // TypeError: Assignment to constant variable.
 
/*
    const is not subject to Variable Hoisting too, 
    which means that const declarations do not move to the top of the current execution context.

    Also note that ES6 code will run only in browsers that support it. 
    Older devices and browsers that do not support ES6 will return a syntax error.

    Use const when you declare:
        A new Array
        A new Object
        A new Function
        A new RegExp


    The keyword const is a little misleading.
    It does not define a constant value. 
        It defines a constant `reference` to a value.

    Because of this you can NOT:

        Reassign a constant value
        Reassign a constant array
        Reassign a constant object

    But you CAN:

        Change the elements of constant array
        Change the properties of constant object
*/



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

    // You can create a constant array:
    const cars = ["Saab", "Volvo", "BMW"];

    // You can change an element:
    cars[0] = "Toyota";

    // You can add an element:
    cars.push("Audi");

    const cars = ["Saab", "Volvo", "BMW"];

    cars = ["Toyota", "Volvo", "Audi"];    // ERROR


//You cannot re-declare a variable declared with let or const.

    // This will not work:

    let carName = "Volvo";
    let carName;