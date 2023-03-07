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
    var cars = ["Saab", "Volvo", "BMW"];

    // You can also create an array, and then provide the elements:
    cars = [];
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
    alert( courses1.length );   // length 3
    alert( courses1[0] );       // undefined! no elements.
    courses1[0] = "HTML";
    courses1[1] = "CSS";
    courses1[2] = "JS";
    alert( courses1[0] );       // "HTML"



// Some word about “length”

// The length property automatically updates when we modify the array. 
// To be precise, it is actually not the count of values in the array, 
// but the greatest numeric index plus one.

let fruits = [];
fruits[123] = "Apple";
alert( fruits.length ); // 124

// “length” is writable

let arr = [1, 2, 3, 4, 5];

arr.length = 2; // truncate to 2 elements
alert( arr ); // [1, 2]

arr.length = 5; // return length back
alert( arr[3] ); // undefined: the values do not return

arr.length = 0;   // the simplest way to clear the array




    
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
    fruits = ["Banana", "Orange", "Apple"];
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
    someVar = fruits.shift();  
    
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



/*
-----------------------
Sorting an Array
-----------------------
*/


    //------------ Alphabetically ----------

    // sort() - sorts an array alphabetically
    fruits = ["Banana", "Orange", "Apple", "Mango"];
    fruits.sort();
    // fruits =     [Apple,Banana,Mango,Orange]

    
    //-------------- Descending -------------

    // reverse() - reverses the elements in an array
    // You can use it to sort an array in descending order
    fruits = ["Banana", "Orange", "Apple", "Mango"];
    fruits.sort();      // [Apple,Banana,Mango,Orange]
    fruits.reverse();   // [Orange,Mango,Banana,Apple]


    //-------------- Numerically -------------
    /*
    By default, the sort() function sorts values as strings.
    This works well for strings ("Apple" comes before "Banana").

    However, if numbers are sorted as strings, "25" is bigger than "100", 
        because "2" is bigger than "1".

    Because of this, the sort() method will produce incorrect result when sorting numbers.

    You can fix this by providing a compare function for sort():

    function(a, b){return a - b}

    The compare function compares all the values in the array, two values at a time (a, b).

    The compare function should return a negative, zero, or positive value, 
        depending on the arguments.

    When the sort() function compares two values, it sends the values to the compare function, 
        and sorts the values according to the returned (negative, zero, positive) result:

        result < 0      ->      a < b       ->      a is sorted before b

        result > 0      ->      b < a       ->      b is sorted before a

        result == 0     ->      a == b      ->      no changes are done
    */

    // Ascending
    points = [40, 100, 1, 5, 25, 10];
    points.sort(function(a, b){return a - b});  // 1,5,10,25,40,100
    // points[0]                    min value
    // points[points.length-1]      max value


    // Descending
    points = [40, 100, 1, 5, 25, 10];
    points.sort(function(a, b){return b - a});  // 40,1,25,5,100,10
    // points[0]                    max value
    // points[points.length-1]      min value


    // Randomly
    points = [40, 100, 1, 5, 25, 10];
    points.sort(function(){return 0.5 - Math.random()});    // Ex. 40,1,5,25,10,100

    /*
        The above example, is not accurate. It will favor some numbers over the others.
        The most popular correct method, is `Math.random()`
        Math.random() give a random number in range [0 .. 1)
    */

    // 
    points = [40, 100, 1, 5, 25, 10];

    for (let i = points.length -1; i > 0; i--) {
        // following line give a random number in range [0 .. i+1) 
        let j = Math.floor(Math.random() * (i+1));
        randElem = points[j];   // randomly selected element placed in [0 .. i+1) 

        // swap element points[i] and randomly selected element
        let k = points[i];
        points[i] = randElem;
        points[j] = k;
    }


    // Sorting Object Arrays
    myCars = [
        {car:"Volvo", speed:260},
        {car:"Saab", speed:200},
        {car:"BMW", speed:300}
    ];

    // sorting the array Ascending, based on students `marks`
    myCars.sort(function(a, b){return a.speed - b.speed});
    console.log(myCars);

    // sorting the array Ascending, based on students `names`
    myCars.sort(function(a, b){
        let x = a.car.toLowerCase();
        let y = b.car.toLowerCase();
        if (x < y) {return -1;}
        if (x > y) {return 1;}
        return 0;
      });
      console.log(myCars);




/*
-----------------------
Find Max / Min
-----------------------  
if you only want to find the max or min value, 
    Sorting a whole array is a very inefficient method.

We can use Math.max.apply() instead of Sorting an array

    Math.max.apply(null, [1, 2, 3]) ~ Math.max(1, 2, 3)
*/

    function myArrayMax(arr) {
        return Math.max.apply(null, arr);
    }


    // method to achieve more `fast` solution
    function myArrayMax(arr) {

        let len = arr.length;
        let max = -Infinity;        // let min = Infinity;

        while (len--) {
          if (arr[len] > max) {     // if (arr[len] < min) {
            max = arr[len];        
          }
        }
        return max;                 
    }



/*
---------------------------------
Array Iteration
---------------------------------
*/

    cars = ["Saab", "Volvo", "BMW"];


    //------------  for  --------------
    text = "<ul>";
    for (let i = 0; i<cars.length; i++) {
        text += "<li>" + cars[i] + "</li>";
    }
    text += "</ul>";


    //----------  forEach  ------------
    // calls a function (a callback function) once for each array element.

    text = "<ul>";
    cars.forEach(myFunction);
    text += "</ul>";

    function myFunction(value, index, array) {
        text += "<li>" + value + "</li>";
    }


    //----------  map()  ------------
    // creates a new array by performing a callback function on each array element.
    // does not execute the callback function for array elements without values.
    // does not change the original array.

    //  multiplies each array element by 2
    numbers1 = [45, 4, 9, 16, 25];
    numbers2 = numbers1.map(myFunction);

    function myFunction(value, index, array) {
        return value * 2;
    }
    console.log(numbers2);  // 90,8,18,32,50



    //----------  filter()  ------------
    // creates a new array with array elements that pass a test.

    // creates a new array from elements with a value larger than 20
    numbers = [45, 4, 9, 16, 25];
    over20 = numbers.filter(myFunction);

    function myFunction(value, index, array) {
        return value > 20;
    }
    console.log(over20);  // 45,25



    //----------  reduce()  ------------
    // runs a function on each array element to produce (reduce it to) a single value
    // does not modify the original array
    // works from `left-to-right` in the array
    

    // finds the sum of all numbers in an array

    // way 1
    numbers = [45, 4, 9, 16, 25];
    sum = numbers.reduce(myFunction);

    function myFunction(total, value, index, array) {
        return total + value;
    }
    console.log(sum);  // 99

    
    // way 2
    numbers = [45, 4, 9, 16, 25];
    sum = numbers.reduce(function(total, value){
        return total + value;
    },0)

    // sum of points
    console.log(sum);   // 99



    //----------  reduceRight()  ------------
    // runs a function on each array element to produce (reduce it to) a single value
    // does not modify the original array
    // works from `right-to-left` in the array.

    // finds the sum of all numbers in an array
    numbers = [45, 4, 9, 16, 25];
    sum = numbers.reduceRight(myFunction);

    function myFunction(total, value, index, array) {
        return total + value;
    }
    console.log(sum);  // 99



    //----------  every()  ------------
    // checks wether all array values pass a test or not
    // returns true, If all the array values pass the test
    // returns false, If at least one of the array values doesn't pass the test

    // checks wether all array values are larger than 20 or not
    numbers = [45, 4, 9, 16, 25];
    allOver20 = numbers.every(myFunction);

    function myFunction(value, index, array) {
        return value > 20;
    }
    console.log(allOver20);  // false



    //----------  some()  ------------
    // checks if some array values pass a test

    // checks if some array values are larger than 20
    numbers = [45, 4, 9, 16, 25];
    someOver18 = numbers.some(myFunction);

    function myFunction(value, index, array) {
        return value > 20;
    }
    console.log(someOver18);  // true



    //----------- indexOf(item, i) -------------
    // item :   The item to search for (Required)
    // i    :   Optional
    // starts from index 'i' and searches an array for value 'item' and returns found element's index                  
    // Negative values for 'i' will start at the given position counting from the end, and search to the end.
    // returns -1 if the item is not found.
    // If the item is present more than once, it returns the index of the first occurrence.
    
    // Search an array for the item "Apple":
    fruits = ["Apple", "Orange", "Apple", "Mango"];
    position = fruits.indexOf("Apple"); // 0



    //----------  lastIndexOf(item, i)  ------------
    // is the same as indexOf(), but :
    // returns the index of the last occurrence of the specified value.
    // Negative values for 'i' will start at the given position counting from the end, and search to the beginning

    // Search an array for the item "Apple":
    fruits = ["Apple", "Orange", "Apple", "Mango"];
    position = fruits.lastIndexOf("Apple"); // 2



    //----------  find()  ------------
    // is an ES6 feature (JavaScript 2015) - It is supported in all modern browsers
    // returns the value of the first array element that passes a test function

    //  finds (returns the value of) the first element that is larger than 20
    numbers = [4, 9, 16, 25, 29];
    first = numbers.find(myFunction);

    function myFunction(value, index, array) {
        return value > 20;
    }
    console.log(first); // 25



    //----------  findIndex()  ------------
    // is an ES6 feature (JavaScript 2015) - It is supported in all modern browsers
    // returns the index of the first array element that passes a test function

    // finds the index of the first element that is larger than 20
    numbers = [4, 9, 16, 25, 29];
    first = numbers.findIndex(myFunction);

    function myFunction(value, index, array) {
        return value > 20;
    }
    console.log(first); // 3



    //----------  from()  ------------
    // is an ES6 feature (JavaScript 2015) - It is supported in all modern browsers
    // is not supported in Internet Explorer
    // returns an Array object from any object with a length property or any iterable object

    // Create an Array from a String
    myArr = Array.from("ABCDEFG");
    console.log(myArr); // [A,B,C,D,E,F,G]



    //----------  Keys()  ------------
    // is an ES6 feature (JavaScript 2015) - It is supported in all modern browsers
    // is not supported in Internet Explorer
    // returns an Array Iterator object with the keys of an array

    // Create an Array Iterator object, containing the index of array elements
    fruits = ["Banana", "Orange", "Apple", "Mango"];
    keys = fruits.keys();

    text = "";
    for (let x of keys) {
        text += x + ",";
    }
    console.log(text); // 0,1,2,3,



    //----------  entries()  ------------
    // is an ES6 feature (JavaScript 2015) - It is supported in all modern browsers
    // is not supported in Internet Explorer
    // returns an Array Iterator object with the key-value pairs
    // does not change the original array

    // Create an Array Iterator, and then iterate over the key/value pairs:
    fruits = ["Banana", "Orange", "Apple", "Mango"];
    f = fruits.entries();

    for (let x of f) {
        console.log(x); 
    }
    /*
        [0, "Banana"]
        [1, "Orange"]
        [2, "Apple"]
        [3, "Mango"]
    */

    
    //----------  includes(search-item)  ------------
    // is an ES6 feature (JavaScript 2015) - It is supported in all modern browsers
    // is not supported in Internet Explorer
    // allows us to check if `search-item` is present in array (including NaN, unlike indexOf)

    // Search an array for the item "Apple":
    fruits = ["Apple", "Orange", "Apple", "Mango"];
    result = fruits.includes("Mango"); 
    console.log(result); // true



    //----------  Spread  ------------
    // is an ES6 feature (JavaScript 2015) - It is supported in all modern browsers
    // is not supported in Internet Explorer
    // The `...` operator expands an iterable (like an array) into more elements

    const q1 = ["Jan", "Feb", "Mar"];
    const q2 = ["Apr", "May", "Jun"];
    const q3 = ["Jul", "Aug", "Sep"];
    const q4 = ["Oct", "Nov", "May"];

    const months = [...q1, ...q2, ...q3, ...q4];
    console.log(months); // Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,May




/*
---------------------------------
Const Arrays
---------------------------------
It has become a common practice to declare arrays using `const`
`const` introduced In ECMAScript 2015 (ES6)
The const keyword is not supported in Internet Explorer 10 or earlier.

first browser versions with full support for the const keyword
-------------------------------------------------------------------
Chrome 49	IE 11 / Edge	Firefox 36	Safari 10	Opera 36
---------   ------------    ----------  ---------   ---------
Mar, 2016	Oct, 2013	    Feb, 2015	Sep, 2016	Mar, 2016


An array declared with `const` cannot be reassigned

    NOTE:

    It does NOT define a constant array. 
    It defines a constant `reference` to an array.

    Because of this, we can still change the elements of a constant array!
    We are just unable to reassigne the whole array
    But Elements of the array Can be Reassigned yet
*/

    const someCars = ["Saab", "Volvo", "BMW"];

    // Error:  An array declared with `const` cannot be reassigned
    someCars = ["Toyota", "Volvo", "Audi"];    // ERROR

    // You can change an element:
    someCars[0] = "Toyota";
    console.log(someCars);

    // You can add an element:
    someCars.push("Audi");
    console.log(someCars);

    // Error:  An array declared with const must be initialized when it is declared.
    const someCars2;
    cars = ["Saab", "Volvo", "BMW"];


    // An array declared with const has `Block Scope` and 
    //  is not the same as an array declared outside the block:

    const cars = ["Saab", "Volvo", "BMW"];
    // Here cars[0] is "Saab"

    {
        const cars = ["Toyota", "Volvo", "BMW"];
        // Here cars[0] is "Toyota"
    }

    // Here cars[0] is "Saab"



    // Redeclaring or reassigning an array to const, in the same scope,
    //   or in the same block, is not allowed:

    var cars = ["Volvo", "BMW"];     // Allowed

    const cars = ["Volvo", "BMW"];   // Not allowed

    {
        var cars = ["Volvo", "BMW"];   // Allowed
        const cars = ["Volvo", "BMW"]; // Not allowed
    }



    // Redeclaring or reassigning an existing const array, 
    //  in the same scope, or in the same block, is not allowed:

    const cars = ["Volvo", "BMW"];   // Allowed
    const cars = ["Volvo", "BMW"];   // Not allowed

    var cars = ["Volvo", "BMW"];     // Not allowed
    cars = ["Volvo", "BMW"];         // Not allowed

    {
        const cars = ["Volvo", "BMW"]; // Allowed
        const cars = ["Volvo", "BMW"]; // Not allowed

        var cars = ["Volvo", "BMW"];   // Not allowed
        cars = ["Volvo", "BMW"];       // Not allowed
    }



    // Redeclaring an array with const, 
    //  in another scope, or in another block, is allowed:

    const cars = ["Volvo", "BMW"];   // Allowed

    {
        const cars = ["Volvo", "BMW"]; // Allowed
    }

    {
        const cars = ["Volvo", "BMW"]; // Allowed
    }




    // Arrays declared with var can be initialized at any time.
    // You can even use the array before it is declared:
    varCars = ["Saab", "Volvo", "BMW"];
    var varCars;


    // An array declared with var does not have block scope:
    var cars = ["Saab", "Volvo", "BMW"];
    // Here cars[0] is "Saab"
    {
    var cars = ["Toyota", "Volvo", "BMW"];
    // Here cars[0] is "Toyota"
    }
    // Here cars[0] is "Toyota"


    // Redeclaring an array declared with var is allowed anywhere in a program:
    var cars = ["Volvo", "BMW"];   // Allowed
    var cars = ["Toyota", "BMW"];  // Allowed
    cars = ["Volvo", "Saab"];      // Allowed