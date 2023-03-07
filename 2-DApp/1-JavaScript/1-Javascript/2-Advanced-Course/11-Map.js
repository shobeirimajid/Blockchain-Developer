
///////////////////////////////////////////////////////
//  ES6 Map
///////////////////////////////////////////////////////
/*

Map holds `key-value` pairs 

Map remembers the original insertion order of the keys

Map supports different data types (1 and "1" are two different keys or values)
`key` or `value` in a map can be anything of any datatype (objects and primitive values)

Maps are supported in all browsers, except Internet Explorer


----------------
Methods
----------------

new Map()

    Creates a new Map

set(key, value) 

    Adds a specified key/value pair to the map. 
    If the specified key already exists, value corresponding to it is replaced with the specified value.

get(key) 

    Gets the value corresponding to a specified key in the map. 
    If the specified key doesn't exist, undefined is returned.

delete(key) 

    Deletes the key/value pair with a specified key from the map and returns true. 
    Returns false if the element does not exist.

has(key) 

    Returns true if a specified key exists in the map and false otherwise.

forEach()

    Calls a function for each key/value pair in a Map

entries() 

    Returns an iterator with the [key, value] pairs in a Map (an [key, value] array for each element)

clear() 

    Removes all key/value pairs from map.

keys() 

    Returns an Iterator of keys in the map for each element.

values() 

    Returns an Iterator of values in the map for each element.

----------------
Properties
----------------

size :  Returns the number of elements in a Map

*/


//------------------------------
// Create a Map
//------------------------------

new Map([iterable]) 

// creates a Map object where iterable is an array or any other iterable object 
// whose elements are arrays (with a key/value pair each)


// You can create a JavaScript Map by:

//    Passing an Array to new Map()
//    Create a Map and use Map.set()


// create a Map by passing an Array to the new Map() constructor
const fruits = new Map([
    ["apples", 500],
    ["bananas", 300],
    ["oranges", 200]
  ]);


// create a Map and add elements to a Map with the set() method
fruits = new Map();         // Create a Map
fruits.set("apples", 500);  // Set Map Values
fruits.set("bananas", 300);
fruits.set("oranges", 200);


// set() can also be used to change existing Map values
fruits.set("apples", 200);


// get() method gets the value of a key in a Map
fruits.get("apples");    // Returns 500


// The size property returns the number of key/value pairs in a map.
console.log(fruits.size); // 3


// delete() method removes a Map element
fruits.delete("apples");


// has() returns true if a key exists in a Map
fruits.has("apples");   // false


// forEach() invokes (calls) a function for each pair of map
fruits.forEach (function(p) {
    console.log(p[0] + " : " + p[1]);
})
// or
fruits.forEach (function(value, key) {
    console.log(key + " : " + value);
})
// bananas : 300
// oranges : 200


// entries() returns an iterator object with the [key, values] in a Map
for (let p of fruits.entries()) {
    console.log(p[0] + " : " + p[1]);
}
// bananas : 300
// oranges : 200

for (let p of fruits.entries()) {
    console.log(p);
}
// bananas,300
// oranges,200



/*
-----------------------------------
 Object vs Map
-----------------------------------
An `Object` is similar to `Map` but there are important differences :

Measure	            Object	                            Map
---------   --------------------------------    ------------------------------
Iterable	Not directly iterable	            Directly iterable
Size	    Do not have a size property	        Have a size property
Key Types	Keys must be Strings (or Symbols)	Keys can be any datatype
Key Order	Keys are not well ordered	        Keys are ordered by insertion
Defaults	Have default keys	                Do not have default keys

With regard to these differences, Map is preferable in certain cases:

    1) The keys can be any type including:   functions, objects, and any primitive
    2) You can get the size of a Map
    3) You can directly iterate over Map
    4) The performance of the Map is better (in scenarios involving frequent addition/removal of key/value pairs)
*/