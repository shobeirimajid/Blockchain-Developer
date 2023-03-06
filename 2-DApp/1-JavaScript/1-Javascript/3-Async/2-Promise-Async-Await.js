///////////////////////////////////////////////////////
//                    Promises
///////////////////////////////////////////////////////

//-------------------------------------------
// Promises    ---   "I Promise a Result!"
//-------------------------------------------

// With asynchronous programming, 
// JavaScript programs can start long-running tasks,
// and continue running other tasks in paralell.

// But, asynchronus programmes are difficult to write and debug.
// Because of this, most modern asynchronous JavaScript methods don't use  "callbacks" 


// Instead, in JavaScript, asynchronous programming is solved using  "Promises"

// Promise is a better way for `asynchronous programming` 



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


// then() takes two arguments (resolve and reject) :

//  - callback for success 
//  - callback for failure

// The two arguments (resolve and reject) are pre-defined by JavaScript.
// We will not create them, but call one of them when the executor function is ready.

// Both are optional, so you can add a callback for success or failure only
// Very often we will not need a reject function.


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





//-----------------
// Example
//-----------------


// (1) Callback Solution

setTimeout(function() {
    console.log("Work 1");
    setTimeout(function() {
        console.log("Work 2");
    }, 2000);
}, 1000);

console.log("End");
   
// Output:  End 
//          Work 1      // after 1000 ms
//          Work 2      // after 2000 ms

// It prints "End", "Work 1" and "Work 2" in that order (the work is done asynchronously). 
// But if there are more events like this, the code becomes very complex.



// (2) Promise Solution

// ES6 comes to the rescue in such situations. 
// A promise can be created as follows:


new Promise(function(resolve, reject) {

    // doSomeWork()

    if (success)
        resolve(result);            // resolve is the method for success 
    else
        reject(Error("failure"));   // reject is the method for failure.
});


// or
    

function foo() {
    return new Promise((resolve, reject) => {
        let result = doSomeWork();
        if (result)
            resolve('Success');
        else
            reject('Something went wrong');
    });
}


// If a method returns a `promise`, its calls should use `then` which takes `two methods` as input:
// one for `success` 
// one for `failure`

Example:

function asyncFunc(work) {
    return new Promise(function(resolve, reject) {
        if (work === "")
            reject(Error("Nothing"));
        setTimeout(function() {
            resolve(work);
        }, 1000);
    });
}

asyncFunc("Work 1")                 // ----- task I -----
.then(function(result) {
    console.log(result);            // Work 1
    return asyncFunc("Work 2");     // ----- task II -----
}, function(error) {
    console.log(error);
})
.then(function(result) {
    console.log(result);            // Work 2     
}, function(error) {
    console.log(error);
});

console.log("End");
                        
// Output:      End 
//              Work 1
//              Work 2 

// It also prints "End", "Work 1" and "Work 2" (the work is done asynchronously). 

// But, this is clearly more readable than the previous example 
// and in more complex situations it is easier to work with




//------------------------
// Async , Await 
//------------------------

// async and await make promises easier to write

// async makes a function   "return a Promise"
// await makes a function   "wait for a Promise"

// keywords async and await was introduced by ECMAScript 2017



//----------------
// Async 
// ---------------

// The keyword async before a function makes the function return a promise

async function myFunction() {
    return "Hello";
}

// Is the same as:

function myFunction() {
    return Promise.resolve("Hello");
}

// Here is how to use the Promise:

myFunction()
.then(
    function(value) { 
        /* code if successful */ 
    },
    function(error) { 
        /* code if some error */ 
    }
);

// Example

async function myFunction() {
  return "Hello";
}

myFunction()
.then(
    function(value) {
        myDisplayer(value);
    },
    function(error) {
        myDisplayer(error);
    }
);

// Or simpler, since you expect a normal value (a normal response, not an error):

async function myFunction() {
    return "Hello";
}

myFunction()
.then(
    function(value) {
        myDisplayer(value);
    }
);


//----------------
// Await 
// ---------------

// The await keyword can only be used inside an async function.

// The await keyword makes the function pause the execution 
//   and wait for a resolved promise before it continues    

        let value = await promise;


// how to use it ?


// Example

// Basic Syntax:

async function myDisplay() {

  let myPromise = new Promise(function(resolve, reject) {
    resolve("I love You !!");
  });

  let resolved = await myPromise;
  console.log(resolved);
}

myDisplay();


// Waiting for a Timeout

async function myDisplay() {

    let myPromise = new Promise(function(resolve) {
        setTimeout(function() {
            resolve("I love You !!");
        }, 3000);
    });

    let resolved = await myPromise;
    console.log(resolved);
}
  
myDisplay();


// Waiting for a File

async function getFile() {

    let myPromise = new Promise(function(resolve) {
      let req = new XMLHttpRequest();
      req.open('GET', "mycar.html");
      req.onload = function() {
        if (req.status == 200) {
          resolve(req.response);
        } else {
          resolve("File not Found");
        }
      };
      req.send();
    });

    let resolved = await myPromise;
    console.log(resolved);
}
  
getFile();


//------------------------
// New Features
//------------------------


//------------------------
// Asynchronous Iteration - ECMAScript 2018
//------------------------

// ECMAScript 2018 added asynchronous iterators and iterables.
// JavaScript asynchronous iteration is supported in all modern browsers since January 2020:

// With asynchronous iterables, we can use the await keyword in for/of loops.

for await (x of iterable) {

}



//------------------------
// Promise.finally      - ECMAScript 2018
//------------------------

// ECMAScript 2018 finalizes the full implementation of the Promise object with Promise.finally
// Promise.finally is supported in all modern browsers since November 2018:

// Example

let myPromise = new Promise();

myPromise.then();
myPromise.catch();
myPromise.finally();



//------------------------
// Promise.allSettled()      - ECMAScript 2020
//------------------------

Promise.allSettled([prom1,prom2,prom3]).then {}



//------------------------
// Promise.any()            - ECMAScript 2021
//------------------------

const first = await Promise.any([prom1,prom2,prom3]);