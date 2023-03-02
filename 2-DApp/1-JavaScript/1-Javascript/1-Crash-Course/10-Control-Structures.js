///////////////////////////////////////////////////////
//                 Control Structures
///////////////////////////////////////////////////////


//----------------
//  if
//----------------

//The `if` structure works as you'd expect.

    var count = 1;
    if (count == 3){
        // evaluated if count is 3
    } else if (count == 4){
        // evaluated if count is 4
    } else {
        // evaluated if it's not either 3 or 4
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
//  for
//----------------

// The `for` loop is the same as C and Java:
// initialization; continue condition; iteration.

    for (var i = 0; i < 5; i++){
        // will run 5 times
    }



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

    

//  for/in
//----------------
// The for/in statement allows iteration over properties of an object.

    var description = "";
    var person = {fname:"Paul", lname:"Ken", age:18};

    for (var x in person){
        description += person[x] + " ";
    } // description = 'Paul Ken 18 '



//  for/of
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
//  &&  ||
//----------------

//  logical and , logical or

    if (house.size == "big" && house.colour == "blue"){
        house.contains = "bear";
    }

    if (colour == "red" || colour == "blue"){
        // colour is either red or blue
    }


// && and || "short circuit", which is useful for setting default values.

    var name = otherName || "default";

   
    
//----------------
//  switch
//----------------

// The `switch` statement checks for equality with `===`.
// Use 'break' after each case
// or the cases after the correct one will be executed too.

    grade = 'B';

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





//-------------------------------------------
//                Examples
//-------------------------------------------


//------------------------------------------
//              if-else-for
//------------------------------------------

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



//------------------------------------------
//              loop - break
//------------------------------------------

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