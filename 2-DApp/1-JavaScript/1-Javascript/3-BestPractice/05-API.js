///////////////////////////////////////////////////////
//                     API
///////////////////////////////////////////////////////
/*

API stands for Application Programming Interface

APIs:
    Web API             -   an application programming interface for the Web.
    Browser API         -   can extend the functionality of a web browser.
    Server API          -   can extend the functionality of a web server.


Third Party APIs
are not built into your browser.  
to use these APIs, you will have to download the code from the Web.

Examples:

    YouTube API - Allows you to display videos on a web site.
    Twitter API - Allows you to display Tweets on a web site.
    Facebook API - Allows you to display Facebook info on a web site.
*/




//-----------------------------
// Web Form API
//-----------------------------

https://www.w3schools.com/js/js_validation_api.asp

/*

JavaScript Validation API

If an input field contains invalid data, display a message:



Constraint Validation DOM Methods

Property	            Description
-------------------     --------------------------------------------------------
checkValidity()	        Returns true if an input element contains valid data.
setCustomValidity()	    Sets the validationMessage property of an input element.

*/

function myFunction() {

    const inpObj = document.getElementById("id1");

    if (!inpObj.checkValidity()) {
      document.getElementById("demo").innerHTML = inpObj.validationMessage;
    }
}



//------------------------------
// Web History API
//------------------------------

https://www.w3schools.com/js/js_api_history.asp

// The Web History API provides easy methods to access the windows.history object.
// The window.history object contains the URLs (Web Sites) visited by the user.



//------------------------------
// Web Storage API
//------------------------------

// The Web Storage API is a simple syntax for storing and retrieving data in the browser. 


// localStorage
    https://www.w3schools.com/jsref/prop_win_localstorage.asp

localStorage.setItem("name", "John Doe");
localStorage.getItem("name");


// sessionStorage 
    https://www.w3schools.com/jsref/prop_win_sessionstorage.asp

// The sessionStorage object is identical to the localStorage object.
// The difference is that the sessionStorage object stores data for one session.
// The data is deleted when the browser is closed.

sessionStorage.setItem("name", "John Doe");
sessionStorage.getItem("name");


/*

Storage Object Properties and Methods

Property/Method	            Description
----------------------      -----------------------------------------------------------------------
key(n)	                    Returns the name of the nth key in the storage
length	                    Returns the number of data items stored in the Storage object
getItem(keyname)	        Returns the value of the specified key name
setItem(keyname, value)	    Adds a key to the storage, or updates a key value (if it already exists)
removeItem(keyname)	        Removes that key from the storage
clear()	                    Empty all key out of the storage

*/




//------------------------------
// Web Workers API
//------------------------------

https://www.w3schools.com/js/js_api_web_workers.asp

// A web worker is a JavaScript running in the background, without affecting the performance of the page.

// When executing scripts in an HTML page, the page becomes unresponsive until the script is finished.
// A web worker is a JavaScript that runs in the background, independently of other scripts, 
// without affecting the performance of the page. 

// You can continue to do whatever you want while the web worker runs in the background: 

//  clicking
//  selecting things
//  etc.



//------------------------------
// Web Geolocation API
//------------------------------

https://www.w3schools.com/js/js_api_geolocation.asp

// Locate the User's Position


// The HTML Geolocation API is used to get the geographical position of a user.

// Since this can compromise privacy, the position is not available unless the user approves it.


// Geolocation is most accurate for devices with GPS, like smartphones.
// The Geolocation API will only work on secure contexts such as HTTPS.




//------------------------------
// JavaScript Fetch API
//------------------------------

// The Fetch API interface allows web browser to make HTTP requests to web servers.
// 😀 No need for XMLHttpRequest anymore.


// Fetch API Example


//-----------------
// fetch a file and displays the content
//-----------------

fetch(file)
.then(x => x.text())
.then(y => myDisplay(y));

// Since Fetch is based on async and await, the example above might be easier to understand like this:

async function getText(file) {
    let x = await fetch(file);
    let y = await x.text();
    myDisplay(y);
}

// Or even better: Use understandable names instead of x and y:

async function getText(file) {
    let myObject = await fetch(file);
    let myText = await myObject.text();
    myDisplay(myText);
}


//-------------
// fetch and show a logo image 
//-------------

let response = await fetch('/article/fetch/logo-fetch.svg');

let blob = await response.blob(); // download as Blob object

// create <img> for it
let img = document.createElement('img');
img.style = 'position:fixed;top:10px;left:10px;width:100px';
document.body.append(img);

// show it
img.src = URL.createObjectURL(blob);

setTimeout(() => { // hide after three seconds
  img.remove();
  URL.revokeObjectURL(img.src);
}, 3000);