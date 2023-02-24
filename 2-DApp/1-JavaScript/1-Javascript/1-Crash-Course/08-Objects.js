///////////////////////////////////////////////////////
//                      Objects
///////////////////////////////////////////////////////

// JavaScript's objects are equivalent to "dictionaries" or "maps" in other languages.
//  maps: an unordered collection of key-value pairs.
var myObj = {key1: "Hello", key2: "World"};

// Keys are strings, but quotes aren't required if they're a valid JavaScript identifier.
// Values can be any type.
var myObj = {
    myKey: "myValue", 
    "my other key": 4
};

// Object attributes can also be accessed using the subscript syntax,
myObj["my other key"]; // = 4

// ... or using the dot syntax, provided the key is a valid identifier.
myObj.myKey; // = "myValue"

// Objects are mutable; values can be changed and new keys added.
myObj.myThirdKey = true;

// If you try to access a value that's not yet set, you'll get undefined.
myObj.myFourthKey; // = undefined


var cuboid = {
    length: 25,
    width: 50,
    height: 200
};

//your code goes here
let volume = cuboid.length * cuboid.width * cuboid.height;
console.log(volume);



/*
    Sometimes, we need to set an "object type" 
        that can be used to create a number of objects of a single type.

    The standard way to create an "object type" 
        is to use an object constructor function.
*/


function person(name, age, color) {
    this.name = name;
    this.age = age;
    this.favColor = color;
  }

  /*
    The above function (person) is an object constructor, 
        which takes parameters and assigns them to the object properties.
  */

//                   name,  age, color
var p1 = new person("John", 42, "green");
var p2 = new person("Amy", 21, "red");

console.log("p1.age", p1.age); 
console.log("p2.name", p2.name);