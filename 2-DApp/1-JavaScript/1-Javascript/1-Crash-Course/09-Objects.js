///////////////////////////////////////////////////////
//                      Objects
///////////////////////////////////////////////////////

/*
-------------------
Real Life Objects
-------------------
In real life, a car is an object.
A car has properties like weight and color
A car has methods like start and stop

All cars have the same properties, but the property values differ from car to car.
All cars have the same methods, but the methods are performed at different times.


Object	            Properties	                Methods
------              -----------------           --------------
	
car                 car.name = Fiat             car.start()

                    car.model = 500             car.drive()

                    car.weight = 850kg          car.brake()

                    car.color = white	        car.stop()
*/




/*
----------------------
JavaScript's objects
----------------------
You have already learned that JavaScript variables are containers for data values.
Objects are variables too. 
But objects can contain many values.

 JavaScript's objects are equivalent to "dictionaries" or "maps" in other languages.
    maps: an unordered collection of key-value pairs.

JavaScript objects are written with curly braces {}.
`Object properties` are written as name:value pairs, separated by commas.
*/

    var myObj = {key1: "Hello", key2: "World"};



// Keys are strings, but quotes aren't required if they're a valid JavaScript identifier.
// Values can be any type.

    var myObj = {
        myKey: "myValue", 
        "my other key": 4
    };



// Object attributes can also be accessed using the subscript syntax

    myObj["my other key"]; // = 4



// ... or using the dot syntax, provided the key is a valid identifier.

    myObj.myKey; // = "myValue"



// Objects are mutable; values can be changed and new keys added.

    myObj.myThirdKey = true;



// If you try to access a value that's not yet set, you'll get undefined.

    myObj.myFourthKey; // = undefined

    Example:

    var cuboid = {
        length: 25,
        width: 50,
        height: 200
    };

    let volume = cuboid.length * cuboid.width * cuboid.height;
    console.log(volume);



    // Example:

    const person = {
        firstName: "John",
        lastName : "Doe",
        id       : 5566,
        fullName : function() {
          return this.firstName + " " + this.lastName;
        }
    };

/*

In the example above, `this` keyword refers to the `person` object.

    this.firstName : the firstName property of this.
    this.firstName : the firstName property of person.
*/




/*
--------------
this keyword
--------------
In JavaScript, the `this` keyword refers to an object.
`Which object` depends on how this is being invoked (used or called).

this is not a variable. 
It is a keyword. 
You cannot change the value of this.

The this keyword refers to different objects depending on how it is used:

    - In an object method            this refers to the object.
    - Alone                          this refers to the global object.
    - In a function                  this refers to the global object.
    - In a function, in strict mode  this is undefined.
    - In an event                    this refers to the element that received the event.

Methods like call(), apply(), and bind() can refer this to any object.
*/



/*
---------------------
Object Constructor
--------------------
Sometimes, we need to set an "object type" that can be used to 
create a number of objects of a single type.

The standard way to create an "object type" is to use an object constructor function.
*/

    // function (person) is an object constructor
    // which takes parameters and assigns them to the object properties

    function person(name, age, color) {
        this.name = name;
        this.age = age;
        this.favColor = color;
    }

    //                   name,  age, color
    var p1 = new person("John", 42, "green");
    var p2 = new person("Amy", 21, "red");

    console.log("p1.age", p1.age); 
    console.log("p2.name", p2.name);



    Example1:
    // person is an object constructor
    // which takes parameters and assigns them to the object properties.

    function person(name, age, color) {
        this.name = name;
        this.age = age;
        this.favColor = color;
    }

    //                   name,  age, color
    var p1 = new person("John", 42, "green");
    var p2 = new person("Amy", 21, "red");

    console.log("p1.age: ", p1.age); 
    console.log("p2.name: ", p2.name);



    Example2:
    function main() {
        //take flight number and its status
        var flightNumber = prompt("Please enter flightNumber", "1000");
        var flightStatus = prompt("Please enter flightStatus", "Landed");
        
        var flight1 = new Flight(flightNumber, flightStatus);
        //assign a flight object to flight1 variable
        
        //output
        console.log('The flight ' + flight1.number + ' is ' + flight1.status)
        
    }

    function Flight(flightNumber, status) {
        //fix the constructor
        this.number = flightNumber;
        this.status = status;
    };

    main();



    Example3:
    function main2() {
        var prodID = prompt("Please enter prodID");
        var price = prompt("Please enter price");
        var discount = prompt("Please enter discount");
        
        var prod1= new Product(prodID, price);
        console.log(prod1.prodID + " price: " + prod1.price);
        
        prod1.changePrice(discount);
        console.log(prod1.prodID + " new price: " + prod1.price);
    }

    function Product(prodID, price) {
        this.prodID = prodID;
        this.price = price;

        this.changePrice = function(discount) {
            //your code goes here
            this.price = price - ((discount/100) * price);
        }
    }



/*
-------------------
Methods
-------------------
Methods are functions that are stored as object properties.

Use the following syntax to create an object method:

    methodName = function() { code lines }
    
Access an object method using the following syntax:

    objectName.methodName()

A method is a function, belonging to an object. 
It can be referenced using the this keyword.
The this keyword is used as a reference to the current object, 
    meaning that you can access the objects properties and methods using it.

If you access a method without the () parentheses, it will return the function definition:

Defining methods is done inside the constructor function.
*/

    Example:
    function person(name, age) {
        this.name = name;  
        this.age = age;
        this.changeName = function (name) {
            this.name = name;
        }
    }

    var p = new person("David", 21);

    p.changeName("John");
    document.write(p.name);

/*
In the example above, we have defined a method named changeName for our person, 
which is a function, that takes a parameter name and assigns it to the name property of the object.
this.name refers to the name property of the object.
The changeName method changes the object's name property to its argument.



You can also define the function outside of the constructor function 
and associate it with the object.
*/

    function person2(name, age) {
        this.name= name;  
        this.age = age;
        this.yearOfBirth = bornYear;
    }
    function bornYear() {
        return 2023 - this.age;
    }
 


/*
As you can see, we have assigned the object's yearOfBirth property to the bornYear function.
`this` keyword refers to the person object. This keyword is used to 
    access the properties of the object, which is going to call the method.

Note that it's not necessary to write the function's parentheses 
when assigning it to an object.
*/

    // Call the method as usual.
    function person3(firstName, lastName, age) {
        this.firstName= firstName;
        this.lastName= lastName;
        this.age = age;
        this.yearOfBirth = bornYear;
    }
    function bornYear() {
        return 2016 - this.age;
    }
    var p = new person3("A", "B", 22);

    document.write(p.yearOfBirth());



/*
Call the method by the property name you specified in the constructor function, 
rather than the function name.
*/

    Example:
    // contact object constructor has 3 arguments: firstName, lastName and number
    // print() method will output the contact data to the console in the `name: number` format
    function contact(firstName, lastName, number) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.fullName = number;

        lastName = function() {
            return this.firstName + " " + this.lastName;
        }

        this.print = function() {
            console.log(firstName + ": " + number);
        }
    }

    var a = new contact("Vitalic", "Butrin", 12345);
    var b = new contact("Elon", "Mask", 987654321);
    a.print();
    b.print();
    


// NOTE: It is a common practice to declare objects with the const keyword.
const person = {firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};

// Spaces and line breaks are not important. 
// An object definition can span multiple lines:

    const person = {
        firstName:"John", 
        lastName:"Doe", 
        age:50, 
        eyeColor:"blue"
    }