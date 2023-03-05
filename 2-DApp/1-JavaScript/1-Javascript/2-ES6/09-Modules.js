///////////////////////////////////////////////////////
//                      Modules
///////////////////////////////////////////////////////
/*
    Modules is a good practice to break up your code into separate files (modules).
    This makes it easier to maintain a code-base.

    Before ES6 there were some libraries which made this possible (e.g., RequireJS, CommonJS). 
    ES6 is now supporting this feature natively.

    ES6 supports modules officially, 
    however, some browsers are not supporting modules natively yet. 
    So, we should use bundlers (builders) such as `Webpack` or `Browserify` to run our code.


    When using modules:

        (1) Maintainability
            A module is independent of other modules,
            making improvements and expansion possible without any dependency on code in other modules.

        (2) Namespacing
            As you know, vars are globally declared, 
            so it's common to have namespace pollution 
            where unrelated variables are accessible all over our code.
            Modules solve this problem by creating a private space for variables.

        (3) Reusability
            When we write code that can be used in other projects, 
            modules make it possible to easily reuse the code 
            without having to rewrite it in a new project.


    Note:

    Modules only work with the HTTP(s) protocol.
    A web-page opened via the file:// protocol cannot use "import / export"

*/



//----------------------------------
// Export
//----------------------------------

// Modules with `functions` or `variable`s can be stored in any external file.

// There are two types of exports: 

//    (1) Named Exports 
//    (2) Default Exports


//-------------------
// Named Exports
//-------------------

// Let us create a file named person.js 
// and fill it with the things we want to export.


// You can create named exports two ways:

//    (1) In-line individually
//    (2) all at once at the bottom



// In-line individually export

//person.js
export const name = "Jesse";
export const age = 40;



// All at once at the bottom

//person.js
const name = "Jesse";
const age = 40;
export {name, age};


//-------------------
// Default Exports
//-------------------
// Let us create another file, named message.js
// and use it for demonstrating default export

// You can only have one default export in a file

message.js

const message = () => {
    const name = "Jesse";
    const age = 40;
    return name + ' is ' + age + 'years old.';
};

export default message;




//----------------------------------
// Import
//----------------------------------

// Modules rely on type="module" in the <script> tag

<script type="module">
import message from "./message.js";
</script>


// Modules are imported from external files with the `import` statement.


// You can import modules into a file in two ways, 
//   based on if they are `named exports` or `default exports`

// Named exports are constructed using curly braces. 
// Default exports are not.


// Import named exports from the file person.js:

import { name, age } from "./person.js";
// or
import * as person from "./person.js"

console.log(`This Person is ${person.name}, he/she is ${person.age} old.`);


// Import a default export from the file message.js:

import message from "./message.js";