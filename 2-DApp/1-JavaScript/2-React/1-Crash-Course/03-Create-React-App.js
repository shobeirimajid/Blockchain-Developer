/////////////////////////////////////////////////////////////////
//                   Setting up a React Environment
/////////////////////////////////////////////////////////////////

// To learn and test React, you should set up a `React Environment` on your computer.
// Here we'll uses the `create-react-app`

// The `create-react-app` tool is an officially supported way to create React applications.


//--------------------------
//  Pre-requirements
//--------------------------
/*

1-  Node.js
    Node.js is required to use `create-react-app`
    You will need Node.js server setup on your machine
    https://nodejs.org/
    node -v   (v18.13.0)

2-  npm
    the default package manager for the JavaScript runtime environment Node.js. 
    Node installation comes with npm package manager as well, 
    npm -v    (9.4.0)

3-  npx
    npx is required to use `create-react-app`
    npx package should be installed by default when you install Node.js
    npx -v    (9.4.0)
    if it says that the command is unknown, you can install it globally using :
    npm i -g npx

4-  IDE
    Integrated development environment 
    IDE is the software we will use to help use write our code.
    Visual Studio Code (VSCode)
    https://code.visualstudio.com/

*/


//--------------------------
//  Create React App
//--------------------------

// you can create a React application by using   `create-react-app`
// `create-react-app`  will set up everything you need to run a React application.
// Open your terminal in the directory you would like to create your application.
// Run this command to create a React application named `my-app` :

//          npx create-react-app my-app


// Note: If you've previously installed create-react-app globally, 
// it is recommended that you uninstall the package 
// to ensure npx always uses the latest version of create-react-app. 
// To uninstall, run this command: 

//          npm uninstall -g create-react-app



// If you will the react project support Typescript
// you can choose the appropriate template

//          npx create-react-app my-app --template typescript

// this will create a new directory "my-app" 
// with React project inside, that supports Typescript.


// This may take a while, so be patient. 
// After a while our setup should go through and you should see it when it is done.


//----------------------------
// Run the React Application
//----------------------------

// Now you are ready to run your first real React application!

// Run this command to move to the my-react-app directory:
//          cd my-react-app

// Run this command to execute the React application my-react-app:
//          npm start

// A new browser window will pop up with your newly created React App! 
// If not, open your browser and type localhost:3000 in the address bar.



//----------------------------
// Modify the React Application
//----------------------------

// So far so good, but how do I change the content?

// Look in the my-react-app directory, and you will find a src folder. 
// Inside the src folder there is a file called  `App.js`
// open it and it will look like this:


import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;


// Try changing the HTML content and save the file.

// Notice that the changes are visible immediately after you save the file, 
// you do not have to reload the browser!

// Example
// Replace all the content inside the <div className="App"> with a <h1> element.
// See the changes in the browser when you click Save.

function App() {
  return (
    <div className="App">
      <h1>Hello World!</h1>
    </div>
  );
}

export default App;


// Notice that we have removed the imports we do not need (logo.svg and App.css).




//----------------------------
// What's Next?
//----------------------------

// Now you have a React Environment on your computer, 
// and you are ready to learn more about React.

// In the rest of this tutorial we will use our "Show React" tool 
// to explain the various aspects of React, and how they are displayed in the browser.

// If you want to follow the same steps on your computer, 
// start by stripping down the src folder to only contain one file: index.js. 

// You should also remove any unnecessary lines of code inside the index.js file 
// to make them look like the example in the "Show React" tool below:

import React from 'react';
import ReactDOM from 'react-dom/client';

const myFirstElement = <h1>Hello React!</h1>

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(myFirstElement);


