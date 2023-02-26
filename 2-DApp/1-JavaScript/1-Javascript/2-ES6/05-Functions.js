/*
--------------------------------------
Functions in ECMAScript 6
--------------------------------------


//-------------------------------
//      lambda syntax
//-------------------------------


// There is a new syntax for functions in ES6 known as "lambda syntax".
// This allows functions to be defined in a lexical scope like with variables
// defined by const and let. 

const isEven = (number) => {
    return number % 2 === 0;
};

isEven(7); // false

// The "equivalent" of this function in the traditional syntax would look like this:

function isEven(number) {
    return number % 2 === 0;
};


// I put the word "equivalent" in double quotes because a function defined
// using the lambda syntax cannot be called before the definition.


// an example of invalid usage:

add(1, 8);

const add = (firstNumber, secondNumber) => {
    return firstNumber + secondNumber;
};



//-------------------------------
//      arrow functions
//-------------------------------


    Prior to ES6, a JavaScript function was defined like this:



        function add(x, y) {
            var sum = x+y;  
            console.log(sum);
        }

        add(35, 7);



    ES6 introduces a new syntax for writing functions. 
    The same function from above can be written as:



        const add = (x, y) => {
            let sum = x + y;  
            console.log(sum);
        }

        add(35, 7);



    This new syntax is quite handy when 
    you just need a simple function with one argument.
        You can skip typing function and return, 
        as well as some parentheses and braces.

    For example:

        const greet = x => "Welcome " + x;
        alert(greet("David"));
    

    The code above defines 
    a function named greet
     that has one argument 
     and returns a message.

    If there are no parameters, 
    an empty pair of parentheses should be used, 
    as in:

        const x = () => alert("Hi");
        x();

    
    The syntax is very useful for inline functions. 
    For example, let's say we have an array, 
    and for each element of the array we need to execute a function. 
    
    We use the forEach method of the array 
    to call a function for each element:


        var arr = [2, 3, 7, 8];

        arr.forEach(function(el) {
            console.log(el * 2);
        });


    However, in ES6, the code above can be rewritten as following:


        const arr = [2, 3, 7, 8];

        arr.forEach(v => {
            console.log(v * 2);
        });

    
    The code is shorter and looks pretty nice, doesn't it?




    an arrow function that takes an array and prints the odd elements.

        const printOdds = (arr) => {
            arr.forEach(el => {
                if (el % 2 != 0) console.log(el);
            });
        }


*/