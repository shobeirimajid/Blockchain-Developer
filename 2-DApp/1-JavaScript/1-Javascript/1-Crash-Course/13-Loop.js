///////////////////////////////////////////////////////
//                 Loop
///////////////////////////////////////////////////////

// Loops are handy, if you want to run the same code over and over again, 
// each time with a different value.

// Instead of writing:
text += cars[0] + "<br>";
text += cars[1] + "<br>";
text += cars[2] + "<br>";
text += cars[3] + "<br>";
text += cars[4] + "<br>";
text += cars[5] + "<br>";

// You can write:
for (let i = 0; i < cars.length; i++) {
    text += cars[i] + "<br>";
}


// Different Kinds of Loops

//  for        loops through a block of code a number of times
//  for/in     loops through the properties of an object
//  for/of     loops through the values of an iterable object
//  while      loops through a block of code while a specified condition is true
//  do/while   loops through a block of code while a specified condition is true


//----------------
//  for
//----------------

// The for statement creates a loop with 3 optional expressions:

// for (expression 1; expression 2; expression 3) {
//     // code block to be executed
// }

// Expression 1 : is executed (one time) before the execution of the code block.
// Expression 2 : defines the condition for executing the code block.
// Expression 3 : is executed (every time) after the code block has been executed.

for (var i = 0; i < 5; i++){
    // will run 5 times
}

// (let i = 0)   :  sets a variable before the loop starts 
// (i < 5)       :  defines the condition for the loop to run 
// (i++)         :  increases the value of `i` each time the code block in the loop has been executed 


// You can initiate many values in expression 1 (separated by comma)

for (let i = 0, len = cars.length, text = ""; i < len; i++) {
    text += cars[i] + "<br>";
}

// Expression 1 is optional
// And you can omit expression 1 (like when your values are set before the loop starts)

i = 2;
len = cars.length;
text = "";

for (; i < len; i++) {
  text += cars[i] + "<br>";
}

// Expression 2 is also optional
// You can omit expression 2
// If you omit expression 2, you must provide a break inside the loop. 
//  Otherwise the loop will never end. This will crash your browser.

// Expression 3 is optional
// You can omit expression 2 (like when you update your values inside the loop)
// Expression 3 can do anything like negative increment (i--), positive increment (i = i + 15)

i = 0;
len = cars.length;
text = "";
for (; i < len; ) {
  text += cars[i] + "<br>";
  i++;
}


// Using var in a loop
var i = 5;
for (var i = 0; i < 10; i++) {
  // some code
}
// Here i is 10


// Using let in a loop
// When let is used to declare the i variable in a loop, 
//  the i variable will only be visible within the loop
let i = 5;
for (let i = 0; i < 10; i++) {
  // some code
}
// Here i is 5



// Numbering floors of building with omitting number 13

var countOfRooms = 15;
var floor  = 1;

for(let i=1; i<=countOfRooms; i++) {

    if(i<13) {
        console.log(floor);
        floor ++;
    }
        
    else if(i>=13) {
        floor ++;
        console.log(floor);
    }
}


    
//----------------
//  for-in
//----------------

// for-in can loop over properties of an object

// for (key in object) {
//     // code block to be executed
// }


var person = {fname:"Paul", lname:"Ken", age:18};

var text = "";
for (var x in person){
    text += person[x] + " ";
} 
// text : 'Paul Ken 18 '


// The for in loop iterates over the person object
// Each iteration returns a key (x)
// The key is used to access the value of the key
// The value of the key is person[x]


// for-in can also loop over the properties of an Array

// for (variable in array) {
//      // code block to be executed
// }

const numbers = [45, 4, 9, 16, 25];

let txt = "";
for (let x in numbers) {
  txt += numbers[x];
}
// txt : 99


// Do not use for-in over an Array if the index order is important.
// The index order is implementation-dependent, and array values may not be accessed in the order you expect.

// It is better to use following loops when the order is important :
    // for loop
    // for-of loop
    // Array.forEach() 



//----------------
//  .forEach()
//----------------
// forEach() calls a function (a callback function) once for each array element

numbers = [45, 4, 9, 16, 25];

txt = "";
numbers.forEach(myFunction);

function myFunction(value, index, array) {
  txt += value;
}


//----------------
//  for-of
//----------------
// For/of was added to JavaScript in 2015 (ES6)
// lets you loop over iterable data structures such as: 
    
    // Arrays
    // Strings
    // Maps
    // Set
    // NodeLists
    // objects
    // user-defined iterables

for (variable of iterable) {
    // code block to be executed
}

// variable : 
// For every iteration the value of the next property is assigned to the variable. 
// Variable can be declared with const, let, or var.

// iterable : 
// An object that has iterable properties. Like an array.
// Iterables can be accessed with simple and efficient code.
// Iterables can be iterated over with for-of loops


// Iterating
// terating is simply means looping over a sequence of elements.
// Ex.
//    Iterating over a String
//    Iterating over an Array


// Iterating over an Array
const cars = ["BMW", "Volvo", "Mini"];

let text = "";
for (let x of cars) {
    text += x;
}


// Iterating over a String
let language = "JavaScript";

let text = "";
for (let x of language) {
    text += x;
}


// Iterating over a Set
const letters = new Set(["a","b","c"]);

let text = "";
for (const x of letters) {
  text += x;
}


// Iterating over a Map
const fruits = new Map([
    ["apples", 500],
    ["bananas", 300],
    ["oranges", 200]
]);
  
let text = "";
for (const x of fruits) {
text += x;
}



//----------------
//  while
//----------------
// loops through a block of code as long as a specified condition is true

while (condition) {
    // code block to be executed
}


while (true){
    // An infinite loop!
}


// will run as long as variable `i` is less than 10
// If you forget to increase the variable used in the condition, the loop will never end. 
// This will crash your browser.

while (i < 10) {
    text += "The number is " + i;
    i++;
}


// The snail climbs up 7 feet each day and slips back 2 feet each night.
// How many days will it take the snail to get out of a well with the given depth?

var depth = parseInt(readLine(), 10);
var distance=0;
var day=0;

while(true) {

    day++;
    distance += 7;

    if(distance >= depth) {
        console.log(day);
        break;
    } 
    else {
        distance -= 2;
    }
}



//----------------
//  do-while
//----------------
// a variant of the while loop
// This loop will execute the code block once, before checking if the condition is true
//  So, the code block always run at least once.
// then it will repeat the loop as long as the condition is true

do {
    // code block to be executed
}
while (condition);


// The loop will always be executed at least once, even if the condition is false, 
// because the code block is executed before the condition is tested
// Do not forget to increase the variable used in the condition, 
// otherwise the loop will never end!

do {
    text += "The number is " + i;
    i++;
}
while (i < 10);





//----------------
//  break
//----------------
// It was used to :
// "jump out" of a loop
// "jump out" of a switch statement

// the break statement ends the loop ("breaks" the loop) when the loop counter (i) is 5
text = "";
for (let i = 0; i < 10; i++) {
    if (i === 5) { 
        break; 
    }
    text += "i is " + i + "<br>";
}



//----------------
//  continue
//----------------
// "jumps over" one iteration in the loop
// breaks one iteration (in the loop), if a specified condition occurs, 
//  and continues with the next iteration in the loop.

for (let i = 0; i < 10; i++) {
    if (i === 3) { 
        continue; 
    }
    text += "The number is " + i + "<br>";
}


//----------------
//  Labels
//----------------
// To label JavaScript statements you precede the statements with a label name and a colon
// The `break` and the `continue` statements are the only JavaScript statements 
//  that can "jump out" of a `code block` to a lable.
// A code block is a block of code between {  }

labelname:

while(condition) {
    break labelname;
    // or
    continue labelname;
}

// continue (with or without a label reference) 
//    can only be used to skip one loop iteration.

// break without a label reference, 
//    can only be used to jump out of a loop or a switch.

// break With a label reference 
//    can be used to jump out of any code block


cars = ["BMW", "Volvo", "Saab", "Ford"];

list: {
  text += cars[0] + "<br>";
  text += cars[1] + "<br>";
  break list;
  text += cars[2] + "<br>";
  text += cars[3] + "<br>";
}