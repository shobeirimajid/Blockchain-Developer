
///////////////////////////////////////////////////////
//  Default Parameters in ES6
///////////////////////////////////////////////////////

// In ES6, we can put the default values right in the signature of the functions.

    example:
    
    function test(a, b = 3, c = 42) {
        return a + b + c;
    }
    console.log(test(5));


// And here's an example of an arrow function with default parameters:

    const test = (a, b = 3, c = 42) => {
        return a + b + c;
    }
    console.log(test(5)); //50 

    // Full ES6 equivalent
    const test = (a, b = 3, c = 42) => a + b + c;
    console.log(test(5));


// Default value expressions are evaluated at function call time from left to right. 
// This also means that default expressions can use the values of previously-filled parameters.