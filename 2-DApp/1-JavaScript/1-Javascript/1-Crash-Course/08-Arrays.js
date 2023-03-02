///////////////////////////////////////////////////////
//                      Arrays
///////////////////////////////////////////////////////

/*
Arrays are ordered lists of values, of any type.
Arrays are a special type of objects. The typeof operator in JavaScript returns "object" for arrays.
Objects use names to access its "members". example: person.firstName
Arrays use numbers to access its "elements". example: person[0]

JavaScript arrays are written with square brackets.
Array items are separated by commas

It is a common practice to declare arrays with the const keyword.
*/

    // The array literal syntax is the recommended way to declare arrays.
    const cars1 = ["Saab", "Volvo", "BMW"];

    // You can also create an array, and then provide the elements:
    const cars = [];
    cars[0]= "Saab";
    cars[1]= "Volvo";
    cars[2]= "BMW";


/*
Array indexes are zero-based, which means Array indices start at zero.
the first item is [0], second is [1], and so on.
Their members can be accessed using the square-brackets subscript syntax.
*/

    cars.length             // Returns the number of elements ~~ length = (highest array index + 1)
    cars[0];                // Accessing the First Array Element
    cars[cars.length - 1]   // Accessing the Last Array Element
    cars[2];   // "BMW"
    cars[2] = "Ford";       // Modify at specific index



    // declare array by new keyword

    var courses1 = new Array(3);
    courses1[0] = "HTML";
    courses1[1] = "CSS";
    courses1[2] = "JS";


    
/*
Associative Arrays
----------------------
While many programming languages support arrays with named indexes (text instead of numbers), 
Arrays with named indexes are called associative arrays (or hashes).
JavaScript does not support arrays with named indexes.
In JavaScript, arrays always use numbered indexes.  
However, you still can use the named array syntax, which will produce an object.
*/

    Example:
    var person = [];            //empty array
    person["name"] = "John";
    person["age"] = 46;
    console.log(person["age"]);

/*
Now, person is treated as an object, instead of being an array.
The named indexes "name" and "age" become properties of the person object.

As the person array is treated as an object, 
the standard array methods and properties will produce incorrect results. 
*/

    Example:
    console.log(person.length);     // will return 0

/*
Remember that JavaScript does not support arrays with named indexes.
In JavaScript, arrays always use numbered indexes.

It is better to use an object when you want the index to be a string (text).

Use an array when you want the index to be a number.

If you use a named index, JavaScript will redefine the array to a standard object.
*/


// is not the same as:
points = [40];                  // Create an array with one element    
points = new Array(40);         // Create an array with 40 undefined elements



/*
--------------------------
How to Recognize an Array
--------------------------
The problem is that the JavaScript operator typeof returns "object"
The typeof operator returns object because a JavaScript array is an object.
*/

    //Solution 1:
    //To solve this problem ECMAScript 5 (JavaScript 2009) defined a new method Array.isArray():

    Array.isArray(cars);            // true

    // Solution 2:
    // The instanceof operator returns true if an object is created by a given constructor:
    const fruits = ["Banana", "Orange", "Apple"];
    fruits instanceof Array;        // true




/*
-----------------------
Array Methods
-----------------------
The real strength of JavaScript arrays are the built-in array methods:
*/

    fruits = ["Banana", "Orange", "Apple", "Mango"];


    // Add as the last element - by push
    fruits.push("Pinapple");                  

    // Add as the last element - by length property
    myArray[myArray.length] = "Pinapple";

    
    // remove element from front or back end of an array

    someVar = myArray.shift();      // Remove first element and return it             
    someVar = myArray.pop();        // Remove last element and return it


    // toString() - converts array to a string of (comma separated) array values
    fruits.toString();  
    // Result: Banana,Orange,Apple,Mango


    // Join() - join all elements of an array into a string
    fruits.join("*");    
    // Result: "Banana*Orange*Apple*Mango"


    // concat() - 
    var courses2 = ["HTML 5", "CSS 3", "ES6"]; 
    var courses3 = courses1.concat(courses2);


    // Get subarray of elements from index 1 (include) to 4 (exclude)
    myArray0.slice(1,4);            // = [false,"js",12]



    // Remove 4 elements starting from index 2, and insert there strings
    // "hi","wr" and "ld"; return removed subarray                                 
    myArray0.splice(2,4,"hi","wr","ld");    // = ["js",12,56,90]



    cars.sort()             // Sorts the array






/*
---------------------------------
Looping Array Elements
---------------------------------
*/

    // for
    text = "<ul>";
    for (let i = 0; i<cars.length; i++) {
        text += "<li>" + cars[i] + "</li>";
    }
    text += "</ul>";


    // forEach
    cars.forEach(myFunction);
    text += "</ul>";

    function myFunction(value) {
        text += "<li>" + value + "</li>";
    }


    Examples:
    // Creates the corresponding array of points and output the sum of all gained points.
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