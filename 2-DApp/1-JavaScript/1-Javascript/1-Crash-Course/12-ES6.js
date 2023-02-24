///////////////////////////////////////////////////////
//                      ES6 Additions
///////////////////////////////////////////////////////

// The "let" keyword allows you to define variables in a lexical scope, 
// as opposed to a function scope like the var keyword does.
let myVar = "Billy";

// Variables defined with let can be reassigned new values.
myVar = "William";

// The "const" keyword allows you to define a variable in a lexical scope
// like with let, but you cannot reassign the value once one has been assigned.

const pi = 3.14;

pi = 4.13; // You cannot do this.

// There is a new syntax for functions in ES6 known as "lambda syntax".
// This allows functions to be defined in a lexical scope like with variables
// defined by const and let. 

const isEven = (number) => {
    return number % 2 === 0;
};

isEven(7); // false

// The "equivalent" of this function in the traditional syntax would look like this:

function isEven(number) {
    return number % 2 === 0;
};

// I put the word "equivalent" in double quotes because a function defined
// using the lambda syntax cannot be called before the definition.
// The following is an example of invalid usage:

add(1, 8);

const add = (firstNumber, secondNumber) => {
    return firstNumber + secondNumber;
};