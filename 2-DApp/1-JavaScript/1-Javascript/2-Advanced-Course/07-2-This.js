///////////////////////////////////////////////////////
//                     this Keyword
///////////////////////////////////////////////////////


//-----------------------
// What is this?
//-----------------------
/*

In JavaScript, the this keyword refers to an `object`
Which object depends on how this is being invoked (used or called)


The this keyword refers to different objects depending on how it is used:

    If `this` is used in:                       `this` refers to the
    -----------------------                     ------------------------------------------
    object method                               object
    Alone                                       global object
    function (basic mode)                       global object
    function (strict mode)                      this is undefined
    event                                       element that received the event
    Methods like (call(), apply(), bind() )     can refer to any object
        
        
Note :: this is not a variable. It is a keyword. You cannot change the value of this.

*/


//---------------------
// this in a Method
//---------------------
// When used in an object method, this refers to the object.


// In this case, this refers to the person object.
// Because the fullName method is a method of the person object.
const person = {
    firstName: "John",
    lastName : "Doe",
    id       : 5566,
    fullName : function() {
      return this.firstName + " " + this.lastName;
    }
};



//---------------------
// this Alone
//---------------------
// When used alone, `this` refers to the global object.

// Because `this` is running in the global scope.
// In a browser window the global object is [object Window]

let x = this;   // x: [object Window]


//  In strict mode
// when used alone, this also refers to the global object
"use strict";
let y = this;   // y: [object Window]



//---------------------------------
// this in a Function (Default)
//---------------------------------
// In a function, the `global object` is the default binding for `this`
// In a browser window the `global object` is [object Window]

function myFunction() {
    return this;    // [object Window]
}



//---------------------------------
// this in a Function (Strict)
//---------------------------------
// JavaScript strict mode does not allow default binding.

// So, when used in a function, in strict mode, `this` is `undefined`

"use strict";
function myFunction() {
  return this;              // undefined
}


//---------------------------------
// this in a Event Handlers
//---------------------------------
// In HTML event handlers, `this` refers to the `HTML element` that received the event:

/*

<button onclick="this.style.display='none'">
  Click to Remove Me!
</button>

*/


//---------------------------------
// Object Method Binding
//---------------------------------

// In these examples, `this` is the person1 object:
const person1 = {
    firstName  : "John",
    lastName   : "Doe",
    id         : 5566,
    myFunction : function() {
      return this;
    }
};

// this.firstName is the firstName property of this (the person2 object)
const person2 = {
    firstName: "John",
    lastName : "Doe",
    id       : 5566,
    fullName : function() {
      return this.firstName + " " + this.lastName;
    }
  };




//---------------------------------
// Explicit Function Binding
//---------------------------------

// The call() and apply() methods are predefined JavaScript methods.
// They can both be used to call an object method with another object as argument.


// The example below calls person3.fullName with person4 as an argument, 
// `this` refers to person4, even if fullName is a method of person3:

const person3 = {
    fullName: function() {
      return this.firstName + " " + this.lastName;
    }
  }
  
  const person4 = {
    firstName:"John",
    lastName: "Doe",
  }
  
  // Return "John Doe":
  person3.fullName.call(person4);



//---------------------------------
// Function Borrowing
//---------------------------------
// With the bind() method, an object can borrow a method from another object.


// This example creates 2 objects (person and member).
// The member object borrows the fullname method from the object personObj:

const personObj = {
    firstName:"John",
    lastName: "Doe",
    fullName: function () {
      return this.firstName + " " + this.lastName;
    }
}
  
const member = {
    firstName:"Hege",
    lastName: "Nilsen",
}
  
let fullName = personObj.fullName.bind(member);




//---------------------------------
// This Precedence
//---------------------------------
/*

which object this refers to?

use the following precedence to determine which object `this` refers to

Precedence	    Object
----------      --------------------
1	            bind()
2	            apply() , call()
3	            Object method
4	            Global scope


1- Check to if `this` is in a function being called using bind() ?

2- Check to if `this` is in a function being called using apply() ?

3- Check to if `this` is in a function being called using call() ?

4- Check to if `this` is in an object function (method) ?

5- Check to if `this` is in a function in the global scope ?

*/