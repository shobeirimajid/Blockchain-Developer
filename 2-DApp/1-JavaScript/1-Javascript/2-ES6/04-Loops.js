
///////////////////////////////////////////////////////
//    Loops in ES6
///////////////////////////////////////////////////////

// In JavaScript we commonly use the 'for' loop to iterate over values in a 'list':

    let arr = [1, 2, 3];

    for (let k = 0; k < arr.length; k++) {
        console.log(arr[k]);
    }


// The for...in loop is intended for iterating over the enumerable 'keys' of an 'object'.

    Example:

    let obj = {a: 1, b: 2, c: 3};

    for (let v in obj) {
        console.log(v); 
    }

    // Output: 
    // a
    // b
    // c


// The for...in loop should NOT be used to iterate over arrays 
// because, depending on the JavaScript engine, it could iterate in an arbitrary order. 
    
// Also, the iterating variable is a string, not a number, so if you try to do any math with the variable,
// you'll be performing string concatenation instead of addition.

    
// ES6 introduces the new for...of loop, which creates a loop iterating over iterable objects.

    Example:

    let list = ["x", "y", "z"];

    for (let val of list) {
        console.log(val);
    }

    // Output: 
    // x
    // y
    // z

// During each iteration the val variable is assigned the corresponding element in the list.

// The for...of loop works for other iterable objects as well, including strings:

    for (let ch of "Hello") {
        console.log(ch);
    }

    // Output: 
    // H 
    // e 
    // l
    // l 
    // o 
    
    
// The 'for...of' loop also works on the newly introduced collections :

    Map
    Set
    WeakMap
    WeakSet
    
// Note that ES6 code will run only in browsers that support it. 
// Older devices and browsers that do not support ES6 will return a syntax error