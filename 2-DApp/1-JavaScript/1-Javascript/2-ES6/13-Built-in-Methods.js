
///////////////////////////////////////////////////////
//  Built-in Methods
///////////////////////////////////////////////////////

// ES6 also introduced new built-in methods to make several tasks easier. 
// Here we will cover the most common ones.


//---------------------
//  Array Element Finding
//---------------------

// The legacy way to find the first element of an array by its value and a rule was the following:
    let result;

    result = [4, 5, 1, 8, 2, 0].filter(function (x) {
        return x > 3;
    })[0];

    console.log(result);   // 4


// The new syntax is cleaner and more robust:

    result = [4, 5, 1, 8, 2, 0].find(x => x > 3);
    console.log(result);   // 4


// You can also get the index of the item above by using the findIndex() method:   

    result = [4, 5, 1, 8, 2, 0].findIndex(x => x > 3);
    console.log(result);   // 0


//---------------------
//  Repeating Strings
//---------------------

// Before ES6 the following syntax was the correct way to repeat a string multiple times:

    console.log(Array(3 + 1).join("foo"));

// With the new syntax, it becomes:

    console.log("foo".repeat(3));

    const arr = ['3', '5', '8'];
    console.log(arr.find(x => x === 8).repeat(2));   // 88



//---------------------
//  Searching Strings
//---------------------

// Before ES6 to find the position of the text in the string we only used the method

    indexOf()  
    
    example:
    console.log("SoloLearn".indexOf("Solo") === 0);                     // true
    console.log("SoloLearn".indexOf("Solo") === (4 - "Solo".length));   // true
    console.log("SoloLearn".indexOf("loLe") !== -1);                    // true
    console.log("SoloLearn".indexOf("olo", 1) !== -1);                  // true
    console.log("SoloLearn".indexOf("olo", 2) !== -1);                  // false

// ES6 has replaced this with a version 

    startsWith() , endsWith() , includes()

// that has cleaner and more simplified syntax:
    
    console.log("SoloLearn".startsWith("Solo", 0));     // true
    console.log("SoloLearn".endsWith("Solo", 4));       // true
    console.log("SoloLearn".includes("loLe"));          // true
    console.log("SoloLearn".includes("olo", 1));        // true
    console.log("SoloLearn".includes("olo", 2));        // false

 // It is always a good practice to refactor your code
 // with the new syntax to learn new things and make your code more understandable.
    