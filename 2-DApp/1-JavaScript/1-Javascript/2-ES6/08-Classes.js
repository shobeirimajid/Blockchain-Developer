/*
///////////////////////////////////////////////////////
//                      Classes
///////////////////////////////////////////////////////

ECMAScript 2015, also known as ES6, introduced JavaScript Classes.

A JavaScript class is not an object.
It is a template for JavaScript objects.
Class can be used to create multiple objects of the same structure

    keyword `class` :    create a class
    constructor()   :    initializing
    keyword `new`   :    create object of the class

The syntax in classes must be written in "strict mode".
You will get an error if you do not follow the "strict mode" rules.
Fore example, In "strict mode" you will get an error if you use a variable without declaring it:

*/



//----------------------------
// Class Declarations
//----------------------------

// You can define a class with a class expression


class ClassName {
    constructor() { }
}


// the class can be `named` or `unnamed`


// --- named class ---

class Rectangle {
    constructor(height, width) {
        this.height = height;   // class Rectangle has two initial properties: "height" and "width".
        this.width = width;
    }
};


// --- unnamed class ---

// In the unnamed class expression, a variable is simply assigned the class definition

var Rectangle = class {
    constructor(height, width) {
        this.height = height;
        this.width = width;
    }
};


//----------------------------
// Create Objects
//----------------------------

// you can use the declared class to create different objects
// The constructor method is called automatically when a new object is created.

const square = new Rectangle(5, 5);
const poster = new Rectangle(2, 3); 

console.log(square.height);




//------------------------
// constructor()
//------------------------ 

// The constructor is a special method :
//    - It has to have the exact name "constructor"
//    - It is executed automatically when a new object is created with a class.
//    - It is used to initialize object properties

// There can be only one constructor in each class.

// Always add a constructor() method
//  If you do not define a constructor method, JavaScript will add an empty constructor method.




//---------------------------
//    Class Methods in ES6
// ---------------------------
// Class methods are created with the same syntax as object methods.
// ES6 introduced a shorthand that 
// does not require the keyword function for a function assigned to a method's name. 


class ClassName {
    constructor() {  }
    method_1() {  }
    method_2() {  }
    method_3() {  }
}


// Example : Create a Class method named "age", that returns the Car age:

class Car {
    constructor(name, year) {
      this.name = name;
      this.year = year;
    }

    age() {
      let date = new Date();
      return date.getFullYear() - this.year;
    }
}
  
let FordCar = new Car("Ford", 2014);

document.getElementById("demo").innerHTML = "My car is " + myCar.age() + " years old.";
    


  // You can send parameters to Class methods:

class Car {

    constructor(name, year) {
      this.name = name;
      this.year = year;
    }

    age(x) {
      return x - this.year;
    }
}
  
let date = new Date();
let year = date.getFullYear();
  
let myCar = new Car("Ford", 2014);

document.getElementById("demo").innerHTML= "My car is " + myCar.age(year) + " years old.";



//------------------------
// Static methods
//------------------------
// Another type of method is the "static method"
// Static class methods are defined on the class itself.
// which cannot be called through a class instance. 
// Static methods are often used to create utility functions for an application.


// Example : distance between two points

class Point {

    constructor(x, y) {
        this.x = x;
        this.y = y;
    }

    static distance(a, b) {
        const dx = a.x - b.x;
        const dy = a.y - b.y;

        return Math.hypot(dx, dy);
    }
}

const p1 = new Point(7, 2);
const p2 = new Point(3, 8);

// `distance()` is called directly using the class name, without an object
console.log(Point.distance(p1, p2));    // 7.211102550927979



// Example : Exam Scores Average

class Exams{
    static average(e1, e2, e3) {
        return Math.round((e1 + e2 + e3) / 3);
    }
}

var exam1 = 80;
var exam2 = 90;
var exam3 = 100;

// `average()` is called directly using the class name, without an object.
console.log(Exams.average(exam1, exam2, exam3));    // 90



// Example

class Add {
    
    constructor(...words) {
        this.words = words;
    }

    print() {
        var msg='$';
        for (var word of this.words) {
            msg += word +'$';
        }
        console.log(msg);
    }
}

var x = new Add("this", "is", "awesome");
var y = new Add("lorem", "ipsum", "dolor", "sit", "amet", "consectetur", "adipiscing", "elit");

x.print();
y.print();

// Output:
$hehe$hoho$haha$hihi$huhu$
$this$is$awesome$
$lorem$ipsum$dolor$sit$amet$consectetur$adipiscing$elit$




//------------------------
// Getters and Setters
//------------------------  
// One type of class method is the Getters and Setters which is available to objects of the class. 
// It can be smart to use getters and setters for your properties,
//  especially if you want to do something special with the value  
//  before returning them, or before you set them.

// To add getters and setters in the class, use the `get` and `set` keywords.

// Note: even if the getter is a method, you do not use parentheses when you want to get the property value.

// The name of the getter/setter method cannot be the same as the name of the property

// Many programmers use an character underscore `_` before the property name 
//   to separate the getter/setter from the actual property


class Rectangle {

    constructor(height, width) {
        this._height = height;
        this._width = width;
    }

    // getters
    get height() { return this._height; }
    get width() { return this._width; }
    get area() { return this.calcArea(); }

    // setters
    set height(h) { this._height = h; }
    set width(w) { this._width = w; }

    // calcArea() is a method.
    calcArea() { return this._height * this._width; }
}

const sqr = new Rectangle(5, 5);
console.log(sqr.area);  // 25

// To use a setter, use the same syntax as when you set a property value, without parentheses:
sqr.height = "10";
sqr.width = "20";
console.log(sqr.area);  // 200




//------------------------
// Hoisting 
//------------------------  

// Class Declarations are not hoisted 
// If you try to access your class before declaring it, ReferenceError will be returned.
// That means that you must declare a class before you can use it


// Function Declarations and other JavaScript declarations are hoisted.
// Note: For other declarations, like functions, 
// you will NOT get an error when you try to use it before it is declared, 
// because the default behavior of JavaScript declarations are hoisting (moving the declaration to the top).




///////////////////////////////////////////////////////
//  Inheritance
///////////////////////////////////////////////////////

// Inheritance is useful for code reusability: 
//  reuse properties and methods of an existing class when you create a new class.

// To create a class inheritance, use the extends keyword.
// The 'extends' keyword is used in class declarations or class expressions to create a child of a class. 
// The child inherits the properties and methods of the parent.

class Animal {
    constructor(name) {
        this.name = name;
    }
    speak() {
        console.log(this.name + ' makes a noise.');
    }
}


// the Dog class is a child of the Animal class, 
// inheriting its properties and methods.

class Dog extends Animal {
    speak() {
        console.log(this.name + ' barks.');
    }
}

let Rex = new Dog('Rex');
Rex.speak();   // Rex barks.



//-------------------------
//  super
//-------------------------
// The super() method refers to the parent class.
// By calling the super() method in the constructor method, 
//  we call the parent's constructor method and gets access to the parent's properties and methods.
// If there is a constructor present in the subclass, it needs to first call super() before using this. 
// Also, the super keyword is used to call parent's methods.


// For example

class Animal {
    constructor(name) {
        this.name = name;
    }
    speak() {
        console.log(this.name + ' makes a noise.');
    }
}


class Dog extends Animal {
    speak() {
        // the parent's speak() method is called using the `super` keyword.
        super.speak(); 
        console.log(this.name + ' barks.');
    }
}

let dog = new Dog('Rex');

dog.speak();        // Rex makes a noise.
                    // Rex barks.
    
 
// Example

class Human {
    constructor(name) {
        this.name = name;
    }
}

class Student extends Human {
    constructor(name, age) {
        super(name);
        this.age = age;
    }
}