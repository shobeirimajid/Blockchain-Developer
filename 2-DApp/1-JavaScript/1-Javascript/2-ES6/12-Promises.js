/*
---------------------------
    ES6 Promises
    ---------------------------
    A `Promise` is a better way for `asynchronous programming` 
    when compared to the common way of using method `setTimeout()`
    

    Consider this example:



            setTimeout(function() {
                console.log("Work 1");
                setTimeout(function() {
                    console.log("Work 2");
                }, 2000);
            }, 1000);

            console.log("End");

            

    // Output:  End 
                Work 1      // after 1000 ms
                Work 2      // after 2000 ms


    It prints "End", "Work 1" and "Work 2" in that order (the work is done asynchronously). 


    But if there are more events like this, 
    the code becomes very complex.

    ES6 comes to the rescue in such situations. 


    A promise can be created as follows:



        new Promise(function(resolve, reject) {

            // Work

            if (success)
                resolve(result);
            else
                reject(Error("failure"));
        });
    
        // resolve is the method for success 
        // reject is the method for failure.



        or


        
        function foo() {
            return new Promise((resolve, reject) => {
                let result = getSomeResult();
                if (result)
                    resolve('Success');
                else
                    reject('Something went wrong');
            });
        }


    


    If a method returns a `promise`

        its calls should use the `then` 

        which takes `two methods` as input:

            one for `success` 
            the other for the `failure`.


    For Example:


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


                            
        // Output:  End 
                    Work 1
                    Work 2 



    It also prints "End", "Work 1" and "Work 2" 
    (the work is done asynchronously). 
    
    But, this is clearly more readable than the previous example 
    and in more complex situations it is easier to work with.
*/