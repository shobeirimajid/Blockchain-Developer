///////////////////////////////////////////////////////
//                 Loop
///////////////////////////////////////////////////////

// Loops are handy, if you want to run the same code over and over again, each time with a different value.

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
// The for/of statement allows iteration over iterable objects 
// including the built-in String, Array e.g. the Array-like arguments
// or NodeList objects, TypedArray, Map and Set, and user-defined iterables.

var myPets = "";
var pets = ["cat", "dog", "hamster", "hedgehog"];

for (var pet of pets){
    myPets += pet + " ";
} // myPets = 'cat dog hamster hedgehog '


//----------------
//  break
//----------------
// Breaking out of labeled loops is similar to Java

outer:
for (var i = 0; i < 10; i++) {
    for (var j = 0; j < 10; j++) {
        if (i == 5 && j ==5) {
            break outer;
            // breaks out of outer loop instead of only the inner one
        }
    }
}



//----------------
//  while
//----------------

while (true){
    // An infinite loop!
}



//----------------
//  do-while
//----------------

// Do-while loops are like while loops, except they always run at least once.

var input;
do {
    input = getInput();
} while (!isValid(input));



//----------------
// Examples
//----------------

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



// The snail climbs up 7 feet each day and slips back 2 feet each night.
// How many days will it take the snail to get out of a well with the given depth?

function main() {

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
}