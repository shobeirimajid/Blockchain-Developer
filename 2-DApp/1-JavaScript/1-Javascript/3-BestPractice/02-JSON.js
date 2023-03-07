///////////////////////////////////////////////////////
//                      JSON
///////////////////////////////////////////////////////



//------------------------
// What is JSON ?
//------------------------
/*
    JSON : JS Object Notation
    
    JSON syntax is derived from JS objects

    JSON is a lightweight and 'text format' data

    A common use of JSON is Storing and interchanging data between server and client

    JSON data can easily be sent between computers, and used by any programming language.
    
    JSON is language independent - getting and setting JSON data can be written in any programming language.

    JSON is "self-describing" and easy to understand

    The file type for JSON files is ".json"

    The MIME type for JSON text is "application/json"
*/



//------------------------
// JSON Syntax Rules
//------------------------
/*
    Each JSON has one or more property

    Each property is in the form of `name:value` pair

    properties are separated by commas

    names is always string - Strings in JSON must be written in " " -> {"age":15}

    values must be one of the following data type :

        - string
        - number
        - object   - holds by {}
        - array    - holds by []
        - boolean
        - null

    JSON values cannot be one of the following data types:

        - function
        - date
        - undefined
*/



//------------------------
// JSON Strings
//------------------------

// Strings in JSON must be written in double quotes.

let car = {"name":"Mercedes-Benz Sedan", "class":"E-Class"}



//------------------------
// JSON Numbers
//------------------------

// Numbers in JSON must be an integer or a floating point.

let product = {"stock":9000, "saled":1000}



//------------------------
// JSON Objects
//------------------------
// Values in JSON can be objects.
// Objects as values in JSON must follow the JSON syntax.
// JSON objects are written inside {}

// "employees" is an object with 3 property name, age, city
{
  "employee":{"name":"John", "age":30, "city":"New York"}
}



//------------------------
// JSON Arrays
//------------------------
// Values in JSON can be arrays.
// JSON arrays are written inside []
// Just like in JavaScript, an array can contain objects


// "employees" is an array with 3 element
// each element is an object (employee record with firstName and lastName properties).

    {
        "employees":[
        {"name": "John", "age":30, "city": "Frankfurt"},
        {"name": "Smit", "age":24, "city": "Berlin"},
        {"name": "Peter", "age":32, "city": "Hamburg"}
        ]
    }



//------------------------
// JSON Booleans
//------------------------
// Values in JSON can be true/false.

let products = {"sold":true}



//------------------------
// JSON null
//------------------------
// Values in JSON can be null.

let person2 = {"middlename":null}



//------------------------
// Arrays in Objects
//------------------------
// JSON Objects can contain arrays:

let myObj = {
              "name":"John",
              "age":30,
              "cars":["Ford", "BMW", "Fiat"]
            }

// access array values
myObj.cars[0];

// access array values by using a for in loop:

for (let i = 0; i < myObj.cars.length; i++) {
    x += myObj.cars[i];
}

// or

for (let i in myObj.cars) {
    x += myObj.cars[i];
}




//------------------------
// JSON.parse(text) 
//------------------------

// A common use of JSON is to exchange data to/from a web server.
// When receiving data from a web server, the data is always a string.
// JSON.parse() convert string data to a JavaScript object.

// we received this text from a web server
let text = '{"name":"John", "age":30, "city":"Frankfurt"}'

// Use the JavaScript function JSON.parse() to convert text into a JavaScript object.
// Make sure the text is in JSON format, or else you will get a syntax error.
const obj = JSON.parse(text);

// Finally, use the JavaScript object in your page:

// You can access a JavaScript object like this:
obj.name;
obj["name"];

// Data can be modified like this:
obj.name    = "Gilbert";
obj["name"] = "Gilbert";


// looping
let t = "";
for (const x in obj) {
  t += obj[x] + ", ";
}




//------------------------
// Array as JSON
//------------------------
// When using the JSON.parse() on a JSON derived from an array, 
//  the method will return a JavaScript array, instead of a JavaScript object.

const txt = '["Ford", "BMW", "Audi", "Fiat"]';
const myArr = JSON.parse(txt);

myArr[0];   // "Ford"
myArr[1];   // "BMW"
myArr[2];   // "Audi"
myArr[3];   // "Fiat"



//------------------------
// JSON.stringify(obj)
//------------------------
// When sending data to a web server, the data has to be a string.
// JSON.stringify() Converts a JavaScript object into a string 

// Imagine we have this object in JavaScript:
const obj = {name: "John", age: 30, city: "New York"};

// Use the JavaScript function JSON.stringify() to convert it into a string.
let myJSON  = JSON.stringify(obj);

// The result will be a string 
// following the JSON notation
// and ready to be sent to a server

// '{"employees":[{"firstName":"John","lastName":"Doe"},{"firstName":"Anna","lastName":"Smith"},{"firstName":"Peter","lastName":"Jones"}]}'



//-------------------------------
// Stringify a JavaScript Array
//-------------------------------
// It is also possible to stringify JavaScript arrays:

// we have this array in JavaScript
const arr = ["John", "Peter", "Sally", "Jane"];

// Use the JavaScript function JSON.stringify() to convert it into a string.
const myjson = JSON.stringify(arr);

// The result will be a string 
// following the JSON notation
// and ready to be sent to a server

// ["John","Peter","Sally","Jane"]