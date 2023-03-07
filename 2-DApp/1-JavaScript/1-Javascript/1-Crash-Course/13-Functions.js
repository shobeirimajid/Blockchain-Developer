///////////////////////////////////////////////////////
//                     Functions
///////////////////////////////////////////////////////
/*

A JavaScript function is a block of code designed to perform a particular task.

A JavaScript function is defined with the function keyword, 
    followed by a name, 
    followed by parentheses ().
    Function names can contain 
    letters, digits, underscores, and dollar signs (same rules as variables).

The parentheses may include parameter names separated by commas:
    (parameter1, parameter2, ...)

The code to be executed, by the function, is placed inside curly brackets: {}

*/


    function name(parameter1, parameter2, parameter3) {
        // code to be executed
    }


/*
Variables declared within a JavaScript function, become LOCAL to the function.
    Local variables can only be accessed from within the function.

Since local variables are only recognized inside their functions, 
    variables with the same name can be used in different functions.

Local variables are created when a function starts, 
    and deleted when the function is completed.
*/

    // code here can NOT use carName
    function myFunction() {
        let carName = "Volvo";
        // code here CAN use carName
    }
    // code here can NOT use carName


    
/*
Function parameters are listed inside the parentheses () in the function definition.
Function arguments are the values received by the function when it is invoked.
Inside the function, the arguments (the parameters) behave as local variables.
*/


    function myFunction(thing){
        return thing.toUpperCase();
    }
    myFunction("foo"); // = "FOO"


/*
--------------------
Function Invocation
--------------------
A JavaScript function is executed when "something" invokes it (calls it):
    - When an event occurs (when a user clicks a button)
    - When it is invoked (called) from JavaScript code
    - Automatically (self invoked)

When JavaScript reaches a return statement, the function will stop executing.
If the function was invoked from a statement, 
    JavaScript will "return" to execute the code after the invoking statement.

Functions often compute a return value. 
    The return value is "returned" back to the "caller"

Note that the value to be returned must start on the same line as the `return` keyword, 
    otherwise you'll always return `undefined` due to automatic semicolon insertion. 
    Watch out for this when using Allman style.
*/

    function myFunction(){
        return // <- semicolon automatically inserted here
        {thisIsAn: 'object literal'};
    }
    myFunction(); // = undefined



    var x = myFunction(4, 3);   // Function is called, return value will end up in x ---> 12

    function myFunction(a, b) {
    return a * b;             // Function returns the product of a and b
    }



/*
Accessing a function without () will return the function object instead of the function result.
    myFunction      refers to the   function object
    myFunction()    refers to the   function result
*/




//------------------------------
// Function Expression vs Function Declaration
//------------------------------

// Function Declaration
// A Function Expression is created when the execution reaches it and is usable only from that moment.
function sum(a, b) {
    return a + b;
}

// Function Expression
// A Function Declaration can be called earlier than it is defined.
let sum = function(a, b) {
    return a + b;
};






/*
------------------------------
Function as Variable Value
------------------------------
Functions can be used the same way as you use variables, 
in all types of formulas, assignments, and calculations.

Instead of using a variable to store the return value of a function:
*/
    var x = toCelsius(77);
    var text = "The temperature is " + x + " Celsius";

// You can use the function directly, as a variable value:

    var text = "The temperature is " + toCelsius(77) + " Celsius";



/*
---------------
Why Functions
---------------
You can reuse code: Define the code once, and use it many times.
You can use the same code many times with different arguments, to produce different results.

JavaScript functions are first class objects
so they can be reassigned to different variable names and passed to other functions as arguments 
    fo example: when supplying an event handler.
/*




/*
----------------
setTimeout
----------------
setTimeout isn't part of the JS language, but is provided by browsers and Node.js.
*/
    function myFunction(){
        // this code will be called in 5 seconds' time
    }
    setTimeout(myFunction, 5000);


    // Function objects don't even have to be declared with a name - 
    // you can write an anonymous function definition directly into the arguments of another.

    setTimeout(function(){
        // this code will be called in 5 seconds' time
    }, 5000);



/* 
----------------
setInterval
----------------
Another function provided by browsers is setInterval
The setInterval() method calls a function or evaluates an expression 
at specified intervals (in milliseconds).
*/

    function myFunction(){
        // this code will be called every 5 seconds
        alert('setInterval');
    }
    // This will call the myFunction every 5 seconds (1000 ms = 1 second).
    var h = setInterval(myFunction, 5000);

    // It will continue calling the function until  
    // clearInterval() is called or the window is closed.

    clearInterval(h);



// JavaScript has function scope; 
// functions get their own scope but other blocks do not.

    if (true){
        var i = 5;
    }
    i; // = 5 - not undefined as you'd expect in a block-scoped language



// This has led to a common pattern of "immediately-executing anonymous functions"
// which prevent temporary variables from leaking into the global scope.

    (function(){
        var temporary = 5;
        // We can access the global scope by assigning to the "global object", which
        // in a web browser is always `window`. The global object may have a
        // different name in non-browser environments such as Node.js.
        window.permanent = 10;
    })();

    temporary; // raises ReferenceError
    permanent; // = 10



/* 
----------------
closures
----------------
One of JavaScript's most powerful features is closures. 
If a function is defined inside another function, 
the inner function has access to all the outer function's variables, 
even after the outer function exits.
*/

    function sayHelloInFiveSeconds(name){
        var prompt = "Hello, " + name + "!";
        // Inner functions are put in the local scope by default, as if they were
        // declared with `var`.
        function inner(){
            alert(prompt);
        }
        setTimeout(inner, 5000);

        // setTimeout is asynchronous, so the sayHelloInFiveSeconds function will
        // exit immediately, and setTimeout will call inner afterwards. However,
        // because inner is "closed over" sayHelloInFiveSeconds, inner still has
        // access to the `prompt` variable when it is finally called.
    }
    sayHelloInFiveSeconds("Adam"); // will open a popup with "Hello, Adam!" in 5s



/* 
--------------------
function in object
--------------------
functions can be inside an object
*/

    var myObj = {
        myFunc: function(){
            return "Hello world!";
        }
    };

    myObj.myFunc(); // = "Hello world!"



/*
--------------------
this
--------------------
When functions attached to an object are called, they can access the object
they're attached to using the `this` keyword.
*/

    myObj = {
        myString: "Hello world!",
        myFunc: function(){
            return this.myString;
        }
    };

    myObj.myFunc(); // "Hello world!"



// What `this` is set to has to do with 
// how the function is called, 
// not where it's defined. 
// So, our function doesn't work if it isn't called in the context of the object.

    var myFunc = myObj.myFunc;
    myFunc(); // = undefined



// Inversely, a function can be assigned to the object and gain access to it
// through `this`, even if it wasn't attached when it was defined.

    var myOtherFunc = function(){
        return this.myString.toUpperCase();
    };
    myObj.myOtherFunc = myOtherFunc;
    myObj.myOtherFunc(); // "HELLO WORLD!"


/*
---------------------------------
context : call , apply, bind
---------------------------------
We can also specify a context for a function to execute in when we invoke it
using `call` or `apply`.
*/

    var anotherFunc = function(s){
        return this.myString + s;
    };
    anotherFunc.call(myObj, " And Hello Moon!"); // = "Hello World! And Hello Moon!"



// The `apply` function is nearly identical, but takes an array for an argument list.

    anotherFunc.apply(myObj, [" And Hello Sun!"]); // = "Hello World! And Hello Sun!"



// This is useful when working with a function that accepts a sequence of
// arguments and you want to pass an array.

    Math.min(42, 6, 27); // = 6
    Math.min([42, 6, 27]); // = NaN (uh-oh!)
    Math.min.apply(Math, [42, 6, 27]); // = 6



// But, `call` and `apply` are only temporary. 
// When we want it to stick, we can use `bind`.

    var boundFunc = anotherFunc.bind(myObj);
    boundFunc(" And Hello Saturn!"); // = "Hello World! And Hello Saturn!"



// `bind` can also be used to partially apply (curry) a function.

    var product = function(a, b){ return a * b; };
    var doubler = product.bind(this, 2);
    doubler(8); // = 16



/*
---------------------------------
constructors
---------------------------------
When you call a function with the `new` keyword, a new object is created, and
made available to the function via the `this` keyword. Functions designed to be
called like that are called constructors.
*/

    var MyConstructor = function(){
        this.myNumber = 5;
    };
    
    myNewObj = new MyConstructor(); // = {myNumber: 5}
    myNewObj.myNumber; // = 5



//---------------------------------
//          Examples
//---------------------------------

function main() {
    var num1 = parseInt(readLine(),10);
    var num2 = parseInt(readLine(),10);
    var num3 = parseInt(readLine(),10);
    var average = avg(num1, num2, num3)
    console.log(average)
}

function avg(n1, n2, n3){
    return ((n1+n2+n3)/3);
}

main();