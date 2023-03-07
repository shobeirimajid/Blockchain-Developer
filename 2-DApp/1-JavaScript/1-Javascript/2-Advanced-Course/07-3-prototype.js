///////////////////////////////////////////////////////
//                      prototype
///////////////////////////////////////////////////////

// Unlike most other popular object-oriented languages, 
// JavaScript has no concept of 'instances' created from 'class' blueprints 
// instead, JavaScript combines instantiation and inheritance into a single concept: 'prototype'

// Every JavaScript object has a 'prototype'. 
// When you go to access a property on an object that doesn't exist on the actual object, 
// the interpreter will look at its prototype.

// Some JS implementations let you access an object's prototype on the magic property `__proto__`
// As a fact of matter, prototype doesn't part of the standard
// we'll get to standard ways of using prototypes later.

    var myObj = {
        myString: "Hello world!"
    };

    var myPrototype = {
        meaningOfLife: 42,
        myFunc: function(){
            return this.myString.toLowerCase();
        }
    };

    myObj.__proto__ = myPrototype;
    myObj.meaningOfLife; // = 42

    // This works for functions, too.
    myObj.myFunc(); // = "hello world!"



// Of course, if your property isn't on your prototype, the prototype's
// prototype is searched, and so on.

    myPrototype.__proto__ = {
        myBoolean: true
    };

    myObj.myBoolean; // = true

// There's no copying involved here; each object stores a reference to its
// prototype. This means we can alter the prototype and our changes will be
// reflected everywhere.

    myPrototype.meaningOfLife = 43;
    myObj.meaningOfLife;                // = 43



// The for/in statement allows iteration over properties of an object,
// walking up the prototype chain until it sees a null prototype.

    for (var x in myObj){
        console.log(myObj[x]);
    }

///prints:
// Hello world!
// 43
// [Function: myFunc]
// true



// To only consider properties attached to the object itself
// and not its prototypes, use the `hasOwnProperty()` check.

    for (var x in myObj){
        if (myObj.hasOwnProperty(x)){
            console.log(myObj[x]);
        }
    }

///prints:
// Hello world!

// We mentioned that `__proto__` was non-standard, and there's no standard way to
// change the prototype of an existing object. However, there are two ways to
// create a new object with a given prototype.

// The first is Object.create, which is a recent addition to JS, and therefore
// not available in all implementations yet.

    var myObj = Object.create(myPrototype);
    myObj.meaningOfLife;                    // = 43



// The second way, which works anywhere, has to do with constructors.
// Constructors have a property called prototype. This is *not* the prototype of
// the constructor function itself; instead, it's the prototype that new objects
// are given when they're created with that constructor and the new keyword.

    MyConstructor.prototype = {
        myNumber: 5,
        getMyNumber: function(){
            return this.myNumber;
        }
    };

    var myNewObj2 = new MyConstructor();
    myNewObj2.getMyNumber();    // = 5
    myNewObj2.myNumber = 6;
    myNewObj2.getMyNumber();    // = 6



// Built-in types like strings and numbers also have constructors that create
// equivalent wrapper objects.

    var myNumber = 12;
    var myNumberObj = new Number(12);
    myNumber == myNumberObj;                // = true

    // Except, they aren't exactly equivalent.  

    typeof myNumber; // = 'number'
    typeof myNumberObj; // = 'object'
    myNumber === myNumberObj; // = false

    if (0){
        // This code won't execute, because 0 is falsy.
    }

    if (new Number(0)){
    // This code will execute, because wrapped numbers are objects, and objects
    // are always truthy.
    }



// However, the wrapper objects and the regular builtins share a prototype, so
// you can actually add functionality to a string, for instance.

    String.prototype.firstCharacter = function(){
        return this.charAt(0);
    };

    "abc".firstCharacter(); // = "a"



// This fact is often used in "polyfilling", which is implementing newer
// features of JavaScript in an older subset of JavaScript, so that they can be
// used in older environments such as outdated browsers.

// For instance, we mentioned that Object.create isn't yet available in all
// implementations, but we can still use it with this polyfill:

    if (Object.create === undefined){ // don't overwrite it if it exists    

        Object.create = function(proto){
            // make a temporary constructor with the right prototype
            var Constructor = function(){};
            Constructor.prototype = proto;
            // then use it to create a new, appropriately-prototyped object
            return new Constructor();
        };
        
    }