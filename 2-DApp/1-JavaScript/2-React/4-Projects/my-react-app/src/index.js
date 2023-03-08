import React from 'react';
import ReactDOM from 'react-dom/client';

import './style/style.css';

import Header from './Components/Header';
//import Garage from './Components/Garage';
//import MainPage from './Components/MainPage';
import Order from './Components/Order';
import Footer from './Components/Footer';


const header = ReactDOM.createRoot(document.getElementById('header'));
const root = ReactDOM.createRoot(document.getElementById('root'));
const footer = ReactDOM.createRoot(document.getElementById('footer'));


header.render(
  <React.StrictMode>
    <Header />
  </React.StrictMode>
);

/*root.render(
  <React.StrictMode>
    <MainPage />
  </React.StrictMode>
);*/

root.render(
  <React.StrictMode>
    <Order />
  </React.StrictMode>
);

/*root.render(
  <React.StrictMode>
    <Garage />
  </React.StrictMode>
);*/

footer.render(
  <React.StrictMode>
    <Footer />
  </React.StrictMode>
);