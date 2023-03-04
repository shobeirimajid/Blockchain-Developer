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

// The `for` loop is the same as C and Java:
// initialization; continue condition; iteration.

for (var i = 0; i < 5; i++){
    // will run 5 times
}

    
//----------------
//  for-in
//----------------
// The for/in statement allows iteration over properties of an object.

var description = "";
var person = {fname:"Paul", lname:"Ken", age:18};

for (var x in person){
    description += person[x] + " ";
} // description = 'Paul Ken 18 '


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