/*
---------------------------
    Modules
    ---------------------------
    It is a good practice to divide your related code into modules.

    Before ES6 there were some libraries which made this possible (e.g., RequireJS, CommonJS). 
    
    ES6 is now supporting this feature natively.

    Considerations when using modules:

        (1) The first consideration is maintainability. 
            A module is independent of other modules,
            making improvements and expansion possible without any dependency on code in other modules.

        (2) The second consideration is namespacing. 
            In an earlier lesson, we talked about variables and scope. 
            As you know, vars are globally declared, 
            so it's common to have namespace pollution 
            where unrelated variables are accessible all over our code.
            Modules solve this problem by creating a private space for variables.

        (3) Another important consideration is reusability. 
            When we write code that can be used in other projects, 
            modules make it possible to easily reuse the code 
            without having to rewrite it in a new project.

    Let's see how we should use modules in JS files.

    For Example:

            
            // lib/math.js
            export let sum = (x, y) => { return x + y; }
            export let pi = 3.14;

            // app.js
            import * as math from "lib/math"
            console.log(`2p = + ${math.sum(math.pi, math.pi)}`)


    Here we are exporting the sum function and the pi variable 
    so we can use them in different files.


    ES6 supports modules officially, 
    however, some browsers are not supporting modules natively yet. 
    So, we should use bundlers (builders) such as Webpack or Browserify to run our code.
*/