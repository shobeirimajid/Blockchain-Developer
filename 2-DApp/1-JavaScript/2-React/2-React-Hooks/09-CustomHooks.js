-////////////////////////////////////////////////////////////////
//                    React useMemo Hook
////////////////////////////////////////////////////////////////

// Hooks are reusable functions

// When you have component logic that needs to be used by multiple components, 
// we can extract that logic to a custom Hook

// Custom Hooks start with "use"
// Ex. useFetch



//----------------------------
//  JSONPlaceholder
//----------------------------
// We will use the JSONPlaceholder service to fetch fake data. 
// This service is great for testing applications when there is no existing data.
// To learn more, check out the JavaScript Fetch API section.
// https://www.w3schools.com/js/js_api_fetch.asp




//----------------------------
//  Example 1
//----------------------------
// In the following code, we are fetching data in our Home component and displaying it.
// We use the JSONPlaceholder service to fetch fake "todo" items and display the titles on the page


// index.js:

import { useState, useEffect } from "react";
import ReactDOM from "react-dom/client";

const Home = () => {

  const [data, setData] = useState(null);

  useEffect(() => {
    fetch("https://jsonplaceholder.typicode.com/todos")
      .then((res) => res.json())
      .then((data) => setData(data));
 }, []);

  return (
    <>
      {data &&
        data.map((item) => {
          return <p key={item.id}>{item.title}</p>;
        })}
    </>
  );
};


const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Home />);




//----------------------------
//  Example 2
//----------------------------
// The fetch logic may be needed in other components as well, 
// so we will extract that into a custom Hook.



//---------------
// useFetch.js
//---------------
// Move the fetch logic to a new file to be used as a custom Hook

// We have created a new file called  `useFetch.js `
// containing a function called `useFetch` 
// which contains all of the logic needed to fetch our data.

// We removed the hard-coded URL 
// and replaced it with a url variable 
// that can be passed to the custom Hook.

// Lastly, we are returning our data from our Hook.


import { useState, useEffect } from "react";


const useFetch = (url) => {

  const [data, setData] = useState(null);

  useEffect(() => {
    fetch(url)
      .then((res) => res.json())
      .then((data) => setData(data));
  }, [url]);

  return [data];
};

export default useFetch;



//---------------
// index.js
//---------------
// we are importing our useFetch Hook in `index.js`
// and utilizing it like any other Hook. 
// This is where we pass in the URL to fetch data from.
// Now we can reuse this custom Hook in any component to fetch data from any URL.

import ReactDOM from "react-dom/client";
import useFetch from "./useFetch";

const Home = () => {

  const [data] = useFetch("https://jsonplaceholder.typicode.com/todos");

  return (
    <>
      {
        data &&
        data.map((item) => {
          return <p key={item.id}>{item.title}</p>;
        })
      }
    </>
  );
};

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Home />);