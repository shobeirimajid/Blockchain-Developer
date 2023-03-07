
///////////////////////////////////////////////////////
//  ES6 Set
///////////////////////////////////////////////////////
/*
A JavaScript Set is a collection of unique values 
Each value can only occur once in a Set (no repetitions are allowed)

A value in a set can be anything (objects and primitive values).

    - Set supports different data types  (1 and "1" are two different values)
    - `NaN` and `undefined` can also be stored in Set.


Methods         Description
-----------     -----------------------------------------------------------------------
new Set()	    Creates a new Set
add(value)      Adds a new element with the given value to the Set
delete(value)   Deletes a specified value from the set
has(value)      Returns true if a specified value exists in the set and false otherwise
forEach()       Invokes a callback for each element in the Set
values()        Returns an Iterator with all the values in a Set
clear()         Clears the set

Properties
-----------     -----------------------------------------------------------------------
size	        Returns the number of `distinct` elements in a Set

*/

//--------------------
// Create a Set
//--------------------

new Set([iterable]) 
// iterable is an array or any other iterable object of values.


/*
    You can create a JavaScript Set by:

    Passing an Array to new Set()
    Create a new Set and use add() to add values
    Create a new Set and use add() to add variables

*/

// Pass an Array to the new Set() constructor
set = new Set([1, 2, 4, 2, 59, 9, 4, 9, 1]);
// If you add duplicate elements, only the first will be saved
console.log(set.size); // 5


// Create a Set and add values:
const set = new Set();  // Create a Set
set.add("a");           // Add Values to the Set
set.add("b");
set.add("c");
// or
set.add("a").add("b").add("c");


// Create a Set and add variables:
const letters = new Set();      // Create a Set
const a = "a";                  // Create Variables
const b = "b";
const c = "c";
letters.add(a);                 // Add Variables to the Set
letters.add(b);
letters.add(c);


//-----------------
// forEach()
//----------------
// forEach() invokes (calls) a function for each Set element
// Create a Set
letters = new Set(["a","b","c"]);

// List all Elements
let txt = "";
letters.forEach (function(value) {
  txt += value;
})
// txt : abc


//-----------------
// values()
//----------------
// values() returns a new iterator object containing all the values in a Set
letters.values()   // Returns [object Set Iterator]

// Now you can use the Iterator object to access the elements:

// List all Elements
let text = "";
for (const x of letters.values()) {
  text += x;
}


//-----------------
// has()
//----------------
console.log(set.has(9));        // true

