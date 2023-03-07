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
// code that wants the result of the “producing code” once it’s ready and must wait for it

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

        - Pending       -   Hasn't fulfilled or rejected yet
        - Fulfilled     -   The action relating to the promise succeeded
        - Rejected      -   The action relating to the promise failed
        - settled       -   Has fulfilled or rejected

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
// use of promises
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
// promise chaining
//-----------------

// we have a sequence of asynchronous tasks to be performed one after another 
// How can we code it well?

// Promises provide a couple of recipes to do that.
// promise chaining.

// It looks like this:

// Example-1
new Promise(function(resolve, reject) {
    setTimeout(() => resolve(1), 1000);     // (*)
}).then(function(result) {                  // (**)
    alert(result); // 1
    return result * 2;
}).then(function(result) {                  // (***)
    alert(result); // 2
    return result * 2;
}).then(function(result) {
    alert(result); // 4
    return result * 2;
});


// The idea is that the result is passed through the chain of .then handlers.

// Here the flow is:

//  1- The initial promise resolves in 1 second (*),
//  2- Then the .then handler is called (**), which in turn creates a new promise (resolved with 2 value).
//  3- The next then (***) gets the result of the previous one, processes it (doubles) and passes it to the next handler.
//  4- …and so on.

// As the result is passed along the chain of handlers, 
// we can see a sequence of alert calls: 
// 1 → 2 → 4

// The whole thing works, because every call to a .then returns a new promise, 
// so that we can call the next .then on it.

// When a handler returns a value, 
// it becomes the result of that promise, so the next .then is called with it.





// Example-2


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
// catch
//------------------------

let promise = new Promise((resolve, reject) => {
    setTimeout(() => reject(new Error("Whoops!")), 1000);
});
  
// .catch(f) is the same as promise.then(null, f)
promise.catch(alert); // shows "Error: Whoops!" after 1 second




// in the code below the URL to fetch is wrong (no such site) 
// and .catch handles the error

fetch('https://no-such-server.blabla') // rejects
  .then(response => response.json())
  .catch(err => alert(err)) // TypeError: failed to fetch (the text may vary)




// .catch doesn’t have to be immediate. 
// It may appear after one or maybe several .then.
// Or, maybe, everything is all right with the site, but the response is not valid JSON. 
// The easiest way to catch all errors is to append .catch to the end of chain:

// Normally, such .catch doesn’t trigger at all. 
// But if any of the promises above rejects (a network problem or invalid json or whatever), 
// then it would catch it.

  fetch('/article/promise-chaining/user.json')
  .then(response => response.json())
  .then(user => fetch(`https://api.github.com/users/${user.name}`))
  .then(response => response.json())
  .then(githubUser => new Promise((resolve, reject) => {
    let img = document.createElement('img');
    img.src = githubUser.avatar_url;
    img.className = "promise-avatar-example";
    document.body.append(img);

    setTimeout(() => {
      img.remove();
      resolve(githubUser);
    }, 3000);
  }))
  .catch(error => alert(error.message));




  getJSON('story.json').then(function(story) {
    return getJSON(story.chapterUrls[0]);
  }).then(function(chapter1) {
    addHtmlToPage(chapter1.html);
  }).catch(function() {
    addTextToPage("Failed to show chapter");
  }).then(function() {
    document.querySelector('.spinner').style.display = 'none';
  })



//------------------------
// finally
//------------------------

new Promise((resolve, reject) => {
    /* do something that takes time, and then call resolve or maybe reject */
})
// runs when the promise is settled, doesn't matter successfully or not
.finally(() => stop_loading_indicator)
// so the loading indicator is always stopped before we go on
.then(result => show_result, err => show_error)



new Promise((resolve, reject) => {
    setTimeout(() => resolve("value"), 2000);
})
.then(result => alert(result))              // <-- .then shows "value"
.catch(err => alert(err))                   // <-- .catch shows the error
.finally(() => alert("Promise ready"));     // triggers first





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

// makes the function return a promise

// The keyword “async” before a function means one simple thing: 
// a function always returns a promise. 

// Other values are wrapped in a resolved promise automatically.

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

// await literally suspends the function execution until the promise settles, 
// and then resumes it with the promise result.


        let value = await promise;


// how to use it ?


// Example

// Basic Syntax:

async function myDisplay() {

  let myPromise = new Promise(function(resolve, reject) {
    resolve("I love You !!");
  });

  let resolved = await myPromise; // wait until the myPromise resolves
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

    let resolved = await myPromise;    // wait until the myPromise resolves
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




// example


async function showAvatar() {

    // read our JSON
    let response = await fetch('/article/promise-chaining/user.json');
    let user = await response.json();
  
    // read github user
    let githubResponse = await fetch(`https://api.github.com/users/${user.name}`);
    let githubUser = await githubResponse.json();
  
    // show the avatar
    let img = document.createElement('img');
    img.src = githubUser.avatar_url;
    img.className = "promise-avatar-example";
    document.body.append(img);
  
    // wait 3 seconds
    await new Promise((resolve, reject) => setTimeout(resolve, 3000));
  
    img.remove();
  
    return githubUser;
  }
  
  showAvatar();



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