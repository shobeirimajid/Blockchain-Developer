/*
///////////////////////////////////////////////////////
//  ES6 Objects
///////////////////////////////////////////////////////

    JavaScript variables can be Object data types 
    that contain many values called properties.

    An object can also have properties that are 
    function definitions called methods for performing actions on the object.

    ES6 introduces shorthand notations and computed property names 
    that make declaring and using objects easier to understand.

    The new method definition shorthand 
    does not require the colon (:) or function keyword, 
    as in the grow function of the tree object declaration:
*/

        let tree = {
            height: 10,
            color: 'green',
            grow() { 
                this.height += 2;
            }
        };

        tree.grow();
        console.log(tree.height); // 12

/*  
    You can also use a property value shorthand 
    when initializing properties with a variable by the same name.

    For example, properties height and health 
    are being initialized with variables named height and health
*/

        let height = 5;
        let health = 100;

        let athlete = {
            height,     // height: height,
            health      // health: health
        };

        console.log(athlete.height); // 5

/*    
    When creating an object by using duplicate property names, 
    the last property will overwrite the prior ones of the same name.

    For Example:
*/

        var a = {x: 1, x: 2, x: 3, x: 4};
        console.log(a.x);   // 4 

/*
    Duplicate property names generated a SyntaxError in ES5 when using strict mode. 
    However, ES6 removed this limitation.
*/


/*
    You can change the properties of a constant object:
*/
    Example
    // You can create a const object:
    const car = {type:"Fiat", model:"500", color:"white"};

    // You can change a property:
    car.color = "red";

    // You can add a property:
    car.owner = "Johnson";

    // But you can NOT reassign the object:
    car = {type:"Volvo", model:"EX60", color:"red"};    // ERROR



/*
---------------------------
Computed Property Names
---------------------------
With ES6, you can now use computed property names. 
Using the square bracket notation [], 
we can use an expression for a property name, 
including concatenating strings. 
    
This can be useful in cases where we want to 
create certain objects based on user data (e.g. id, email, and so on).

Here are three examples:
*/

        let prop = 'name';
        let id = '1234';
        let mobile = '08923';

        let user = {
            [prop]: 'Jack',
            [`user_${id}`]: `${mobile}`
        };

        console.log(user.name);         // Jack
        console.log(user.user_1234);    // 08923

    
    

        var i = 0;
        var a = {
            ['foo' + ++i]: i,
            ['foo' + ++i]: i,
            ['foo' + ++i]: i
        };

        console.log(a.foo1); // 1
        console.log(a.foo2); // 2
        console.log(a.foo3); // 3



        var param = 'size';
        var config = {
            [param]: 12,
            ['mobile' + param.charAt(0).toUpperCase() + param.slice(1)]: 4
        };

        console.log(config.mobileSize); // 4


    // It is very useful when you need to create custom objects based on some variables.



/*
    ---------------------------
    Object.assign() in ES6
    ---------------------------
    ES6 adds a new Object method assign() that 
    allows us to combine multiple sources into one target to create a single new object.
*/

        Object.assign() 
  
/*
    is also useful for creating a duplicate of an existing object.

    Let's look at the following example to see how to combine objects:
*/

        let person = {
            name: 'Jack',
            age: 18,
            sex: 'male'
        };

        let student = {
            name: 'Bob',
            age: 20,
            xp: '2'
        };

        let newStudent = Object.assign({}, person, student);

        console.log(newStudent.name); // Bob
        console.log(newStudent.age); // 20
        console.log(newStudent.sex); // male
        console.log(newStudent.xp); // 2


/*
    Here we used Object.assign() 
    where the first parameter is the target object you want to apply new properties to.

    Every parameter after the first will be used as sources for the target. 
    There are no limitations on the number of source parameters. 
    However, order is important because 
    properties in the second parameter 
    will be overridden by properties of the same name in third parameter, 
    and so on.

    In the example above, 
    we used a new object {} as the target and used two objects as sources.


    Try changing the order of second and third parameters to see what happens to the result.


    Now, let's see how we can use assign() 
    to create a duplicate object without creating a reference (mutating) to the base object.

    In the following example, 
    assignment was used to try to generate a new object. 
    However, using = creates a reference to the base object. 
    Because of this reference, 
    changes intended for a new object mutate the original object:
*/

        
        let person = {
            name: 'Jack',
            age: 18
        };

        let newPerson = person;
        newPerson.name = 'Bob';

        console.log(person.name);       // Bob
        console.log(newPerson.name);    // Bob

 
/*
    To avoid this (mutations), 
    use Object.assign() to create a new object.

    For example:
*/

        let person = {
            name: 'Jack',
            age: 18
        };

        let newPerson = Object.assign({}, person);
        newPerson.name = 'Bob';

        console.log(person.name);       // Jack
        console.log(newPerson.name);    // Bob


/*
    Finally, you can assign a value to an object property in the Object.assign() statement.
    For example:
*/


        let person = {
            name: 'Jack',
            age: 18
        };

        let newPerson = Object.assign({}, person, {name: 'Bob'});

        console.log(newPerson.name);    // Bob



        const obj1 = {
            a: 0,
            b: 2,
            c: 4
        };
        const obj2 = Object.assign({c: 5, d: 6}, obj1);
        console.log(obj2.c, obj2.d);

        // output
            46


/*
    ---------------------------
    Array Destructuring in ES6
    ---------------------------
    The destructuring assignment syntax is a JavaScript expression 
    that makes it possible to unpack values from arrays, 
    or properties from objects, 
    into distinct variables.

    ES6 has added a shorthand syntax for destructuring an array.

    The following example demonstrates how to 
    
        unpack the elements of an array into distinct variables:
*/

        let arr = ['1', '2', '3'];

        let [one, two, three] = arr;

        console.log(one);       // 1
        console.log(two);       // 2
        console.log(three);     // 3    

/*
    We can use also destructure an array returned by a function.

    For example:
*/


        let a = () => {
            return [1, 3, 2];
        };

        let [one, , two] = a();

        console.log(one); // 1
        console.log(two); // 2

/*
    Notice that we left the second argument's place empty.



    The destructuring syntax also simplifies assignment and swapping values:
*/


        let a, b, c = 4, d = 8;

        [a, b = 6] = [2];

        console.log(a);     // 2
        console.log(b);     // 6

        [c, d] = [d, c];

        console.log(c);     // 8
        console.log(d);     // 4


    
/*
    ---------------------------   
    Object Destructuring in ES6
    ---------------------------
    Similar to Array destructuring, 
    Object destructuring unpacks properties into distinct variables.

    For example:
*/

        let obj = {h:100, s: true};
        let {h, s} = obj;

        console.log(h); // 100
        console.log(s); // true

/*   
    We can assign without declaration, 
    but there are some syntax requirements for that:
*/

        let a, b;
        ( {a, b} = {a: 'Hello ', b: 'Jack'} );

        console.log(a + b);     // Hello Jack 


/*
    The () with a semicolon (;) 
    at the end are mandatory when destructuring without a declaration. 
    However, you can also do it as follows where the () are not required:
*/

        let {a, b} = {a: 'Hello ', b: 'Jack'};

        console.log(a + b);     // Hello Jack 


/*
    You can also assign the object to new variable names.
    For example:
*/
        
        var o = {h: 42, s: true};
        var {h: foo, s: bar} = o;

        //console.log(h);   // Error
        console.log(foo);   // 42

/*
    Finally you can assign default values to variables, 
    in case the value unpacked from the object is undefined.
    For example:
*/
        
        var obj = {id: 42, name: "Jack"};
        let {id = 10, age = 20} = obj;

        console.log(id);    // 42
        console.log(age);   // 20

    
/*
    ---------------------------
    ES6 Rest Parameters
    ---------------------------
    Prior to ES6, 
    if we wanted to pass a variable number of arguments to a function,
     we could use the 'arguments' object, 
     an array-like object, to access the parameters passed to the function.

    For example, let's write a function that checks 
    if an array contains all the arguments passed:
*/

        function containsAll(arr) {
            for (let k = 1; k < arguments.length; k++) {
                let num = arguments[k];
                if (arr.indexOf(num) === -1) {
                    return false;
                }
            }
            return true;
        }

        let x = [2, 4, 6, 7];
        console.log(containsAll(x, 2, 4, 7));   // true
        console.log(containsAll(x, 6, 4, 9));   // false


/*
    We can pass any number of arguments to the function 
    and access it using the 'arguments' object.


    While this does the job, 
    ES6 provides a more readable syntax to achieve variable number of parameters 
    by using a rest parameter
*/

        function containsAll(arr, ...nums) {
            for (let num of nums) {
                if (arr.indexOf(num) === -1) {
                    return false;
                }
            }
            return true;
        }

        let x = [2, 4, 6, 7];
        console.log(containsAll(x, 2, 4, 7));   // true
        console.log(containsAll(x, 6, 4, 9));   // false


/*
    The '...nums' parameter is called a 'rest' parameter
        It takes all the "extra" arguments passed to the function
    
    The three dots (...) are called the 'Spread' operator

    Only the last parameter of a function may be marked as a rest parameter.

    If there are no extra arguments, 
    the rest parameter will simply be an empty array; 
    
    the rest parameter will never be undefined.
*/



    // Example:  calculate the sum of any number of values

        //complete the function
        function Add(...nums){
            var sum = 0;
            for (let num of nums) {
                sum += num;
            }
            return sum;
        }

        console.log(Add(1,2,3));
        console.log(Add(4,14,5,9,14));
        console.log(Add(2,36));




    // Example:  calculate the sum of even number of input values

        function magic(...nums) {
            let sum = 0;
            nums.filter(n => n % 2 == 0).map(el => sum+= el);
            return sum;
        }
        console.log(magic(1, 2, 3, 4, 5, 6));


/*
    ---------------------------
    The Spread Operator
    ---------------------------
    This operator is similar to the Rest Parameter, 
    but it has another purpose when used in objects or arrays or function calls (arguments).


    Spread in function calls

    It is common to pass the elements of an array as arguments to a function. 


    Before ES6, we used the following method:
*/

        function myFunction(w, x, y, z) {
            console.log(w + x + y + z);
        }
        var args = [1, 2, 3];
        myFunction.apply(null, args.concat(4)); 

    
    // ES6 provides an easy way to do the example above with spread operators


        const myFunction = (w, x, y, z) => {
            console.log(w + x + y + z);         // 10
        };
        let args = [1, 2, 3];
        myFunction(...args, 4);

        
    Example:


        var dateFields = [1970, 0, 1];          // 1 Jan 1970
        var date = new Date(...dateFields);
        console.log(date);                      // 1969-12-31T20:30:00.000Z 

/*
    ---------------------------
    Spread in array literals
    ---------------------------
    Before ES6, we used the following syntax to add an item at middle of an array:
*/

        var arr = ["One", "Two", "Five"];

        arr.splice(2, 0, "Three");
        arr.splice(3, 0, "Four");
        console.log(arr);           // ["One", "Two", "Three", "Four", "Five"]


/*
    You can use methods such as :
        push
        splice 
        concat

    for example, to achieve this in different positions of the array. 
    However, in ES6 the spread operator lets us do this more easily:
*/

        let newArr = ['Three', 'Four']; 
        let arr = ['One', 'Two', ...newArr, 'Five'];
        console.log(arr);           
        
/*  
    ---------------------------
    Spread in object literals
    ---------------------------
    In objects it copies the own enumerable properties 
    from the provided object onto a new object.
*/

        const obj1 = { foo: 'bar', x: 42 };
        const obj2 = { foo: 'baz', y: 5 };

        const clonedObj = { ...obj1 };              // { foo: "bar", x: 42 }
        const mergedObj = { ...obj1, ...obj2 };     // { foo: "baz", x: 42, y: 5 }


    // However, if you try to merge them you will not get the result you expected:

            
        const obj1 = { foo: 'bar', x: 42 };
        const obj2 = { foo: 'baz', y: 5 };

        const merge = (...objects) => ({ ...objects });     //  merge is null

        let mergedObj = merge (obj1, obj2);

            // { 0: { foo: 'bar', x: 42 }, 1: { foo: 'baz', y: 5 } }

        let mergedObj2 = merge ({}, obj1, obj2);

            // { 0: {}, 1: { foo: 'bar', x: 42 }, 2: { foo: 'baz', y: 5 } }

    
/*
    Shallow cloning or merging objects is possible with 
    another operator called Object.assign().      
*/