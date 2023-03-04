///////////////////////////////////////////////////////
//                 Comparisions
///////////////////////////////////////////////////////


//-------------------------
// Logical Operators
//-------------------------
/*
    Operator	         Description
    ----------------     -------------------------
    ==                   equal to
    ===                  equal value and equal type

    !=	                 not equal
    !==                  not equal value or not equal type

    x && y               Logical AND : x and y both are true
    x || y               Logical OR  : at least one of x or y is true
    
    ?:                   Ternary Operato:   
                            variablename = (condition) ? ifTrue : ifFfalse
                            - returns the first argument if condition is true 
                            - Otherwise it returns the second argument

    ??                   Nullish Coalescing -  Nullish : null | undefined
                            - returns the first argument if it is not nullish 
                            - Otherwise it returns the second argument

    ?.                  Optional Chaining - object?.field
                            returns undefined if an object is undefined or null (instead of throwing an error)
                            
*/


//----------------
//  if-else
//----------------

if (condition) {
    //  block of code to be executed if the condition is true
}


if (condition) {
    //  block of code to be executed if the condition is true
} else {
    //  block of code to be executed if the condition is false
}


if (condition1) {
    //  block of code to be executed if condition1 is true
} else if (condition2) {
    //  block of code to be executed if the condition1 is false and condition2 is true
} else {
    //  block of code to be executed if the condition1 is false and condition2 is false
}



// Examples

if (hour < 18) {
    greeting = "Good day";
}


if (hour < 18) {
    greeting = "Good day";
} else {
    greeting = "Good evening";
}


if (time < 10) {
    greeting = "Good morning";
} else if (time < 20) {
    greeting = "Good day";
} else {
    greeting = "Good evening";
}


if (number >= 0 && number % 2 != 0) {
    // since number is positive `and` devidable by 2
    // then number is even
}


if (colour == "red" || colour == "blue") {
    // colour is either red `or` blue
}


// Short-Circuit 
// is useful for setting default values
var name = otherName || "default";



//----------------
//  switch
//----------------
// The switch statement is used to perform different actions based on different conditions.
// Use the switch statement to select one of many code blocks to be executed.
// Use 'break' after each case
// or the cases after the correct one will be executed too.


switch(expression) {
    case x:
      // code block
      break;
    case y:
      // code block
      break;
    default:
      // code block
}


// The switch expression is evaluated once.
// The value of the expression is compared with the values of each case.
// If there is a match, the associated block of code is executed.
// If there is no match, the default code block is executed.

// break
// When JavaScript reaches a break keyword, it breaks out of the switch block.
// This will stop the execution inside the switch block.
// It is not necessary to break the last case in a switch block. The block breaks (ends) there anyway.
// Note: If you omit the break statement, 
//       the next case will be executed even if the evaluation does not match the case.

// default 
// The default keyword specifies the code to run if there is no case match
// The default case does not have to be the last case in a switch block
// it can be as a first block or any other place
// If default is not the last case in the switch block, remember to end the default case with a break.

// If multiple cases matches a case value, the first case is selected.
// If no matching cases are found, the program continues to the default label.
// If no default label is found, the program continues to the statement(s) after the switch.

// The `switch` cases use strict comparison (===) to checks equality
// The values must be of the same type to match
// A strict comparison can only be true if the operands are of the same type.



// Examples

// This example uses the grade to evaluate students performance
switch (grade) {
case 'A':
    console.log("Great job");
    break;
case 'B':
    console.log("OK job");
    break;
case 'C':
    console.log("You can do better");
    break;
default:
    console.log("Oy vey");
    break;
}

// This example uses the weekday number to calculate the weekday name
switch (new Date().getDay()) {
    case 0:
      day = "Sunday";
      break;
    case 1:
      day = "Monday";
      break;
    case 2:
       day = "Tuesday";
      break;
    case 3:
      day = "Wednesday";
      break;
    case 4:
      day = "Thursday";
      break;
    case 5:
      day = "Friday";
      break;
    case 6:
      day = "Saturday";
      break;
    default:
        text = "Looking forward to the Weekend";
  }


// Common Code Blocks
// Sometimes you will want different switch cases to use the same code.
// In this example case 4 and 5 share the same code block, and 0 and 6 share another code block:

switch (new Date().getDay()) {
    case 4:
    case 5:
      text = "Soon it is Weekend";
      break;
    case 0:
    case 6:
      text = "It is Weekend";
      break;
    default:
      text = "Looking forward to the Weekend";
  }


// Strict Comparison
// In this example there will be no match for x due to Strict Comparison

let x = "0";

switch (x) {
  case 0:
    text = "Off";
    break;
  case 1:
    text = "On";
    break;
  default:
    text = "No value found";
}


//------------------------------
// Comparing Different Types
//------------------------------
// Comparing data of different types may give unexpected results.
// When comparing a `string` with a `number`, JavaScript will convert : string -> number
//   Empty string         ->     0
//   Non-Numeric string   ->     NaN     which is always false
 
("2" > "12")  // true   |    because (alphabetically) 1 is less than 2

// To secure a proper result, 
// variables should be converted to the proper type before comparison:

age = Number(age);

if (isNaN(age)) {
  voteable = "Input is not a number";
} else {
  voteable = (age < 18) ? "Too young" : "Old enough";
}



//----------------
// Ternary Operator
//----------------
// ?:
// returns the first argument if condition is true Otherwise it returns the second argument
let voteable = (age < 18) ? "Too young" : "Old enough";



//----------------------
// Nullish Coalescing
//----------------------
// ??
// returns the first argument if it is not nullish Otherwise it returns the second argument
// Nullish ~ null / undefined
// The nullish operator is supported in all browsers since March 2020

let first = null;
let second = "notNullish";
let result = first ?? second;       // result <- second



//----------------------
// Optional Chaining
//----------------------
// ?.
// returns undefined if an object is undefined or null (instead of throwing an error)

car = {type:"Fiat", model:"500", color:"white"};    // Create an object:
carName = car?.name;   // carName <- undefined