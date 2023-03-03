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



    Example:

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





/*
-------------------
Date Object
-------------------
    The Date object enables us to work with dates.

    A date object consists of:
        year
        month
        day
        hour
        minute
        second
        milliseconds

    We can create a new date object with the current date and time Using new.

    You cannot omit month. 

    If you supply only one parameter it will be treated as milliseconds.

    JavaScript stores dates as number of milliseconds since January 01, 1970.
    Zero time is January 01, 1970 00:00:00 UTC

    One day (24 hours) is 86,400,000 milliseconds.

    JavaScript counts months from 0 to 11
        January is 0
        December is 11

    Date objects are static, rather than dynamic. 
    The computer time is ticking, but date objects don't change, once created.

    When a Date object is created, a number of methods make it possible to perform operations on it
    Date methods allow you to get and set the 
        year, month, day, hour, minute, second, and millisecond of date objects, 
    using either local time or UTC (or GMT) time.
    UTC (Universal Time Coordinated) is the same as GMT (Greenwich Mean Time).

    -----------------------
    JavaScript Date Input
    -----------------------
    There are generally 3 types of JavaScript date input formats:

    Type	        Example
    ---------       ---------------------------------------------
    ISO Date	    "2015-03-25" (The International Standard)
    Short Date	    "03/25/2015"
    Long Date	    "Mar 25 2015" or "25 Mar 2015"

    The ISO format follows a strict standard in JavaScript.
    The other formats are not so well defined and might be browser specific.


    -----------------------
    JavaScript Date Output
    -----------------------
    Independent of input format, 
    JavaScript will (by default) output dates in full text string format:
    JavaScript will (by default) use the browser's time zone 
        Fri Mar 03 2023 23:41:11 GMT+0330 (Iran Standard Time)


    -----------------------
    Time Zones
    -----------------------
    When setting a date, without specifying the time zone, JavaScript will use the browser's time zone.
    When getting a date, without specifying the time zone, the result is converted to the browser's time zone.
*/


    Examples:

    d = new Date()                              // creates a date object with the current date and time
    d = new Date(date-string)                   // new Date("2022-03-25")
    d = new Date(ms)                            // new Date(86400000)
    d = new Date(year,month)                    // new Date(2018, 11)
    d = new Date(year,month,day)                // new Date(2018, 11, 24)
    d = new Date(year,month,day,hr)             // new Date(2018, 11, 24, 10)
    d = new Date(year,month,day,hr,min)         // new Date(2018, 11, 24, 10, 33)
    d = new Date(year,month,day,hr,min,sec)     // new Date(2018, 11, 24, 10, 33, 30)
    d = new Date(year,month,day,hr,min,sec,ms)  // new Date(2018, 11, 24, 10, 33, 30, 0);

    d = new Date("January 2, 2015 10:42:00");   // Fri Jan 02 2015 10:42:00

    d = new Date(24 * 60 * 60 * 1000);  // Fri January 02 1970 00:00:00 ~ January 01 1970 + 24 hours
    d = new Date(86400000);             // One day contains 86,400,000 millisecond.            
    d = new Date(-100000000000);        // Mon Oct 31 1966 17:43:20 ~ January 01 1970 - 100,000,000,000 ms
    
    // One and two digit years will be interpreted as 19xx:
    d = new Date(99, 11, 24);   // Fri Dec 24 1999 00:00:00
    d = new Date(9, 11, 24);    // Fri Dec 24 1909 00:00:00

    // Specifying a month higher than 11, will not result in an error 
    // but add the overflow to the next year:
    d = new Date(2018, 12, 24, 10, 33, 30);   // ~ new Date(2019, 1, 24, 10, 33, 30);

    // Specifying a day higher than max, will not result in an error 
    // but add the overflow to the next month:
    d = new Date(2018, 5, 35, 10, 33, 30);    // ~ new Date(2018, 6, 5, 10, 33, 30)

    // JavaScript ISO Dates
    // ISO 8601 is the international standard for the representation of dates and times
    // The ISO 8601 syntax (YYYY-MM-DD) is also the preferred JavaScript date format
    // The computed date will be relative to your time zone.
    d = new Date("2022-03-25");
    d = new Date("2015-03");    // ISO dates can be written without specifying the day (YYYY-MM)
    d = new Date("2015");       // ISO dates can be written without month and day (YYYY)

    // SO dates can be written with added hours, minutes, and seconds (YYYY-MM-DDTHH:MM:SSZ)
    // Date and time is separated with a capital T
    // UTC time is defined with a capital letter Z
    // Omitting T or Z in a date-time string can give different results in different browsers.
    // UTC (Universal Time Coordinated) is the same as GMT (Greenwich Mean Time).
    d = new Date("2015-03-25T12:00:00Z"); 

    // If you want to modify the time relative to UTC, remove the Z and add +HH:MM or -HH:MM instead
    d = new Date("2015-03-25T12:00:00-03:30");

    // Parsing Dates to ensure valid date string
    msec = Date.parse("March 21, 2012");
    d = new Date(msec);


    // toString()
    // converte date to a long string
    d = new Date();
    d.toString();   // Sat Mar 04 2023 00:45:24 GMT+0330 (Iran Standard Time)

    // toDateString() 
    // converts a date to a more readable format
    d = new Date();
    d.toDateString();   // Sat Mar 04 2023

    // toUTCString()
    // converts a date to a string using the UTC standard
    d = new Date();
    d.toUTCString();    // Fri, 03 Mar 2023 21:21:30 GMT

    // toISOString()
    // converts a date to a string using the ISO standard
    d = new Date();
    d.toISOString();    // 2023-03-03T21:22:06.738Z








    // Final Examples

    // print the current time every second
    function printTime() {
        var d = new Date();
        var hours = d.getHours();
        var mins = d.getMinutes();
        var secs = d.getSeconds();
        console.log (hours + ":" + mins + ":" + secs);
    }
    setInterval(printTime, 1000);


    // prints the day and month.
    function main() {

        var year = parseInt(prompt(), 10);
        var month = parseInt(prompt(), 10);
        var day = parseInt(prompt(), 10);

        var d = new Date(year, month, day);

        console.log(getWeekDay(d));
        console.log(getMonthName(d)); 
    }
     

    function getWeekDay(d) {
        var names = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        return names[d.getDay()];
    }


    function getMonthName(d) {
        const months = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        return names[d.getMonth()];
    }




/*
-------------------
Math Object
-------------------
The Math object allows you to perform mathematical tasks, 
and includes several properties.

document.write(Math.PI);

Math has no constructor. There's no need to create a Math object first.
*/

var number = Math.sqrt(4); 
document.write(number);

function main() {
    var year = parseInt(readLine(), 10)
    
    //the output
    console.log(calcCent(year));
    
}

//complete the function
function calcCent(x){
    return Math.ceil(x/100);
}

var n = prompt("Enter a number", "");
var answer = Math.sqrt(n);
alert("The square root of " + n + " is " + answer);