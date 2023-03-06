///////////////////////////////////////////////////////
//                   Callbacks
///////////////////////////////////////////////////////
/*

"I will call back later!"

A `callback` is a `function` passed as an `argument` to another function

This technique allows a function to `call another function`

A `callback function` can run after another function has finished

*/


//-----------------------------
// Function Sequence
//-----------------------------

// JavaScript functions are executed in the sequence they are called. 
// Not in the sequence they are defined.


function myFirst() {
    myDisplayer("Hello");
}
  
function mySecond() {
    myDisplayer("Goodbye");
}
  
// This example will end up displaying "Goodbye"
myFirst();      // Hello
mySecond();     // Goodbye


// This example will end up displaying "Hello"
mySecond();
myFirst();



//-----------------------------
// Sequence Control
//-----------------------------

// Sometimes you would like to have better control over when to execute a function.

// Suppose you want to do a calculation, and then display the result.

// You could call a calculator function (myCalculator), 
//      save the result, 
//      and then call another function (myDisplayer) to display the result


// Example
function myDisplayer(some) {
    console.log(some);
}
  
function myCalculator(num1, num2) {
    let sum = num1 + num2;
    return sum;
}
  
let result = myCalculator(5, 5);
myDisplayer(result);


// Or, you could call a calculator function (myCalculator), 
//      and let the calculator function call the display function (myDisplayer):

function myDisplayer(some) {
    console.log(some);
}
  
function myCalculator(num1, num2) {
    let sum = num1 + num2;
    myDisplayer(sum);
}
  
myCalculator(5, 5);


// The problem with the first example above, is that :
//   you have to call two functions to display the result.

// The problem with the second example, is that :
//   you cannot prevent the calculator function from displaying the result.

// Now it is time to bring in a callback.