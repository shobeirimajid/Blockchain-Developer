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

    cars.length                     // Returns the number of elements ~~ length = (highest array index + 1)
    cars[0];                        // Accessing the First Array Element
    cars[cars.length - 1]           // Accessing the Last Array Element
    cars[2];   // "BMW"
    cars[2] = "Ford";               // Modify at specific index
    cars[cars.length] = "Lemon";    // Add new data as the last element



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

    // Join() - join all elements of an array into a string
    fruits.join("*");    
    // Result: "Banana*Orange*Apple*Mango"

    // pop() - Remove last element and return it
    someVar = fruits.pop();   
    
    // shift() - Remove first element and return it.
    someVar = myArray.shift();  
    
    // push() - Add as the last element
    fruits.push("Lemon");   

    // unshift() adds a new element at the beginning of array and "unshifts" older elements
    fruits.unshift("Lemon");
    
    // delete(i) - delete element in the index 'i' of array
    delete fruits[0];   // delete() leaves undefined holes in the array - Use pop() or shift() instead.
    
    // concat() - creates a new array by merging (concatenating) existing arrays - without changing the existing arrays
    const myGirls = ["Cecilie", "Lone"];
    const myBoys = ["Emil", "Tobias", "Linus"];
    const myChildren = myGirls.concat(myBoys);          // [Cecilie,Lone,Emil,Tobias,Linus]
    
    // concat() can take any number of array arguments:
    const arr1 = ["Robin", "Morgan"];
    const myChildren2 = myGirls.concat(myBoys, arr1);   // [Cecilie,Lone,Emil,Tobias,Linus,Robin,Morgan]

    // can also take strings as arguments:
    const myChildren3 = myBoys.concat("Peter");         // [Emil,Tobias,Linus,Peter]

    // splice(p, n, ...)
    // p : defines the position where new elements should be added (spliced in)
    // n : defines how many elements should be removed
    // ..: The rest of the parameters define the new elements to be added.
    // splice() returns an subarray with the deleted items

    fruits = ["Banana", "Orange", "Apple", "Mango"];                           
    fruits.splice(2, 0, "Lemon", "Kiwi");                       
    // fruits =         [Banana,Orange,Lemon,Kiwi,Apple,Mango]

    fruits = ["Banana", "Orange", "Apple", "Mango"];
    var remoedItems = fruits.splice(2, 2, "Lemon", "Kiwi");     
    // fruits =         [Banana,Orange,Lemon,Kiwi]  
    // remoedItems =    [Apple,Mango]

    fruits = ["Banana", "Orange", "Apple", "Mango"];
    var remoedItems = fruits.splice(0, 1);  
    // Remove first element and return it.
    // fruits =             [Orange,Apple,Mango]
    // remoedItems =        [Banana]


    // slice(p1, [p2]) - selects and returns elements from an array, starting from p1 (include) up to p2 (not include)
    // p2 is optional
    // slice() creates a new array.
    // slice() does not remove any elements from the source array.

    fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];

    citrus = fruits.slice(1);
    // citrus =     [Orange,Lemon,Apple,Mango]

    citrus = fruits.slice(2);
    // citrus =     [Lemon,Apple,Mango]

    citrus = fruits.slice(3);
    // citrus =     [Apple,Mango]

    citrus = fruits.slice(4);
    // citrus =     [Mango]

    citrus = fruits.slice(1, 3);
    // citrus =     [Orange,Lemon]


    // toString() - automatically converts an array to a comma separated string
    // This is always the case when you try to output an array.
    // All JavaScript objects have a toString() method

    fruits = ["Banana", "Orange", "Apple", "Mango"];
    fruits.toString();  
    // fruits =     Banana,Orange,Apple,Mango


    // sort() - sorts an array alphabetically
    fruits = ["Banana", "Orange", "Apple", "Mango"];
    fruits.sort();
    // fruits =     [Apple,Banana,Mango,Orange]


    // reverse() - reverses the elements in an array
    // You can use it to sort an array in descending order
    fruits = ["Banana", "Orange", "Apple", "Mango"];
    fruits.sort();      // [Apple,Banana,Mango,Orange]
    fruits.reverse();   // [Orange,Mango,Banana,Apple]











    https://www.w3schools.com/js/js_array_sort.asp



                        Numeric Sort










 /*
 ----------------------------
 Max/Min Values of Array
-----------------------------
There are no built-in functions for finding the highest or lowest value in a JavaScript array.

    max
    ---------------------
    1.sort()    // Ascending
    2.pop()     // max

    min
    ---------------------
    1.sort()    // Ascending
    2.reverse() // Descending
    2.pop()     // min




*/






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