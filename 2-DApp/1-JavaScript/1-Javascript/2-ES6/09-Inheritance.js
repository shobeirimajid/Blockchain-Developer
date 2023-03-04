/*
///////////////////////////////////////////////////////
//  Inheritance in ES6
///////////////////////////////////////////////////////

The 'extends' keyword is used in class declarations or class expressions 
to create a child of a class. 
The child inherits the properties and methods of the parent.

For example:




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
            console.log(this.name + ' barks.');
        }
    }

    let dog = new Dog('Rex');
    dog.speak();                // Rex barks.


In the code above, 
the Dog class is a child of the Animal class, 
inheriting its properties and methods.


If there is a constructor present in the subclass, 
it needs to first call super() before using this. 
Also, the super keyword is used to call parent's methods.


For example, we can modify the program above to the following:



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
            super.speak();      // Super
            console.log(this.name + ' barks.');
        }
    }

    let dog = new Dog('Rex');
    dog.speak();

        // Rex makes a noise.
        // Rex barks.


    
In the code above, 
the parent's speak() method is called using the super keyword.


            
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

*/