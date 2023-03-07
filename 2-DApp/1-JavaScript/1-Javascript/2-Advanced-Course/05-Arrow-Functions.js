///////////////////////////////////////////////////////
//  Functions in ES6
///////////////////////////////////////////////////////

//-------------------------------
//  Arrow Functions
//-------------------------------

// --- lambda syntax ---

var arr = [2, 3, 7, 8];

// We can use the forEach method of the array to call a function for each element:
arr.forEach(function(elm) {
    return elm*2;
});

// However, in ES6, The code can be rewritten `shorter` and `pretty nice` in lambda syntax
arr.forEach(elm => {
    return elm*2;
});



// --- arrow functions ---

// Arrow functions allow us to write shorter function syntax:

// let func = (arg1, arg2, ..., argN) => expression;
let sum = (x, y) => x + y;



// Prior to ES6, a JavaScript function was defined like this:
function sum(x, y) {
    var s = x+y;  
    return s;
}

// ES6 introduces a new syntax for writing functions (Arrow Functions)
// This allows functions to be defined in a `lexical scope like` with variables defined by const and let 

const sum = (x, y) => {
    let s = x + y;  
    return s;
}


// Arrow syntax is quite handy
// You can skip typing function

// When your function just have a single argument
//  you can skip parentheses :

const func1 = x => {
    let msg = "Welcome " + x;
    return msg;
}

// When your function just have a single statement
//  you can also skip braces and return keyword
// This is very useful for inline functions :

const greet = x => "Welcome " + x;


// If you have more than one parameter, 
// you pass them inside the parentheses:

const add = (x, y) => x + y;

// If there are no parameters, 
// an empty pair of parentheses should be used :

const x = () => alert("Hi");


// An arrow function that takes an array and prints the odd elements:

const printOdds = (arr) => {
    arr.forEach(elm => {
        if (elm % 2 !== 0) 
            console.log(elm);
    });
}


// NOTE :: an `arrow function` cannot be called before the definition.

add(1, 8);  // ERROR
const add = (a, b) => {
    return a + b;
};



// --- What About this? ---

/*
    The handling of this is also different in arrow functions compared to regular functions.

    In short, with arrow functions there are no binding of this.

    In regular functions the this keyword represented the object that called the function, 
    which could be the window, the document, a button or whatever.

    With arrow functions the this keyword always represents the object that defined the arrow function.

    Remember these differences when you are working with functions. 
    Sometimes the behavior of regular functions is what you want, if not, use arrow functions.
*/

// Let us take a look at two examples to understand the difference.

// Both examples call a method twice:
//  1- when the page loads, 
//  2- when the user clicks a button.

// The first example uses a regular function, 
//      returns two different objects (window , button) 

// and the second example uses an arrow function.
//      returns the window object twice
//      because the window object is the "owner" of the function.


// Regular Function:

hello = function() {
    // With a regular function `this` represents the `object that calls the function`
    document.getElementById("demo").innerHTML += this;
}

// The window object calls the function:
window.addEventListener("load", hello);
// A button object calls the function:
document.getElementById("btn").addEventListener("click", hello);



// Arrow Function:

hello = () => {
    // With an arrow function `this` represents the `owner of the function`
    document.getElementById("demo").innerHTML += this;
}

// The window object calls the function:
window.addEventListener("load", hello);
// A button object calls the function:
document.getElementById("btn").addEventListener("click", hello);