var msg = "Hello";

alert("Welcome");
console.log(msg);
document.write(msg);

var num = parseInt(10);
// var 1d = 2;

let namevar = prompt("Please enter your name", "Shobeiri");
//document.getElementById("demo").innerHTML = "Hello " + person + "! How are you today?";
document.write(" " + namevar + "! How are you today?");



/*
    setInterval

    The setInterval() method calls a function or evaluates an expression 
    at specified intervals (in milliseconds).
    It will continue calling the function until clearInterval() 
    is called or the window is closed.

    ex:
*/

    function myAlert() {
        alert("Hi");
    }

    // This will call the myAlert function every 3 seconds (1000 ms = 1 second).
    setInterval(myAlert, 3000);









/*
    The Date Object

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

   ex:

    var d = new Date();     //d stores the current date and time


    The other ways to initialize dates allow for the 
    creation of new date objects from the specified date and time

    new Date(milliseconds)
    new Date(dateString)
    new Date(year, month, day, hours, minutes, seconds, milliseconds)

    JavaScript dates are calculated in milliseconds from 
    01 January, 1970 00:00:00 Universal Time (UTC). 
    
    One day contains 86,400,000 millisecond.

    Ex:

    //Fri Jan 02 1970 00:00:00
    var d1 = new Date(86400000); 

    //Fri Jan 02 2015 10:42:00
    var d2 = new Date("January 2, 2015 10:42:00");

    //Sat Jun 11 1988 11:42:00
    var d3 = new Date(88,5,11,11,42,0,0);


    JavaScript counts months from 0 to 11. 
    January is 0, and December is 11.

    Date objects are static, rather than dynamic. 
    
    The computer time is ticking, but date objects don't change, once created.



    Date Methods:

    When a Date object is created, 
    a number of methods make it possible to perform operations on it:

        var d = new Date();
        var hours = d.getHours();

        console.log(hours);


    Let's create a program that prints the current time to the browser once every second.


    function printTime() {
        var d = new Date();
        var hours = d.getHours();
        var mins = d.getMinutes();
        var secs = d.getSeconds();

        document.body.innerHTML = hours + ":" + mins + ":" + secs;
    }
    setInterval(printTime, 1000);



    function main() {
        var year = parseInt(readLine(), 10);
        var month = parseInt(readLine(), 10);
        var day = parseInt(readLine(), 10);
         
        console.log(getWeekDay(year, month, day)); 
    }
     

    function getWeekDay(year, month, day) {

        var names = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

        var d = new Date(year, month, day);
       
        var day = d.getDay();

        return names[day];
    }
*/







/*
    The DOM

    When you open any webpage in a browser, 
    the HTML of the page is loaded and rendered visually on the screen.

    To accomplish that, the browser builds the Document Object Model of that page, 
    which is an object oriented model of its logical structure.

    JavaScript can be used to manipulate the DOM of a page dynamically to add, delete and modify elements.


    DOM Tree

    The DOM represents a document as a tree structure.
    HTML elements become interrelated nodes in the tree.

        - All those nodes in the tree have some kind of relations among each other.
        - Nodes can have child nodes. 
        - Nodes on the same tree level are called siblings.




    The document Object

    There is a predefined document object in JavaScript, 
    which can be used to access all elements on the DOM.

    In other words, the document object is the owner (or root) 
    of all objects in your webpage.

    So, if you want to access objects in an HTML page, 
    you always start with accessing the document object.


    For example:

        document.body.innerHTML = "Some text";
    
    As body is an element of the DOM, 
    we can access it using the document object and change the content of the innerHTML property.

    The innerHTML property can be used on almost all HTML elements to change its content.



    Selecting Elements

    All HTML elements are objects. 

    And as we know every object has properties and methods.

    The document object has methods that allow you to select the desired HTML element.

    These three methods are the most commonly used for selecting HTML elements:

    //finds element by id

        document.getElementById(id) 

    //finds elements by class name

        document.getElementsByClassName(name) 

    //finds elements by tag name

        document.getElementsByTagName(name)

    In the example below, 
    the getElementById method is used to select the element 
    with id="demo" and change its content:

    var elem = document.getElementById("demo");
    elem.innerHTML = "Hello World!";

    The example above assumes that the HTML contains an element with id="demo", 
    for example :
    
        <div id="demo"></div>.



    Selecting Elements


    The "getElementsByClassName()" method 
    returns a collection of all elements in the document with the specified class name.

    For example, if our HTML page contained three elements with class="demo", 
    the following code would return all those elements as an array:

        var arr =  document.getElementsByClassName("demo");
        //accessing the second element
        arr[1].innerHTML = "Hi";
    
    Similarly, the  "getElementsByTagName"  method 
    returns all of the elements of the specified tag name as an array.

    The following example gets all paragraph elements of the page and changes their content:

    <p>hi</p>
    <p>hello</p>
    <p>hi</p>

    <script>
        var arr = document.getElementsByTagName("p");
        for (var x = 0; x < arr.length; x++) {
            arr[x].innerHTML = "Hi there";
        }
    </script>

    
    The script will result in the following HTML:


    <p>Hi there</p>
    <p>Hi there</p>
    <p>Hi there</p>
    

    We used the length property of the array to loop through all the selected elements in the above example.

        


    Working with DOM

    Each element in the DOM has a set of properties and methods 
    that provide information about their relationships in the DOM:
        
        element.childNodes 
        
            returns an array of an element's child nodes.

        element.firstChild 
        
            returns the first child node of an element.

        element.lastChild 
        
            returns the last child node of an element.

        element.hasChildNodes 
        
            returns true if an element has any child nodes, otherwise false.

        element.nextSibling 
        
            returns the next node at the same tree level.

        element.previousSibling 
        
            returns the previous node at the same tree level.

        element.parentNode 
        
            returns the parent node of an element.



    We can, for example, select all child nodes of an element and change their content:


        function setText() {
            var a = document.getElementById("demo");
            var arr = a.childNodes;
            for(var x=0;x<arr.length;x++) {
                arr[x].innerHTML = "new text";
            }
        }

        // The code above changes the text of both paragraphs to "new text".




    Changing Attributes


    Once you have selected the element(s) 
    you want to work with, 
    you can change their attributes.

    As we have seen in the previous lessons, 
    we can change the text content of an element 
    using the innerHTML property.

    Similarly, we can change the attributes of elements.

    For example, we can change the src attribute of an image:

    <img id="myimg" src="orange.png" alt="" />


    <script>
        var el = document.getElementById("myimg");
        el.src = "apple.png";
    </script>
    

    We can change the href attribute of a link:


        // calling the function in window.onload to make sure the HTML is loaded

        window.onload = function() {
            var el = document.getElementsByTagName('a');
            el[0].href= 'http://www.sololearn.com';
        };


        // Practically all attributes of an element can be changed using JavaScript.




    Changing Style

    The style of HTML elements can also be changed using JavaScript.

    All style attributes can be accessed using the style object of the element.

    For example:


        //calling the function in window.onload to make sure the HTML is loaded
        window.onload = function() {
            var x = document.getElementById("demo");
            x.style.color = '#6600FF';
            x.style.width = '100px';
        };


    The code above changes the text color and width of the div element.


    All CSS properties can be set and modified using JavaScript. 
    Just remember, that you cannot use dashes (-) in the property names: 
    these are replaced with camelCase versions,
    where the compound words begin with a capital letter.

    For example: 
    the background-color property should be referred to as backgroundColor.


    var s = document.getElementsByTagName("span");

    for (var x=0; x<s.length;x++) {
        s[i].style.backgroundColor = "#33EA73";
    }
    
    


    Creating Elements

    Use the following methods to create new nodes:


        element.cloneNode() 
    
            clones an element and returns the resulting node.


        document.createElement(element) 
    
            creates a new element node.


        document.createTextNode(text) 
        
            creates a new text node.

    For example:

        var node = document.createTextNode("Some new text");


    This will create a new text node, 
    but it will not appear in the document 
    until you append it to an existing element 
    with one of the following methods:


        element.appendChild(newNode) 

            adds a new child node to an element as the last child node.

        element.insertBefore(node1, node2) 

            inserts node1 as a child before node2.


    Example:


        // calling the function in window.onload to make sure the HTML is loaded

        window.onload = function() {

            // creating a new paragraph
            var p = document.createElement("p");
            var node = document.createTextNode("Some new text");

            // adding the text to the paragraph
            p.appendChild(node);

            var div = document.getElementById("demo");

            //adding the paragraph to the div
            div.appendChild(p);
        };

        // This creates a new paragraph and adds it to the existing div element on the page.



    Example:
        add a new <li> element to the unordered list with id="list"


        var el = document.createElement("li");
        var txt = document.createTextNode("B");
        el.appendChild(txt);

        var ul = document.getElementById("list");
        ul.appendChild(el);



    Removing Elements


    To remove an HTML element, you must select the parent of the element 
    and use the removeChild(node) method.

    For example:

    //calling the function in window.onload to make sure the HTML is loaded

    window.onload = function() {

        var parent = document.getElementById("demo");
        var child = document.getElementById("p1");

        parent.removeChild(child);
    };




    Replacing Elements


    To replace an HTML element, replaceChild method is used:

        element.replaceChild(newNode, oldNode) 

    For example:


        window.onload = function() {

            var p = document.createElement("p");
            var node = document.createTextNode("This is new");
            p.appendChild(node);

            var parent = document.getElementById("demo");
            var child = document.getElementById("p1");
            parent.replaceChild(p, child);
        };


    

    Animations

    Now that we know how to select and change DOM elements, 
    we can create a simple animation.

    Let's create a simple HTML page with a box element 
    that will be animated using JS.

    <!DOCTYPE html>
    <html>
        <head>
            <title>Page Title</title>
            <style>
                #container {
                    width: 200px;
                    height: 200px;
                    background: green;
                    position: relative;
                }
                #box {
                    width: 50px;
                    height: 50px;
                    background: red;
                    position: absolute;
                }
            </style>
        </head>
        <body>
            <div id="container">
                <div id="box"> </div>
            </div>
        </body>
    </html>


    Our box element is inside a container element. 
    
    Note the position attribute used for the elements: 
    
        container   :      "relative"
        box         :      "absolute"
        
    This will allow us to create the animation relative to the container.

    We will be animating the red box to make it move to the right side of the container.
    You need to be familiar with CSS to better understand the code provided.


    Animations


    To create an animation, we need to change the properties of an element 
    at small intervals of time. 
    
    We can achieve this by using the setInterval() method, 
    which allows us to create a timer and call a function 
    to change properties repeatedly at defined intervals (in milliseconds).

    For example:

    var t = setInterval(move, 500); 
    
    This code creates a timer that calls a move() function every 500 milliseconds.

    Now we need to define the move() function, 
    that changes the position of the box.



    // starting position
    var pos = 0; 

    // our box element
    var box = document.getElementById("box");

    function move() {
        pos += 1;
        box.style.left = pos + "px";    // px = pixels
    }
    


    The move() function increments the left property of the box element by one each time it is called.


    The following code defines a timer that calls the move() function every 10 milliseconds:

        var t = setInterval(move, 10);
    
    However, this makes our box move to the right forever. 
    To stop the animation when the box reaches the end of the container, 
    we add a simple check to the move() function 
    and use the clearInterval() method to stop the timer.



    function move() {
        if(pos >= 150) {
            clearInterval(t);
        }
        else {
            pos += 1;
            box.style.left = pos+"px";
        }
    }


    When the left attribute of the box reaches the value of 150, 
    the box reaches the end of the container, 
    based on a container width of 200 and a box width of 50.

    The final code:

    
    window.onload = function() {
        var pos = 0; 

        // our box element
        var box = document.getElementById('box');
        var t = setInterval(move, 10);
    
        function move() {
            if(pos >= 150) {
                clearInterval(t);
            }
            else {
                pos += 1;
                box.style.left = pos+'px';
            }
        }
    };
    



    Events

    You can write JavaScript code that executes when an event occurs, 
    such as when a user clicks an HTML element, 
    moves the mouse, or submits a form.

    When an event occurs on a target element, a handler function is executed.

    Corresponding events can be added to HTML elements as attributes.

    For example: 
    
        <p onclick="someFunc()">some text</p>


    Handling Events

        Let's display an alert popup when the user clicks a specified button:

        <!DOCTYPE html>
        <html>
            <head>
                <title>Page Title</title>
            </head>
            <body>
                <button onclick="show();">Click Me</button>
                <script>
                    function show() {
                        alert("Hi there");
                    }
                </script>
            </body>
        </html>


    Event handlers can be assigned to elements.
    You can attach events to almost all HTML elements.


    For example:


        <!DOCTYPE html>
        <html>
            <head>
                <title>Page Title</title>
            </head>
            <body>
                <button id="demo">Click Me</button>
            </body>
        </html>


        window.onload = function() {

            var x = document.getElementById('demo');

            x.onclick = function () {
                document.body.innerHTML = Date();
            }
        };




    The onload and onunload events are triggered 
    when the user enters or leaves the page. 
    
    These can be useful when performing actions after the page is loaded.


        <body onload="doSomething()">

    
    Similarly, the window.onload event can be used to run code after the whole page is loaded.


        window.onload = function() {
            //some code
        }


    The onchange event is mostly used on textboxes. 
    The event handler gets called when the text inside the textbox changes 
    and focus is lost from the element.

    For example:

        <input type="text" id="name" onchange="change()">

        function change() {
            var x = document.getElementById('name');
            x.value = x.value.toUpperCase();
        }

    
    It’s important to understand events, 
    because they are an essential part of dynamic web pages.





    Event Listeners

    The addEventListener() method attaches an event handler to an element 
    without overwriting existing event handlers. 
    
    You can add many event handlers to one element.

    You can also add many event handlers of the same type to one element, 
    i.e., two "click" events.


        element.addEventListener(event, function, useCapture);
    
            The first parameter is the event's type (like "click" or "mousedown").

            The second parameter is the function we want to call when the event occurs.

            The third parameter is a Boolean value specifying whether to use 
            event bubbling or event capturing. 
            This parameter is optional, and will be described in the next lesson.
    

    Note that you don't use the "on" prefix for this event; 
    use "click" instead of "onclick".

    Example:

        element.addEventListener("click", myFunction);
        element.addEventListener("mouseover", myFunction);

        function myFunction() {
            alert("Hello World!");
        }
    
    This adds two event listeners to the element.
    We can remove one of the listeners:

        element.removeEventListener("mouseover", myFunction);
    
    Let's create an event handler that removes itself after being executed:


    window.onload = function() {

        var btn = document.getElementById("demo");

        btn.addEventListener("click", myFunction);

        function myFunction() {
            alert(Math.random());
            btn.removeEventListener("click", myFunction);
        }
    };


    After clicking the button,
     an alert with a random number displays 
     and the event listener is removed.

    

    Internet Explorer version 8 and lower do not support this methods:

        addEventListener() 
        removeEventListener()
        
    However, you can use the 
    
        document.attachEvent() 
    
    method to attach event handlers in Internet Explorer.





    Event Propagation

    There are two ways of event propagation in the HTML DOM: 
    
        - bubbling 
        - capturing

    Event propagation allows for the definition of the element order when an event occurs. 
    If you have a <p> element inside a <div> element, 
    and the user clicks on the <p> element, 
    which element's "click" event should be handled first?


    In bubbling, the innermost element's event is handled first 
    and then the outer element's event is handled. 

        The <p> element's click event is handled first, 
        followed by the <div> element's click event.


    In capturing, the outermost element's event is handled first
     and then the inner. 
     
        The <div> element's click event is handled first, 
        followed by the <p> element's click event.


        Capturing   goes down the DOM
        Bubbling    goes up the DOM 
    
    
    Capturing vs. Bubbling


    The addEventListener() method allows you to specify the propagation type 
    with the "useCapture" parameter.

        addEventListener(event, function, useCapture)
    

    The default value is false,
     which means the bubbling propagation is used; 
     when the value is set to true, the event uses the capturing propagation.
    
        // Capturing propagation
            elem1.addEventListener("click", myFunction, true); 

        // Bubbling propagation
            elem2.addEventListener("click", myFunction, false);
    
    This is particularly useful when you have the same event handled 
    for multiple elements in the DOM hierarchy.



    Image Slider


    Now we can create a sample image slider project. The images will be changed using "Next" and "Prev" buttons.
    Now, let’s create our HTML, which includes an image and the two navigation buttons:


    We are going to use three sample images that we have uploaded to our server. 
    You can use any number of images.


    Now we need to handle the Next and Prev button clicks 
    and call the corresponding functions to change the image.

    -----------------
    HTML
    -----------------

    	<button onclick="prev()"> Prev </button>
        <img id="slider" src="http://www.sololearn.com/uploads/slider/1.jpg" width="200px" height="100px"/>
        <button onclick="next()"> Next </button>

    -----------------
    CSS
    -----------------

        button {
            margin-top:30px;
            float:left;
            height:50px;
        }
        img {
            float:left;
            margin-right:10px;
            margin-left:10px;
        }

    -----------------
    JS
    -----------------

        var images = [
            'http://www.sololearn.com/uploads/slider/1.jpg', 
            'http://www.sololearn.com/uploads/slider/2.jpg', 
            'http://www.sololearn.com/uploads/slider/3.jpg'
        ];

        var num = 0;

        function next() {
            var slider = document.getElementById('slider');
            num++;
            if(num >= images.length) {
                num = 0;
            }
            slider.src = images[num];
        }

        function prev() {
            var slider = document.getElementById('slider');
            num--;
            if(num < 0) {
                num = images.length-1;
            }
            slider.src = images[num];
        }





    Form Validation

    HTML5 adds some attributes that allow form validation. 
    For example, the required attribute can be added to an input field 
    to make it mandatory to fill in.

    More complex form validation can be done using JavaScript.

    The form element has an onsubmit event that can be handled to perform validation.

    For example, 
        let's create a form with two inputs and one button. 
    
    The text in both fields should be the same and not blank to pass the validation.


    <form onsubmit="return validate()" method="post">

        Number: <input type="text" name="num1" id="num1" /> <br />
        Repeat: <input type="text" name="num2" id="num2" /> <br />
        <input type="submit" value="Submit" />

    </form>
    
    
    Now we need to define the validate() function:


    function validate() {

        var n1 = document.getElementById('num1');
        var n2 = document.getElementById('num2');

        if(n1.value != '' && n2.value != '') {
            if(n1.value == n2.value)
                return true;
        }

        alert("The values should be equal and not blank");

        return false;
    }



    We return true only when the values are not blank and are equal.

    The form will not get submitted if its onsubmit event returns false.


*/
    











/*

    ECMAScript 6

    ECMAScript (ES) is a scripting language specification created to standardize JavaScript.

    The Sixth Edition, 
        initially known as ECMAScript 6 (ES6) 
        and later renamed to ECMAScript 2015, 
    adds significant new syntax for writing complex applications, 

    including :

        classes 
        modules
        iterators 
        for/of loops 
        generators
        arrow functions 
        binary data
        typed arrays
        collections (maps, sets, weak maps)
        promises
        number and math enhancements
        reflection
        proxies

    In other words, ES6 is a superset of JavaScript (ES5). 
    The reason that ES6 became so popular is that 
    it introduced new conventions and OOP concepts such as classes.

    In this module, we cover the most important additions to ES6.

    So, let's jump right in!


    -------------------
    var & let
    -------------------
    In ES6 we have three ways of declaring variables:

        var a = 10;
        const b = 'hello';
        let c = true;
    
    The type of declaration used depends on the necessary scope. 
    Scope is the fundamental concept in all programming languages 
    that defines the visibility of a variable.

    var 
        defines a variable globally, or locally to an "entire function"
        regardless of block scope
    
    let 
        allows you to declare variables that are limited in scope 
        to the block, statement, or expression in which they are used.

    For example:

        if (true) {
            let name = 'Jack';
        }
        // name isn't reachable
        alert(name);


    In this case, 
    the name variable is accessible only in the scope of the if statement 
    because it was declared as let.

    To demonstrate the difference in scope between var and let,
    consider this example:


        function varTest() {
            var x = 1;
            if (true) {
                var x = 2;          // same variable
                console.log(x);     // 2
            }
            console.log(x);         // 2
        }

        function letTest() {
            let x = 1;
            if (true) {
                let x = 2;          // different variable
                console.log(x);     // 2
            }
            console.log(x);         // 1
        }

        varTest();
        letTest();


    -------------------
    const
    -------------------
    const variables have the same scope as variables declared using let.

    The difference is that const variables are immutable 
        - they are not allowed to be reassigned.
    
    For example, the following generates an exception:

        const a = 'Hello';
        a = 'Bye';

        ERROR:
        TypeError: Assignment to constant variable.
 

    const is not subject to Variable Hoisting too, 
    which means that const declarations do not move to the top of the current execution context.

    Also note that ES6 code will run only in browsers that support it. 
    Older devices and browsers that do not support ES6 will return a syntax error.



    --------------------------------------
    Template Literals in ES6
    --------------------------------------

    Template literals are a way to output variables in the string.

    Prior to ES6 we had to break the string, 
    for example:

        let name = 'David';
        let msg = 'Welcome ' + name + '!';
        console.log(msg);


    ES6 introduces a new way of outputting variable values in strings.

    The same code above can be rewritten as:

        let name = 'David';
        let msg = `Welcome ${name}!`;
        console.log(msg);


    ----------
    Notice
    ----------
    template literals are enclosed by the 
        backtick (` `) character 
    instead of double or single quotes.

    The ${expression} is a placeholder, 
    and can include any expression, 
    which will get evaluated and inserted into the template literal.

    For example:

            let a = 8;
            let b = 34;
            let msg = `The sum is ${a+b}`;
            console.log(msg);


    To escape a backtick in a template literal, 
    put a backslash \ before the backtick.


    Example:

            function main() {
                var country = readLine();
                var capital = readLine();
                console.log(countryCard(country, capital));
            }

            function countryCard(country, capital){
                var msg = `Name: ${country}, Capital: ${capital}`;
                return msg;
            }



    -------------------------
    Loops in ECMAScript 6
    -------------------------
    In JavaScript we commonly use the 'for' loop to iterate over values in a 'list':

            let arr = [1, 2, 3];

            for (let k = 0; k < arr.length; k++) {
                console.log(arr[k]);
            }


    The for...in loop is intended for iterating over the enumerable 'keys' of an 'object'.

    For example:

            let obj = {a: 1, b: 2, c: 3};

            for (let v in obj) {
                console.log(v); 
            }

            Output: 
            a
            b
            c


    The for...in loop should NOT be used to iterate over arrays 
        because, depending on the JavaScript engine, 
        it could iterate in an arbitrary order. 
    
    Also, the iterating variable 
        is a string, not a number, 
        so if you try to do any math with the variable, 
        you'll be performing string concatenation instead of addition.

    
    ES6 introduces the new for...of loop, 
    which creates a loop iterating over iterable objects.

    For example:

            let list = ["x", "y", "z"];
            for (let val of list) {
                console.log(val);
            }

            Output: 
            x
            y
            z

    During each iteration 
    the val variable is assigned the corresponding element in the list.

    The for...of loop works for other iterable objects as well, 
    including strings:

            for (let ch of "Hello") {
                console.log(ch);
            }

            Output: 
                    H 
                    e 
                    l
                    l 
                    o 
    
    The 'for...of' loop also works on the newly introduced collections :
        Map
        Set
        WeakMap
        WeakSet
    
    We will learn about them in the upcoming lessons.

    Note that ES6 code will run only in browsers that support it. 
    Older devices and browsers that do not support ES6 will return a syntax error.



    --------------------------------------
    Functions in ECMAScript 6
    --------------------------------------

    Prior to ES6, a JavaScript function was defined like this:



        function add(x, y) {
            var sum = x+y;  
            console.log(sum);
        }

        add(35, 7);



    ES6 introduces a new syntax for writing functions. 
    The same function from above can be written as:



        const add = (x, y) => {
            let sum = x + y;  
            console.log(sum);
        }

        add(35, 7);



    This new syntax is quite handy when 
    you just need a simple function with one argument.
        You can skip typing function and return, 
        as well as some parentheses and braces.

    For example:

        const greet = x => "Welcome " + x;
        alert(greet("David"));
    

    The code above defines 
    a function named greet
     that has one argument 
     and returns a message.

    If there are no parameters, 
    an empty pair of parentheses should be used, 
    as in:

        const x = () => alert("Hi");
        x();

    
    The syntax is very useful for inline functions. 
    For example, let's say we have an array, 
    and for each element of the array we need to execute a function. 
    
    We use the forEach method of the array 
    to call a function for each element:


        var arr = [2, 3, 7, 8];

        arr.forEach(function(el) {
            console.log(el * 2);
        });


    However, in ES6, the code above can be rewritten as following:


        const arr = [2, 3, 7, 8];

        arr.forEach(v => {
            console.log(v * 2);
        });

    
    The code is shorter and looks pretty nice, doesn't it?




    an arrow function that takes an array and prints the odd elements.

        const printOdds = (arr) => {
            arr.forEach(el => {
                if (el % 2 != 0) console.log(el);
            });
        }



    ---------------------------
    Default Parameters in ES6
    ---------------------------
    In ES6, we can put the default values right in the signature of the functions.

    For example:

    
        function test(a, b = 3, c = 42) {
            return a + b + c;
        }
        console.log(test(5));


        // Full ES6 equivalent
        const test = (a, b = 3, c = 42) => a + b + c;
        console.log(test(5));



    And here's an example of an arrow function with default parameters:

        const test = (a, b = 3, c = 42) => {
            return a + b + c;
        }
        console.log(test(5)); //50 


    Default value expressions are evaluated at function call time 
    from left to right. 
    This also means that 
    default expressions can use the values of previously-filled parameters.



    ---------------------------
    ES6 Objects
    ---------------------------
    JavaScript variables can be Object data types 
    that contain many values called properties.

    An object can also have properties that are 
    function definitions called methods for performing actions on the object.

    ES6 introduces shorthand notations and computed property names 
    that make declaring and using objects easier to understand.

    The new method definition shorthand 
    does not require the colon (:) or function keyword, 
    as in the grow function of the tree object declaration:


        let tree = {
            height: 10,
            color: 'green',
            grow() { 
                this.height += 2;
            }
        };

        tree.grow();
        console.log(tree.height); // 12

    
    You can also use a property value shorthand 
    when initializing properties with a variable by the same name.

    For example, properties height and health 
    are being initialized with variables named height and health


        let height = 5;
        let health = 100;

        let athlete = {
            height,     // height: height,
            health      // health: health
        };

        console.log(athlete.height); // 5

    
    When creating an object by using duplicate property names, 
    the last property will overwrite the prior ones of the same name.

    For Example:

        var a = {x: 1, x: 2, x: 3, x: 4};
        console.log(a.x);   // 4 


    Duplicate property names generated a SyntaxError in ES5 when using strict mode. 
    However, ES6 removed this limitation.


    
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
`       var a = {
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


    It is very useful when you need to create custom objects based on some variables.



    ---------------------------
    Object.assign() in ES6
    ---------------------------
    ES6 adds a new Object method assign() that 
    allows us to combine multiple sources into one target to create a single new object.

        Object.assign() 
    
    is also useful for creating a duplicate of an existing object.

    Let's look at the following example to see how to combine objects:


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

        
        let person = {
            name: 'Jack',
            age: 18
        };

        let newPerson = person;
        newPerson.name = 'Bob';

        console.log(person.name);       // Bob
        console.log(newPerson.name);    // Bob

    
    To avoid this (mutations), 
    use Object.assign() to create a new object.

    For example:


        let person = {
            name: 'Jack',
            age: 18
        };

        let newPerson = Object.assign({}, person);
        newPerson.name = 'Bob';

        console.log(person.name);       // Jack
        console.log(newPerson.name);    // Bob



    Finally, you can assign a value to an object property in the Object.assign() statement.


    For example:


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

        let arr = ['1', '2', '3'];

        let [one, two, three] = arr;

        console.log(one);       // 1
        console.log(two);       // 2
        console.log(three);     // 3    


    We can use also destructure an array returned by a function.

    For example:


        let a = () => {
            return [1, 3, 2];
        };

        let [one, , two] = a();

        console.log(one); // 1
        console.log(two); // 2

    Notice that we left the second argument's place empty.



    The destructuring syntax also simplifies assignment and swapping values:


        let a, b, c = 4, d = 8;

        [a, b = 6] = [2];

        console.log(a);     // 2
        console.log(b);     // 6

        [c, d] = [d, c];

        console.log(c);     // 8
        console.log(d);     // 4


    

    ---------------------------   
    Object Destructuring in ES6
    ---------------------------
    Similar to Array destructuring, 
    Object destructuring unpacks properties into distinct variables.

    For example:


        let obj = {h:100, s: true};
        let {h, s} = obj;

        console.log(h); // 100
        console.log(s); // true

    
    We can assign without declaration, 
    but there are some syntax requirements for that:


        let a, b;
        ( {a, b} = {a: 'Hello ', b: 'Jack'} );

        console.log(a + b);     // Hello Jack 



    The () with a semicolon (;) 
    at the end are mandatory when destructuring without a declaration. 
    However, you can also do it as follows where the () are not required:


        let {a, b} = {a: 'Hello ', b: 'Jack'};

        console.log(a + b);     // Hello Jack 



    You can also assign the object to new variable names.
    For example:

        
        var o = {h: 42, s: true};
        var {h: foo, s: bar} = o;

        //console.log(h);   // Error
        console.log(foo);   // 42


    Finally you can assign default values to variables, 
    in case the value unpacked from the object is undefined.
    For example:

        
        var obj = {id: 42, name: "Jack"};
        let {id = 10, age = 20} = obj;

        console.log(id);    // 42
        console.log(age);   // 20

    

    ---------------------------
    ES6 Rest Parameters
    ---------------------------
    Prior to ES6, 
    if we wanted to pass a variable number of arguments to a function,
     we could use the 'arguments' object, 
     an array-like object, to access the parameters passed to the function.

    For example, let's write a function that checks 
    if an array contains all the arguments passed:


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



    We can pass any number of arguments to the function 
    and access it using the 'arguments' object.


    While this does the job, 
    ES6 provides a more readable syntax to achieve variable number of parameters 
    by using a rest parameter


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



    The '...nums' parameter is called a 'rest' parameter
        It takes all the "extra" arguments passed to the function
    
    The three dots (...) are called the 'Spread' operator

    Only the last parameter of a function may be marked as a rest parameter.

    If there are no extra arguments, 
    the rest parameter will simply be an empty array; 
    
    the rest parameter will never be undefined.




    Example:  calculate the sum of any number of values

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




    Example:  calculate the sum of even number of input values

        function magic(...nums) {
            let sum = 0;
            nums.filter(n => n % 2 == 0).map(el => sum+= el);
            return sum;
        }
        console.log(magic(1, 2, 3, 4, 5, 6));



    ---------------------------
    The Spread Operator
    ---------------------------
    This operator is similar to the Rest Parameter, 
    but it has another purpose when used in objects or arrays or function calls (arguments).


    Spread in function calls

    It is common to pass the elements of an array as arguments to a function. 


    Before ES6, we used the following method:


        function myFunction(w, x, y, z) {
            console.log(w + x + y + z);
        }
        var args = [1, 2, 3];
        myFunction.apply(null, args.concat(4)); 

    
    ES6 provides an easy way to do the example above with spread operators


        const myFunction = (w, x, y, z) => {
            console.log(w + x + y + z);         // 10
        };
        let args = [1, 2, 3];
        myFunction(...args, 4);

        
    Example:


        var dateFields = [1970, 0, 1];          // 1 Jan 1970
        var date = new Date(...dateFields);
        console.log(date);                      // 1969-12-31T20:30:00.000Z 


    ---------------------------
    Spread in array literals
    ---------------------------
    Before ES6, we used the following syntax to add an item at middle of an array:



        var arr = ["One", "Two", "Five"];

        arr.splice(2, 0, "Three");
        arr.splice(3, 0, "Four");
        console.log(arr);           // ["One", "Two", "Three", "Four", "Five"]


    You can use methods such as :
        push
        splice 
        concat

    for example, to achieve this in different positions of the array. 
    However, in ES6 the spread operator lets us do this more easily:


        let newArr = ['Three', 'Four']; 
        let arr = ['One', 'Two', ...newArr, 'Five'];
        console.log(arr);           
        
    
    ---------------------------
    Spread in object literals
    ---------------------------
    In objects it copies the own enumerable properties 
    from the provided object onto a new object.


        const obj1 = { foo: 'bar', x: 42 };
        const obj2 = { foo: 'baz', y: 5 };

        const clonedObj = { ...obj1 };              // { foo: "bar", x: 42 }
        const mergedObj = { ...obj1, ...obj2 };     // { foo: "baz", x: 42, y: 5 }


    However, if you try to merge them you will not get the result you expected:

            
        const obj1 = { foo: 'bar', x: 42 };
        const obj2 = { foo: 'baz', y: 5 };

        const merge = (...objects) => ({ ...objects });     //  merge is null

        let mergedObj = merge (obj1, obj2);

            // { 0: { foo: 'bar', x: 42 }, 1: { foo: 'baz', y: 5 } }

        let mergedObj2 = merge ({}, obj1, obj2);

            // { 0: {}, 1: { foo: 'bar', x: 42 }, 2: { foo: 'baz', y: 5 } }

    

    Shallow cloning or merging objects is possible with 
    another operator called Object.assign().   
    
    
    
---------------------------
Classes in ES6
---------------------------
In this lesson we'll explain 
how to create a class 
that can be used to create multiple objects of the same structure.

A class uses the keyword class 
and contains a constructor method for initializing.


For example:



        class Rectangle {
            constructor(height, width) {
                this.height = height;
                this.width = width;
            }
        }

    

A declared class can then be used to 
create multiple objects using the keyword new.

For example:



        class Rectangle {
            constructor(height, width) {
                this.height = height;
                this.width = width;
            }
        }

        const square = new Rectangle(5, 5);
        const poster = new Rectangle(2, 3); 

        console.log(square.height);



Class Declarations are not hoisted 
while Function Declarations are. 
If you try to access your class before declaring it, 
ReferenceError will be returned.

    
You can also define a class with a class expression, 
where the class can be named or unnamed.

A named class looks like:


        var Square = class Rectangle {
            constructor(height, width) {
                this.height = height;
                this.width = width;
            }
        };


In the unnamed class expression, 
a variable is simply assigned the class definition:


        var Square = class {
            constructor(height, width) {
                this.height = height;
                this.width = width;
            }
        };
    


The constructor is a special method 
which is used for creating and initializing an object created with a class.

There can be only one constructor in each class.


    ---------------------------
    Class Methods in ES6
    ---------------------------
    ES6 introduced a shorthand 
    that does not require the keyword function 
    for a function assigned to a method's name. 
    
    One type of class method is the prototype method, 
    which is available to objects of the class.

    For Example:
    


        class Rectangle {

            constructor(height, width) {
                this.height = height;
                this.width = width;
            }
            
            get area() {
                return this.calcArea();
            }

            calcArea() {
                return this.height * this.width;
            }
        }

        const square = new Rectangle(5, 5);
        console.log(square.area); // 25

        // In the code above, area is a getter, calcArea is a method.



    Another type of method is the "static method"
    which cannot be called through a class instance. 
    Static methods are often used to create utility functions for an application.

    For Example:



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

        console.log(Point.distance(p1, p2));    // 7.211102550927979



    As you can see, 
    the static distance method is called directly using the class name, 
    without an object.



        function main() {
            var exam1 = parseInt(readLine(), 10);
            var exam2 = parseInt(readLine(), 10);
            var exam3 = parseInt(readLine(), 10);
            console.log(Exams.average(exam1,exam2,exam3));
        }

        class Exams{
            static average(e1, e2, e3) {
                return Math.round((e1 + e2 + e3)/3);
            }
        }

    

    ---------------------------
    Inheritance in ES6
    ---------------------------
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


    
    ---------------------------
    ES6 Map
    ---------------------------
    A Map object can be used to hold `key/value` pairs. 
    A `key` or `value` in a map can be anything (objects and primitive values).

        new Map([iterable]) 

    creates a Map object where iterable is an array or any other iterable object 
    whose elements are arrays (with a key/value pair each).

    An  `Object`  is similar to  `Map`  
    but there are important differences that make using a Map preferable in certain cases:
        

        1) The keys can be any type including functions, objects, and any primitive.
        2) You can get the size of a Map.
        3) You can directly iterate over Map.
        4) Performance of the Map is better in scenarios involving 
            frequent addition and removal of key/value pairs.


    The size property returns the number of key/value pairs in a map.

    For example:


        let map = new Map([['k1', 'v1'], ['k2', 'v2']]);

        console.log(map.size); // 2




    Methods:

        set(key, value) 
        
            Adds a specified key/value pair to the map. 
            If the specified key already exists, 
            value corresponding to it is replaced with the specified value.

        get(key) 
        
            Gets the value corresponding to a specified key in the map. 
            If the specified key doesn't exist, 
            undefined is returned.

        has(key) 
        
            Returns true if a specified key exists in the map and false otherwise.

        delete(key) 
        
            Deletes the key/value pair with a specified key from the map and returns true. 
            Returns false if the element does not exist.

        clear() 
        
            Removes all key/value pairs from map.

        keys() 
        
            Returns an Iterator of keys in the map for each element.

        values() 
        
            Returns an Iterator of values in the map for each element.

        entries() 
        
            Returns an Iterator of array[key, value] in the map for each element.
            



    For example:

     
            let map = new Map();
            map.set('k1', 'v1').set('k2', 'v2');

            console.log(map.get('k1'));     // v1
            console.log(map.has('k2'));     // true

            for (let kv of map.entries())
                console.log(kv[0] + " : " + kv[1]);

                // k1 : v1 
                // k2 : v2 
    

    The above example demonstrates some of the ES6 Map methods.

    Map supports different data types 
    i.e. 1 and "1" are two different keys/values.




            function main() {

                var name = readLine();
                var position = readLine();

                let employees = new Map([
                    ["Richard", "Developer"],
                    ["Maria", "SEO Specialist"],
                    ["Tom", "Product Manager"],
                    ["David", "Accountant"],
                    ["Sophia", "HR Manager"]
                ]);

                // add the new pair to the map
                employees.set(name, position);

                for (var i of employees.entries()){
                    console.log(i[0] + " : " + i[1]);
                } 
            }




    ---------------------------
    ES6 Set
    ---------------------------
    Set object can be used to hold unique values (no repetitions are allowed).
    A value in a set can be anything (objects and primitive values).

    creates a Set object 
    
        new Set([iterable]) 

        iterable is an array or any other iterable object of values.

        The size property returns the number of `distinct` values in a set.



    For example:

        let set = new Set([1, 2, 4, 2, 59, 9, 4, 9, 1]);
        console.log(set.size); // 5


    Methods

        add(value) 
            Adds a new element with the given value to the Set.

        delete(value) 
            Deletes a specified value from the set.

        has(value) 
            Returns true if a specified value exists in the set and false otherwise.

        clear() 
            Clears the set.

        values() 
            Returns an Iterator of values in the set.

    

    let set = new Set();
    set.add(5).add(9).add(59).add(9);

    console.log(set.has(9));        // true

    for (let v of set.values())
        console.log(v);             //  5
                                    //  9
                                    //  59

        
    The above example demonstrates some of the ES6 Set methods.

    Set supports different data types 
    i.e. 1 and "1" are two different values.

    NaN and undefined can also be stored in Set.



    ---------------------------
    ES6 Promises
    ---------------------------
    A `Promise` is a better way for `asynchronous programming` 
    when compared to the common way of using method `setTimeout()`
    

    Consider this example:



            setTimeout(function() {
                console.log("Work 1");
                setTimeout(function() {
                    console.log("Work 2");
                }, 2000);
            }, 1000);

            console.log("End");

            

    // Output:  End 
                Work 1      // after 1000 ms
                Work 2      // after 2000 ms


    It prints "End", "Work 1" and "Work 2" in that order (the work is done asynchronously). 


    But if there are more events like this, 
    the code becomes very complex.

    ES6 comes to the rescue in such situations. 


    A promise can be created as follows:



        new Promise(function(resolve, reject) {

            // Work

            if (success)
                resolve(result);
            else
                reject(Error("failure"));
        });
    
        // resolve is the method for success 
        // reject is the method for failure.



        or


        
        function foo() {
            return new Promise((resolve, reject) => {
                let result = getSomeResult();
                if (result)
                    resolve('Success');
                else
                    reject('Something went wrong');
            });
        }


    


    If a method returns a `promise`

        its calls should use the `then` 

        which takes `two methods` as input:

            one for `success` 
            the other for the `failure`.


    For Example:


        function asyncFunc(work) {

            return new Promise(function(resolve, reject) {
                if (work === "")
                    reject(Error("Nothing"));
                setTimeout(function() {
                    resolve(work);
                }, 1000);
            });
        }

        asyncFunc("Work 1")                 // ----- task I -----
        .then(function(result) {
            console.log(result);            // Work 1
            return asyncFunc("Work 2");     // ----- task II -----
        }, function(error) {
            console.log(error);
        })
        .then(function(result) {
            console.log(result);            // Work 2     
        }, function(error) {
            console.log(error);
        });

        console.log("End");


                            
        // Output:  End 
                    Work 1
                    Work 2 



    It also prints "End", "Work 1" and "Work 2" 
    (the work is done asynchronously). 
    
    But, this is clearly more readable than the previous example 
    and in more complex situations it is easier to work with.



    ---------------------------
    Iterators & Generators
    ---------------------------
    Symbol.iterator is the default iterator for an object. 
    
    The for...of loops are based on this type of iterator.

    In the example below, we will see how we should implement it 
    and how `generator functions` are used.

    Example:

            let myIterableObj = { 

                [Symbol.iterator] : function* () {
                    yield 1; 
                    yield 2; 
                    yield 3;
                }

            };

            console.log([...myIterableObj]);    // [ 1, 2, 3 ]


            First, we create an object, and use the Symbol.iterator 
            
            and `generator function` to fill it with some values.

    In the second line of the code, we use a * with the function keyword. 
            
    It's called a `generator function` (or `gen` function).

    For example, here is a simple case of how gen functions can be useful:


            function* idMaker() {

                let index = 0;

                while (index < 5)
                    yield index++;

            }
            var gen = idMaker();

            console.log(gen.next().value);
            console.log(gen.next().value);
            console.log(gen.next().value);
            console.log(gen.next().value);
            console.log(gen.next().value);

            // Try to add one more console.log, just like the above see what happens.


    We can exit and re-enter generator functions later. 

    Their variable bindings (context) will be saved across re-entrances. 
    
    They are a very powerful tool for asynchronous programming, 
    especially when combined with Promises. 
    
    They can also be useful for creating loops with special requirements.

    We can nest generator functions inside each other 
      to create more complex structures 
      and pass them arguments while we are calling them.

    The example below will show a useful case of 
    how we can use generator functions and Symbol.iterators together.

    Example:

            const arr = ['0', '1', '4', 'a', '9', 'c', '16'];
            const my_obj = {
            [Symbol.iterator]: function*() {
                for(let index of arr) {
                yield `${index}`;
                }
            }
            };

            const all = [...my_obj]             // Here you can replace the '[...my_obj]' with 'arr'. 
                .map(i => parseInt(i, 10))
                .map(Math.sqrt)
                .filter((i) => i < 5)               // try changing the value of 5 to 4 see what happens.
                .reduce((i, d) => i + d);           // comment this line while you are changing the value of the line above

            console.log(all);   // 10


    We create an object of 7 elements 
    by using `Symbol.iterator` and `generator functions` 

    In the second part, 
    we assign our object to a constant all. 
    
    At the end, we print its value.



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



    ---------------------------
    Built-in Methods
    ---------------------------
    ES6 also introduced new built-in methods to make several tasks easier. 
    Here we will cover the most common ones.


    Array Element Finding

    The legacy way to find the first element of an array 
    by its value and a rule was the following:


            let res = [4, 5, 1, 8, 2, 0].filter(function (x) {
                return x > 3;
            })[0];

            console.log(res);   // 4



    The new syntax is cleaner and more robust:

            let res = [4, 5, 1, 8, 2, 0].find(x => x > 3);

            console.log(res);   // 4



    You can also get the index of the item above by using the findIndex() method:   

            
            let res = [4, 5, 1, 8, 2, 0].findIndex(x => x > 3);

            console.log(res);   // 0


    Repeating Strings

        Before ES6 
        the following syntax was the correct way 
        to repeat a string multiple times:

            console.log(Array(3 + 1).join("foo"));



        With the new syntax, it becomes:

            console.log("foo".repeat(3));



    Searching Strings

    Before ES6 we only used the indexOf() method 
    to find the position of the text in the string. 
    
    For example:

            console.log("SoloLearn".indexOf("Solo") === 0);                     // true
            console.log("SoloLearn".indexOf("Solo") === (4 - "Solo".length));   // true
            console.log("SoloLearn".indexOf("loLe") !== -1);                    // true
            console.log("SoloLearn".indexOf("olo", 1) !== -1);                  // true
            console.log("SoloLearn".indexOf("olo", 2) !== -1);                  // false



    ES6 has replaced this with a version that 
    has cleaner and more simplified syntax:

    
            console.log("SoloLearn".startsWith("Solo", 0));     // true
            console.log("SoloLearn".endsWith("Solo", 4));       // true
            console.log("SoloLearn".includes("loLe"));          // true
            console.log("SoloLearn".includes("olo", 1));        // true
            console.log("SoloLearn".includes("olo", 2));        // false




    It is always a good practice to refactor your code
     with the new syntax to learn new things and make your code more understandable.


            const arr = ['3', '5', '8'];
            console.log(
                arr.find(x => x == 8).repeat(2)   // 88
            );


    



    Recap Examples:



            ------------------------------------------
                            if-else-for
            ------------------------------------------

            var countOfRooms = 15;
            // Your code here
            var floor  = 1;
            for(let i=1; i<=countOfRooms; i++) {

                if(i<13) {
                    console.log(floor);
                    floor ++;
                }
                    
                else if(i>=13) {
                    floor ++;
                    console.log(floor);
                }
            }



            ------------------------------------------
                        loop - break
            ------------------------------------------

            The snail climbs up 7 feet each day and slips back 2 feet each night.
            How many days will it take the snail to get out of a well with the given depth?

            function main() {
                var depth = parseInt(readLine(), 10);
                var distance=0;
                var day=0;
                while(true) {
                    day++;
                    distance += 7;
                    if(distance >= depth) {
                        console.log(day);
                        break;
                    } 
                    else {
                        distance -= 2;
                    }
                }
            }



  
            ------------------------------------------
                            switch case
            ------------------------------------------

            switch(themeNumber) {
                case 1:
                    console.log('Light');
                    break;
                case 2:
                    console.log('Dark');
                    break;
                case 3:
                    console.log('Nocturne');
                    break;
                case 4:
                    console.log('Terminal');
                    break;
                case 5:
                    console.log('Indigo');
                    break;
                default:
                    console.log('Light');
            }

            

            ------------------------------------------
                            class
            ------------------------------------------

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

            var x = new Add("hehe", "hoho", "haha", "hihi", "huhu");
            var y = new Add("this", "is", "awesome");
            var z = new Add("lorem", "ipsum", "dolor", "sit", "amet", "consectetur", "adipiscing", "elit");

            x.print();
            y.print();
            z.print();


            Output:

                $hehe$hoho$haha$hihi$huhu$
                $this$is$awesome$
                $lorem$ipsum$dolor$sit$amet$consectetur$adipiscing$elit$


    
    

*/




























