////////////////////////////////////////////////////////////////
//                        React Router
////////////////////////////////////////////////////////////////

// `Create React App` is the best way to start building a `single-page` application in React

// `Create React App` doesn't include page routing.

// `React Router` is the most popular solution for building `multiple-page` applications



//----------------------
//  Add React Router
//----------------------

// To add React Router in your application, 
// in the terminal from the root directory of the application
// run this command :
//      npm i -D react-router-dom

// Note: This tutorial uses React Router v6.
// If you are upgrading from v5, you will need to use the @latest flag:

//      npm i -D react-router-dom@latest



//----------------------
//  Folder Structure
//----------------------

// To create an application with multiple page routes, 
// let's first start with the file structure.

// Within the src folder, we'll create a folder named pages with several files:

    //  src\pages\:
    //      Layout.js
    //      Home.js
    //      Blogs.js
    //      Contact.js
    //      NoPage.js

// Each file will contain a very basic React component.




//----------------------
// Basic Usage
//----------------------

// Now we will use our Router in our index.js file.


// Example:
// Use React Router to route to pages based on URL

// index.js:
import ReactDOM from "react-dom/client";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Layout from "./pages/Layout";
import Home from "./pages/Home";
import Blogs from "./pages/Blogs";
import Contact from "./pages/Contact";
import NoPage from "./pages/NoPage";

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<Home />} />
          <Route path="blogs" element={<Blogs />} />
          <Route path="contact" element={<Contact />} />
          <Route path="*" element={<NoPage />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);






