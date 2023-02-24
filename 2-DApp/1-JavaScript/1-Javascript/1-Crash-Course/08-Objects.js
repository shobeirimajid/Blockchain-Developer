///////////////////////////////////////////////////////
//                      Objects
///////////////////////////////////////////////////////

// JavaScript's objects are equivalent to "dictionaries" or "maps" in other languages.
//  maps: an unordered collection of key-value pairs.
var myObj = {key1: "Hello", key2: "World"};

// Keys are strings, but quotes aren't required if they're a valid JavaScript identifier.
// Values can be any type.
var myObj = {
    myKey: "myValue", 
    "my other key": 4
};

// Object attributes can also be accessed using the subscript syntax,
myObj["my other key"]; // = 4

// ... or using the dot syntax, provided the key is a valid identifier.
myObj.myKey; // = "myValue"

// Objects are mutable; values can be changed and new keys added.
myObj.myThirdKey = true;

// If you try to access a value that's not yet set, you'll get undefined.
myObj.myFourthKey; // = undefined


var cuboid = {
    length: 25,
    width: 50,
    height: 200
};

//your code goes here
let volume = cuboid.length * cuboid.width * cuboid.height;
console.log(volume);



/*
    Sometimes, we need to set an "object type" 
        that can be used to create a number of objects of a single type.

    The standard way to create an "object type" 
        is to use an object constructor function.
*/


function person(name, age, color) {
    this.name = name;
    this.age = age;
    this.favColor = color;
  }

  /*
    The above function (person) is an object constructor, 
        which takes parameters and assigns them to the object properties.
  */

//                   name,  age, color
var p1 = new person("John", 42, "green");
var p2 = new person("Amy", 21, "red");

console.log("p1.age", p1.age); 
console.log("p2.name", p2.name);



// example 1
function person(name, age, color) {
    this.name = name;
    this.age = age;
    this.favColor = color;
  }

// The above function (person) is an object constructor, 
// which takes parameters and assigns them to the object properties.

//                   name,  age, color
var p1 = new person("John", 42, "green");
var p2 = new person("Amy", 21, "red");

console.log("p1.age: ", p1.age); 
console.log("p2.name: ", p2.name);




// Example2

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






// example 3

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
    ------------
    Methods
    ------------
    Methods are functions that are stored as object properties.

    Use the following syntax to create an object method:

        methodName = function() { code lines }
        
    Access an object method using the following syntax:

        objectName.methodName()
    
    A method is a function, belonging to an object. It can be referenced using the this keyword.
    The this keyword is used as a reference to the current object, meaning that you can access the objects properties and methods using it.

    Defining methods is done inside the constructor function.

    For Example:
*/

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
    which is a function, that takes a parameter name and assigns it 
    to the name property of the object.
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
    The this keyword is used to access the age property of the object, 
    which is going to call the method.

    Note that it's not necessary to write the function's parentheses 
    when assigning it to an object.
*/


    // Call the method as usual.


    function person3(name, age) {
        this.name= name;
        this.age = age;
        this.yearOfBirth = bornYear;
    }
    function bornYear() {
        return 2016 - this.age;
    }
    var p = new person3("A", 22);

    document.write(p.yearOfBirth());

/*
    Call the method by the property name you specified in the constructor function, 
    rather than the function name.
*/





/*
    Example:
    We have created the contact object constructor, which has two arguments, name and number.
    We add a print() method to the object, 
    which will output the contact data to the console 
    in the following format: name: number
*/

function contact(name, number) {
    this.name = name;
    this.number = number;
    this.print = function() {
        console.log(name + ": " + number);
    }
}

var a = new contact("David", 12345);
var b = new contact("Amy", 987654321);
a.print();
b.print();


/*
    ------------------
    The Math Object
    ------------------
    The Math object allows you to perform mathematical tasks, 
    and includes several properties.

    document.write(Math.PI);

    Math has no constructor. There's no need to create a Math object first.


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


    


*/

