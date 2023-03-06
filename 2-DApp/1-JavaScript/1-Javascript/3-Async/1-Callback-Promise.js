///////////////////////////////////////////////////////
//                   Callbacks
///////////////////////////////////////////////////////
/*

A `callback` is a `function` passed as an `argument` to another function

This technique allows a function to `call another function`

A `callback function` can run after another function has finished

*/


//-----------------------------
// Function Sequence
//-----------------------------

// JavaScript functions are executed in the sequence they are called. 
// Not in the sequence they are defined.


function myFirst() {
    myDisplayer("Hello");
}
  
function mySecond() {
    myDisplayer("Goodbye");
}
  
// This example will end up displaying "Goodbye"
myFirst();      // Hello
mySecond();     // Goodbye


// This example will end up displaying "Hello"
mySecond();
myFirst();



//-----------------------------
// Sequence Control
//-----------------------------

// Sometimes you would like to have better control over 'when' to execute a function.

// Suppose you want to do a 'calculation', and then display the 'result'


// Solution 1

function myDisplayer(some) {
    console.log(some);
}
  
function myCalculator(num1, num2) {
    let sum = num1 + num2;
    return sum;
}
  
// You could call the myCalculator() and save the result
// Then call myDisplayer() to display the result

let result = myCalculator(5, 5);
myDisplayer(result);

// The problem with the above Solution, is that :
// you have to call two functions to display the result.


// Solution 2

// you could call the myCalculator()
// And let the myCalculator() call the myDisplayer() to display the result

function myDisplayer(some) {
    console.log(some);
}
  
function myCalculator(num1, num2) {
    let sum = num1 + num2;
    myDisplayer(sum);
}
  
myCalculator(5, 5);

// The problem with the above Solution, is that :
// you cannot prevent the calculator function from displaying the result.


// Now it is time to bring in a `callback`




//-----------------------------
// JavaScript Callbacks   ---   "I will call back later!"
//-----------------------------

// A callback is a function passed as an argument to another function.

// Using a callback, you could call the myCalculator() with a callback (myCallback) 
// and let the myCalculator() run the callback after the calculation is finished

function myDisplayer(some) {
    console.log(some);
}
  
function myCalculator(num1, num2, myCallback) {
    let sum = num1 + num2;
    myCallback(sum);
}
  
myCalculator(5, 5, myDisplayer);


// In the example above, myDisplayer is a `callback function`

// It is passed to myCalculator() as an argument

//----------
// Note
//----------
// When you pass a function as an argument, remember not to use parenthesis.

// Wrong: 
    myCalculator(5, 5, myDisplayer());

// Right: 
    myCalculator(5, 5, myDisplayer);


// Example

// Create an Array
const myNumbers = [4, 1, -20, -7, 5, 9, -6];


// Call removeNeg with a callback
const posNumbers = removeNeg(myNumbers, (x) => x >= 0);


// Display Result
console.log(posNumbers);


// Keep only positive numbers
function removeNeg(numbers, callback) {

  const myArray = [];

  for (const x of numbers) {
    if (callback(x)) {
      myArray.push(x);
    }
  }

  return myArray;
}

// In the example above   (x) => x >= 0   is a callback function.
// It is passed to removeNeg() as an argument.

// The examples above are not very exciting.
// They are simplified to teach you the callback syntax.




//-----------------------------
// Asynchronous functions   ---   "I will finish later!"
//-----------------------------

// Where callbacks really shine are in "asynchronous functions"
//   where one function has to wait for another function (like waiting for a file to load).

// `Asynchronous Functions` are functions that `running in parallel` with other functions


//---------------
//  setTimeout()
//---------------

// The examples used in the part `Callbacks` was very simplified.
// The purpose of the examples was to demonstrate the syntax of callback functions
// myDisplayer() was the function that was passed to myCalculator() as an argument.

// In the real world, callbacks are most often used with asynchronous functions.
// A typical example is JavaScript setTimeout().


// When using the JavaScript function setTimeout(), 
// you can specify a callback function to be executed on time-out:

setTimeout(myFunction, 3000);

function myFunction() {
  console.log("I love You");
}

// In the example above, myFunction is used as a callback.
// myFunction is passed to setTimeout() as an argument.
// 3000 is the number of milliseconds before time-out, so myFunction() will be called after 3 seconds.

// Instead of passing the name of a function as an argument to another function, 
//   you can always pass a whole function instead:

setTimeout(function() { myFunction("I love You !!!"); }, 3000);

function myFunction(value) {
    console.log("I love You");
}

// In the example above, function(){ myFunction("I love You !!!"); } is used as a callback. 
// It is a complete function. The complete function is passed to setTimeout() as an argument.

// 3000 is the number of milliseconds before time-out, 
// so myFunction() will be called after 3 seconds.



//------------------
//  setInterval()
//------------------

// When using the JavaScript function setInterval(), 
// you can specify a callback function to be executed for each interval:

setInterval(myFunction, 1000);

function myFunction() {
  let d = new Date();
  console.log(d.getHours() + ":" +d.getMinutes() + ":" +d.getSeconds());
}


// In the example above, myFunction is a callback that passed to setInterval() as an argumen.
// 1000 is the number of milliseconds between intervals, so myFunction() will be called every second.




//-----------------------------
// Promises    ---   "I Promise a Result!"
//-----------------------------

// With asynchronous programming, 
// JavaScript programs can start long-running tasks,
// and continue running other tasks in paralell.

// But, asynchronus programmes are difficult to write and difficult to debug.

// Because of this, most modern asynchronous JavaScript methods don't use  "callbacks" 

// Instead, in JavaScript, asynchronous programming is solved using  "Promises"


// --- Producing code ---
// code that can take some time


// --- Consuming code ---
// code that must wait for the result

// --- Promise ---
// JavaScript object that links `producing` and `consuming` codes



let myPromise = new Promise(function(myResolve, myReject) {

    // "Producing Code" (May take some time)

    myResolve(); // when successful
    myReject();  // when error
});
    

// "Consuming Code" (Must wait for a fulfilled Promise)

myPromise.then(
    function(value) { 
        /* code if successful */ 
    },
    function(error) { 
        /* code if some error */ 
    }
);

/*
    When the producing code obtains the result, it should call one of the two callbacks:

    Result	    Call
    -------     ------------------------
    Success	    myResolve(result value)
    Error	    myReject(error object)
*/



//----------------------------
// Promise Object Properties
//----------------------------
/*
    A JavaScript Promise object can be:

        - Pending
        - Fulfilled
        - Rejected

    The Promise object supports two properties: 
    
        - state
        - result

    While a Promise object is "pending" (working), 
        the result is `undefined`

    When a Promise object is "fulfilled", 
        the result is a `value`

    When a Promise object is "rejected", 
        the result is an `error object`

    ---------------     -----------------
    myPromise.state	    myPromise.result
    ---------------     -----------------
    pending	            undefined
    fulfilled	        a result value
    rejected	        an error object


    * You cannot access the Promise properties `state` and `result`
    * You must use a Promise method to handle promises.

*/


//-------------------------
// how to use a Promise
//-------------------------
myPromise.then(
    function(value) { 
        /* code if successful */ 
    },
    function(error) { 
        /* code if some error */ 
    }
);

// Promise.then() takes two arguments: 
//      - a callback for success 
//      - a callback for failure


// Both are optional, so you can add a callback for success or failure only


function myDisplayer(some) {
    console.log(some);
}
  

let aPromise = new Promise(function(myResolve, myReject) {

    let x = 0;
  
    // The producing code (this may take some time)
  
    if (x == 0) {
      myResolve("OK");
    } else {
      myReject("Error");
    }
});
  

aPromise.then(
    function(value) {
        myDisplayer(value);
    },
    function(error) {
        myDisplayer(error);
    }
);


//------------------------
// Promise Examples
//-----------------------

// To demonstrate the use of promises, we will use the callback examples from previous parts

//    - Waiting for a Timeout
//    - Waiting for a File



// --- Waiting for a Timeout ---


// Using Callback

setTimeout(function() { 
    myFunction("I love You"); 
}, 3000);

function myFunction(value) {
  console.log(value);
}


//  Using Promise

let bPromise = new Promise(function(myResolve, myReject) {
    setTimeout(function() { 
        myResolve("I love You"); 
    }, 3000);
});

bPromise.then(function(value) {
    console.log(value);
});



// --- Waiting for a File ---


// using Callback

function getFile(myCallback) {

    let req = new XMLHttpRequest();

    req.open('GET', "mycar.html");

    req.onload = function() {

      if (req.status == 200) {
        myCallback(req.responseText);
      } else {
        myCallback("Error: " + req.status);
      }

    }

    req.send();
}
  
getFile(myDisplayer);



// using Promise

let cPromise = new Promise(function(myResolve, myReject) {

  let req = new XMLHttpRequest();

  req.open('GET', "mycar.htm");

  req.onload = function() {

    if (req.status == 200) {
      myResolve(req.response);
    } else {
      myReject("File not Found");
    }

  };

  req.send();
});


cPromise.then(
    function(value) {
        myDisplayer(value);
    },
    function(error) {
        myDisplayer(error);
    }
);