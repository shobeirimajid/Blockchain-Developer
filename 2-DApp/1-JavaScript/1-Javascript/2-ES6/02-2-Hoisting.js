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



//-----------------------------------------
// Strict Mode
//-----------------------------------------
// JavaScript in `strict mode` does not allow variables to be used if they are not declared.