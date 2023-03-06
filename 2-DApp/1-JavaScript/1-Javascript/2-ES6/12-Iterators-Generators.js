
///////////////////////////////////////////////////////
//  Iterators & Generators
///////////////////////////////////////////////////////

// Symbol.iterator is the default iterator for an object. 
    
// The for...of loops are based on this type of iterator.

// In the example below, we will see how we should implement it and how `generator functions` are used.

    Example:

    let myIterableObj = { 
        [Symbol.iterator] : function* () {
            yield 1; 
            yield 2; 
            yield 3;
        }
    };

    console.log([...myIterableObj]);    // [ 1, 2, 3 ]

// First, we create an object, and use the Symbol.iterator 
// and `generator function` to fill it with some values.

// In the second line of the code, we use a * with the function keyword.          
// It's called a `generator function` (or `gen` function).


// For example, here is a simple case of how gen functions can be useful:

    function* idMaker() {
        let index = 0;
        while (index < 5)
            yield index++;
    }
    var gen = idMaker();

    console.log(gen.next().value);  // 0
    console.log(gen.next().value);  // 1
    console.log(gen.next().value);  // 2
    console.log(gen.next().value);  // 3
    console.log(gen.next().value);  // 4


    // We can exit and re-enter generator functions later. 

    // Their variable bindings (context) will be saved across re-entrances. 
    
    // They are a very powerful tool for asynchronous programming, 
    // especially when combined with Promises. 
    
    // They can also be useful for creating loops with special requirements.

    // We can nest generator functions inside each other 
    //  to create more complex structures 
    //  and pass them arguments while we are calling them.

    // The example below will show a useful case of 
    // how we can use generator functions and Symbol.iterators together.


    Example:

    const arr = ['0', '1', '4', 'a', '9', 'c', '16'];

    // create an object of 7 elements by using `Symbol.iterator` and `generator functions` 
    const my_obj = {
        [Symbol.iterator]: function*() {
            for(let index of arr) {
                yield `${index}`;
            }
        }
    };

    // assign our object to a constant `all` 

    const all = [...my_obj]             // Here you can replace the '[...my_obj]' with 'arr'. 
        .map(i => parseInt(i, 10))
        .map(Math.sqrt)
        .filter((i) => i < 5)           // try changing the value of 5 to 4 see what happens.
        .reduce((i, d) => i + d);       // comment this line while you are changing the value of the line above

    // print `all` value.
    console.log(all);                   // 10