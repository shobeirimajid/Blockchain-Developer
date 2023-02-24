///////////////////////////////////////////////////////
//                      Arrays
///////////////////////////////////////////////////////

// Arrays are ordered lists of values, of any type.
var myArray = ["Hello", 45, true];

// Their members can be accessed using the square-brackets subscript syntax.
// Array indices start at zero.
myArray[1]; // = 45

// Arrays are mutable and of variable length.
myArray.push("World");
myArray.length; // = 4

// Add/Modify at specific index
myArray[3] = "Hello";

// Add and remove element from front or back end of an array
myArray.unshift(3); // Add as the first element
someVar = myArray.shift(); // Remove first element and return it
myArray.push(3); // Add as the last element
someVar = myArray.pop(); // Remove last element and return it

// Join all elements of an array with semicolon
var myArray0 = [32,false,"js",12,56,90];
myArray0.join(";"); // = "32;false;js;12;56;90"

// Get subarray of elements from index 1 (include) to 4 (exclude)
myArray0.slice(1,4); // = [false,"js",12]

// Remove 4 elements starting from index 2, and insert there strings
// "hi","wr" and "ld"; return removed subarray
myArray0.splice(2,4,"hi","wr","ld"); // = ["js",12,56,90]
// myArray0 === [32,false,"hi","wr","ld"]


// declare array by new keyword
var courses1 = new Array(3);
courses1[0] = "HTML";
courses1[1] = "CSS";
courses1[2] = "JS";

// The array literal syntax is the recommended way to declare arrays.
var courses2 = ["HTML 5", "CSS 3", "ES6"]; 

var courses3 = courses1.concat(courses2);


console.log(courses1);
console.log(courses2);
console.log(courses3);



// Ex: Write a program to creates the corresponding array of points 
// and output the sum of all gained points.

function main() {
    //take the number of passed levels
    var levels = parseInt(readLine(),10);
    var points = new Array();
    
    var count = 0;
    while(count<levels){
        var elem = parseInt(readLine(),10);
        points[count] = elem;
        count++;
    }
    
    var sum = 0;
    //calculate the sum of points 
    sum = points.reduce(function(a, b){
        return a + b;
    },0)

    
    //output
    console.log(sum);
}




/*
    ----------------------
    Associative Arrays
    ----------------------
    While many programming languages support arrays with named indexes (text instead of numbers), 
        called associative arrays JavaScript does not.
    However, you still can use the named array syntax, which will produce an object.
    For example:

        var person = []; //empty array
        person["name"] = "John";
        person["age"] = 46;
        document.write(person["age"]);

    Now, person is treated as an object, instead of being an array.
    The named indexes "name" and "age" become properties of the person object.

    As the person array is treated as an object, 
    the standard array methods and properties will produce incorrect results. 
    For example, 
        person.length will return 0.


    Remember that JavaScript does not support arrays with named indexes.
    In JavaScript, arrays always use numbered indexes.
    It is better to use an object when you want the index to be a string (text).
    Use an array when you want the index to be a number.

    If you use a named index, 
    JavaScript will redefine the array to a standard object.

    
*/