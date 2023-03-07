///////////////////////////////////////////////////////
//                      Scope
///////////////////////////////////////////////////////

// In ES6 we have three ways of declaring variables to store data values:

var a = 'hello';
const b = 'hello';
let c = 'hello';

// The type of declaration used depends on the necessary scope. 



/*
------------------
What is Scope
------------------
Scope is the fundamental concept in all programming languages 

Scope determines the accessibility (visibility) of variables from different parts of the code.

NOTE :: In JavaScript, objects and functions are also variables.

JavaScript has 3 types of scope :

    - Block scope
    - Function scope
    - Global scope
*/



/*
------------------
Block Scope
------------------
Before ES6, JavaScript had only 2 Scopes :

    - Global 
    - Function

ES6 (2015) introduced two important new JavaScript keywords :   
    - let   
    - const

These two keywords provide a new scope in JavaScript :
    - Block Scope  
*/



// difference between `var` , `let` , `const`


// ---------- var ----------

// Variables declared with the `var` can NOT have `block scope`
// var defines a variable globally, or locally to an "entire function"
// Variables declared inside a block, can be accessed from outside the block.

{
    var x = 2;
}
// x CAN be used here


if (true) {
    var x = 'Jack';
}
alert(x);    // OK



// ---------- let ----------

// allows you to declare variables that are limited in scope to the 
//  block, statement, or expression in which they are used.
// Variables declared inside a block cannot be accessed from outside the block:

// x was declared as `var` and is accessible both inside and outside the if block    
function varTest() {
    var x = 1;
    if (true) {
        var x = 2;          // same variable
        console.log(x);     // 2
    }
    console.log(x);         // 2
}


{
    let x = 2;
}
// x can NOT be used here


if (true) {
    let x = 'Jack';
}
alert(x);    // x isn't reachable


// x was declared as `let` and is accessible only in the scope of the if block    
function letTest() {
    let x = 1;
    if (true) {
        let x = 2;          // different variable
        console.log(x);     // 2
    }
    console.log(x);         // 1
}



// Variables defined with let :

//    - can be Reassigned new values.
//    - but cannot be Redeclared (With var you can!)
//    - must be Declared before use
//    - have Block Scope


let a = "Volvo";
a = "Ford";
let a; // ERROR



// ---------- const ----------

// `const` variables have the same scope as `let`

/*
The difference is that :

    - const variables are immutable and are not allowed to be reassigned.
        JavaScript const variables must be assigned a value when they are declared

    - const variables cannot be Redeclared.

    - const variables have Block Scope.
*/

const a = 'Hello';
a = 'Bye';

// ERROR:
// TypeError: Assignment to constant variable.

/*
Use const when you declare:
A new Array
A new Object
A new Function
A new RegExp


The keyword const is a little misleading. It does not define a constant value. 
It defines a constant `reference` to a value.

Because of this you can NOT:

Reassign a constant value
Reassign a constant array
Reassign a constant object

But you CAN:

Change the elements of constant array
Change the properties of constant object
*/


// The "const" keyword allows you to define a variable in a lexical scope
// like with let
// but you cannot reassign the value once one has been assigned.

const pi = 3.14;

pi = 4.13;          // ERROR :: you cannot reassign the value once one has been assigned.
const pi = 4.13;    // ERROR :: You cannot re-declare a variable declared with const

// You can create a constant array:
const cars = ["Saab", "Volvo", "BMW"];

// You can change an element:
cars[0] = "Toyota";

// You can add an element:
cars.push("Audi");

cars = ["Toyota", "Volvo", "Audi"];    // ERROR




//------------------
//  Function Scope
//------------------

// JavaScript has function scope: Each function creates a new scope.
// Variables defined inside a function are not accessible (visible) from outside the function.

// Variables declared with `var`, `let` and `const` are quite similar when declared inside a function.
//  They all have Function Scope:


function myFunction() {
    var carName = "Volvo";   // Function Scope
}

function myFunction() {
    let carName = "Volvo";   // Function Scope
}

function myFunction() {
    const carName = "Volvo";   // Function Scope
}


//  --- Local Scope ---

// Variables declared within a JavaScript function, become LOCAL to the function.

// Local variables have Function Scope:
//    They can only be accessed from within the function.

// Since local variables are only recognized inside their functions, 
//   variables with the same name can be used in different functions.

// Local variables are created when a function starts, 
//   and deleted when the function is completed.

// Function arguments (parameters) work as local variables inside functions.


// code here can NOT use carName

function myFunction() {
    let carName = "Volvo";
    // code here CAN use carName
}
  
// code here can NOT use carName




//---------------------
//  Global Scope
//---------------------

// --- Global Variables ---

// A variable declared outside a function, becomes GLOBAL.
//   All scripts and functions on a web page can access Global Variables

// WARNING ::   Do NOT create global variables unless you intend to.
// Your global variables (or functions) can overwrite window variables (or functions).
// Any function, including the window object, can overwrite your global variables and functions.


let carName2 = "Volvo";
// code here can use carName2

function myFunction() {
    // code here can also use carName2
}


// Variables declared Globally (outside any function) have Global Scope.
// Global variables can be accessed from anywhere in a JavaScript program.

// Variables declared with var, let and const are quite similar when declared outside a block.
//    They all have Global Scope:

var x = 2;       // Global scope
let x = 2;       // Global scope
const x = 2;     // Global scope
// code here can use x

function myFunction() {
    // code here can also use x
}


// --- Global Variables in HTML ---

// With JavaScript, the global scope is the JavaScript environment.
// In HTML, the global scope is the window object.

// Global variables defined with the var keyword belong to the window object:
var carName = "Volvo";
// code here can use window.carName

// Global variables defined with the let keyword do not belong to the window object:
let carName = "Volvo";
// code here can not use window.carName




//-----------------------
// Automatically Global
//-----------------------
// If you assign a value to a variable that has not been declared, 
//   it will automatically become a GLOBAL variable.
//   Even if the value is assigned inside a function.

// NOTE ::  In "Strict Mode", undeclared variables are not automatically global.
//          All modern browsers support running JavaScript in "Strict Mode".


// Ex. carName is a global variable

myFunction();

// code here can use carName

function myFunction() {
    carName = "Volvo";
}



//------------------------
// Variables Lifetime
//------------------------
// The lifetime of a JavaScript variable starts when it is declared.
// Function (local) variables are deleted when the function is completed.
// In a web browser, global variables are deleted when you close the browser window (or tab).