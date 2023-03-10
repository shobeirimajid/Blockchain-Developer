////////////////////////////////////////////////////////////////
//                   Styling React Using CSS
////////////////////////////////////////////////////////////////

// What is Sass

// Sass is a CSS pre-processor.

// Sass files are executed on the server and sends CSS to the browser.

// You can learn more about Sass in our Sass Tutorial.
// https://www.w3schools.com/sass/default.php




//----------------------------
//  Can I use Sass?
//----------------------------

// If you use the create-react-app in your project, 
// you can easily install and use Sass in your React projects.

// Install Sass by running this command in your terminal:

//          npm i sass

// Now you are ready to include Sass files in your project!


//----------------------------
//  Create a Sass file
//----------------------------

// Create a Sass file the same way as you create CSS files, 
// but Sass files have the file extension .scss

// Import the Sass file the same way as you imported a CSS file

// In Sass files you can use variables and other Sass functions



// Example


// my-style.scss
// Create a variable to define the color of the text
$myColor: red;

h1 {
  color: $myColor;
}


// index.js:
import React from 'react';
import ReactDOM from 'react-dom/client';
import './my-style.scss';

const Header = () => {
  return (
    <>
      <h1>Hello Style!</h1>
      <p>Add a little style!.</p>
    </>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Header />);

