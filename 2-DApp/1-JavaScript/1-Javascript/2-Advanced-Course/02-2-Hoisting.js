///////////////////////////////////////////////////////
//                      Hoisting
///////////////////////////////////////////////////////

// Hoisting is JavaScript's default behavior of moving all declarations 
//   to the top of the current scope (current script or the current function)

// JavaScript Declarations are Hoisted
// a variable can be used before it has been declared.

// JavaScript Initializations are Not Hoisted
// JavaScript only hoists declarations, not initializations.


elem = document.getElementById("demo");


// x is not declared, but it will be declared automatically in the global scope by js itself
// variable can be used before it has been declared.
x = 5;                      // Assign 5 to x
elem.innerHTML = x;         // x : 5

var x;                      // Declare x
x = 5;                      // Assign 5 to x
elem.innerHTML = x;         // x : 5


// only the declaration (var x), not the initialization (=5) is hoisted to the top.
elem.innerHTML = x;         // x : undefined
var x;                      // Declare x
x = 5;                      // Assign 5 to x

var x;                      // Declare x
elem.innerHTML = x;         // x : undefined
x = 5;                      // Assign 5 to x




//-----------------------------------------
// let variables
//-----------------------------------------

// Variables defined with `let` are hoisted to the top of the block, but not initialized.

// The block of code is aware of the variable, but it cannot be used until it has been declared.
// The variable is in a "temporal dead zone" from the start of the block until it is declared:


// Using a let variable before it is declared 
//    -> will result in a ReferenceError.

carName = "Volvo";  // ReferenceError
let carName;



//-----------------------------------------
// const variables
//-----------------------------------------
// Variables defined with `const` are hoisted to the top of the block, but not initialized.

// Using a const variable before it is declared 
//    -> will result in a syntax Error.
//       so the code will simply not run.

myCar = "Volvo";
const myCar;
 


//-----------------------------------------
// Declare Your Variables At the Top !
//-----------------------------------------
// Hoisting is (to many developers) an unknown or overlooked behavior of JavaScript.
// If a developer doesn't understand hoisting, programs may contain bugs (errors).

// To avoid bugs, always declare all variables at the beginning of every scope.
// Since this is how JavaScript interprets the code, it is always a good rule.


// JavaScript in `strict mode` does not allow variables to be used if they are not declared.




//-----------------------------------------
// Strict Mode
//-----------------------------------------
/*

Strict mode makes it easier to write "secure" and "cleaner" JavaScript codes.
Strict mode changes previously accepted "bad syntax" into real errors.

Strict Mode indicates that JavaScript code should be executed in a limited mode.

As an example, in normal JavaScript, mistyping a variable name creates a new global variable. 
In strict mode, this will throw an error, making it impossible to accidentally create a global variable.

In normal JavaScript, a developer will not receive any error feedback assigning values to non-writable properties.
With strict mode, you can not assign value to undeclared variables.

In strict mode, any assignment to one of the followings, will throw an error :

    - non-writable property
    - getter-only property
    - non-existing property
    - non-existing variable
    - non-existing object 
*/


//-----------------------------------------
// Browsers Compatibility
//-----------------------------------------

// "use strict" was new in ECMAScript version 5.
// "use strict" only matters to new compilers that "understand" the meaning of it.
// All modern browsers 

// IE 9 and lower don't support "use strict"
// but they will not throw an error even if it does not understand it.

// Because the syntax, for declaring strict mode, was designed to be compatible with older versions of JavaScript.
// "use strict" is not a statement, but a literal expression and is just a string 
// so just simply ignored by earlier versions of JavaScript 



//---------------------------
// Declaring Strict Mode
//---------------------------

// The "use strict" directive is only recognized at the beginning of a `script` or a `function`

// Strict mode is declared by adding "use strict";
"use strict";



// Declared at the beginning of a script, it has global scope 
//  (all code in the script will execute in strict mode):

"use strict";
x = 3.14;       // This will cause an error because x is not declared


"use strict";
myFunction();

function myFunction() {
  y = 3.14;   // This will also cause an error because y is not declared
}


// Declared inside a function, it has local scope 
// (only the code inside the function is in strict mode):

x = 3.14;       // This will not cause an error.
myFunction();

function myFunction() {
  "use strict";
  y = 3.14;   // This will cause an error
}


//-----------------------------
// Not Allowed in Strict Mode
//-----------------------------

// 1. Using a variable or object, without declaring it
"use strict";
x = 3.14;                // This will cause an error

"use strict";
x = {p1:10, p2:20};      // This will cause an error


// 2. Deleting a variable (or object) is not allowed.
"use strict";
let x = 3.14;
delete x;                // This will cause an error


// 3. Deleting a function is not allowed.
"use strict";
function x(p1, p2) {};
delete x;                // This will cause an error 


// 4. Duplicating a parameter name is not allowed:
"use strict";
function x(p1, p1) {};   // This will cause an error


// 5. Octal numeric literals are not allowed:
"use strict";
let x = 010;             // This will cause an error


// 6. Octal escape characters are not allowed:
"use strict";
let x = "\010";            // This will cause an error


// 7. Writing to a read-only property is not allowed:
"use strict";
const obj = {};
Object.defineProperty(obj, "x", {value:0, writable:false});

obj.x = 3.14;            // This will cause an error


// 8. Writing to a get-only property is not allowed:
"use strict";
const obj = {get x() {return 0} };

obj.x = 3.14;            // This will cause an error


// 9. Deleting an undeletable property is not allowed:
"use strict";
delete Object.prototype; // This will cause an error


// 10. The word eval cannot be used as a variable:
"use strict";
let eval = 3.14;         // This will cause an error


// 11. The word arguments cannot be used as a variable:
"use strict";
let arguments = 3.14;    // This will cause an error


// 12. The with statement is not allowed:
"use strict";
with (Math){x = cos(2)}; // This will cause an error


// 13. eval() is not allowed to create variables in the scope from which it was called.
//     For security reasons

// In strict mode, a variable can not be used before it is declared:
"use strict";
eval ("x = 2");
alert (x);      // This will cause an error


// In strict mode, eval() can not declare a variable using the var keyword:
"use strict";
eval ("var x = 2");
alert (x);    // This will cause an error

// eval() can not declare a variable using the let keyword:
eval ("let x = 2");
alert (x);        // This will cause an error



//-----------------------------
// this in Strict Mode
//-----------------------------

// The `this` keyword refers to the object that called the function.

// In strict mode, this in functions behaves differently

// If the object is not specified :

//    - In Normal Mode:
//      functions will return the `global object` (window)

//    - In Strict Mode:       
//      functions will return `undefined` 

"use strict";
function myFunction() {
  alert(this); // will alert "undefined"
}
myFunction();





//-----------------------------
// Future Proof!
//-----------------------------
/*

Keywords reserved for future JavaScript versions can NOT be used as variable names in strict mode.

    These are:

        - implements
        - interface
        - let
        - package
        - private
        - protected
        - public
        - static
        - yield
*/

"use strict";
let public = 1500;      // This will cause an error