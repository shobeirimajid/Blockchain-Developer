/////////////////////////////////////////////////////////////////
//                           React 
/////////////////////////////////////////////////////////////////


//-------------------------------
// What is React
//-------------------------------
// React is a JavaScript `library`
// created by Facebook
// React is a tool for building user interfaces (UI).
// React allows us to create `reusable` UI components.
// React is used to build `single-page` applications.




//-------------------------------
// What You Should Already Know
//-------------------------------
// Before starting with React.JS
// you should have intermediate experience in:

//      HTML
//      CSS
//      JavaScript
//      ECMAScript 6 (ES6)



//-------------------------------
// React `Hello World`
//-------------------------------

import React from 'react';
import ReactDOM from 'react-dom/client';

function Hello(props) {
  return <h1>Hello World!</h1>;
}

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<Hello />);



//--------------------------
// How does React Work?
//--------------------------
// React creates a VIRTUAL DOM in memory.
// Instead of manipulating the browser's DOM directly, React creates a virtual DOM in memory, 
// where it does all the necessary manipulating, before making the changes in the browser DOM.

// React only changes what needs to be changed!
// React finds out what changes have been made, and changes only what needs to be changed.
// You will learn the various aspects of how React does this in the rest of this tutorial.



//--------------------------
// React.JS History
//--------------------------

// Initial Release to the Public (V0.3.0) was in July 2013.
// React.JS was first used in 2011 for Facebook's Newsfeed feature.
// Facebook Software Engineer, Jordan Walke, created it.
// Current version of React.JS is V18.2.0 (March 2023).
// https://reactjs.org/versions/

// create-react-app includes built tools such as webpack, Babel, and ESLint.
// Current version of create-react-app is v5.0.1 (March 2023).
// https://github.com/facebook/create-react-app/releases
