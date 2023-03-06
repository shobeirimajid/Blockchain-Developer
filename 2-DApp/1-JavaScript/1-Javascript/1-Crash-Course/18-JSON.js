///////////////////////////////////////////////////////
//                      JSON
///////////////////////////////////////////////////////



//----------------------------------------
// What is JSON ?
//----------------------------------------
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


//----------------------------------------
// JSON Syntax Rules
//----------------------------------------
/*
    Each JSON has one or more property

    Each property is in the form of `name:value`

    properties are separated by commas

    names is always string - Strings in JSON must be written in double quotes -> {"age":15}

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

// JSON string that defines an object with 3 properties: name, age, car
// Each property has a value.

let txt = '{"name":"John", "age":30, "car":null}'



//----------------------------------------
// JSON Data - A Name and a Value
//----------------------------------------

// JSON data is written as name/value pairs, 
// just like JavaScript object properties.

// A name/value pair consists of : 

    // a field name (in double quotes)      
    // followed by a colon                    
    // followed by a value                 

"firstName":"John"


// NOTE: JSON names require double quotes. JavaScript names do not.



//----------------------------------------
// JSON Objects
//----------------------------------------

// JSON objects are written inside curly braces.
// Just like in JavaScript, objects can contain multiple name/value pairs:

text = {"firstName":"John", "lastName":"Doe"}

const person = JSON.parse(text);

// You can access a JavaScript object like this:

person.firstName;
person["firstName"];

// Data can be modified like this:
person.firstName    = "Gilbert";
person["firstName"] = "Gilbert";





//----------------------------------------
// JSON Arrays
//----------------------------------------

// JSON arrays are written inside square brackets.
// Just like in JavaScript, an array can contain objects:

// Example
// the object "employees" is an array. 
// It contains three objects (employee records).
// Each object is a record of a person (with a first name and a last name).

{
    "employees":[
      {"firstName": "John", "lastName": "Doe"},
      {"firstName": "Anna", "lastName": "Smith"},
      {"firstName": "Peter", "lastName": "Jones"}
    ]
}



// If you parse the JSON string with a JavaScript program, you can access the data as an object:
const j = JSON.parse(txt);

let personName = obj.name;
let personAge = obj.age;



//----------------------------------------
// JSON.parse(text) 
//----------------------------------------
// Converting JSON string to JS Object
// The JSON format is syntactically identical to the code for creating JS objects.
// Because of this similarity, a JS program can easily convert JSON data into native JS objects.

// First, create a JS string containing JSON syntax:
let text = 

'{' + 
    '"employees" : [' +
        '{ "firstName": "John" , "lastName": "Doe" },' +
        '{ "firstName": "Anna" , "lastName": "Smith" },' +
        '{ "firstName": "Peter" , "lastName": "Jones" }' +
    ']' + 
'}';

// Then, use the JavaScript built-in function JSON.parse() to convert the string into a JS object
const obj = JSON.parse(text);

// Finally, use the new JavaScript object in your page:
let firstName = obj.employees[1].firstName;  // Anna
let lastName  = obj.employees[1].lastName;   // Smith



//----------------------------------------
// JSON.stringify(obj)
//----------------------------------------
// Converting Object to JSON string 

let strJson = JSON.stringify(obj);

// '{"employees":[{"firstName":"John","lastName":"Doe"},{"firstName":"Anna","lastName":"Smith"},{"firstName":"Peter","lastName":"Jones"}]}'
