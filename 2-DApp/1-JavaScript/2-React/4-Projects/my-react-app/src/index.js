import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter, Routes, Route } from "react-router-dom";

import Header from './Components/Header';
import Footer from './Components/Footer';
import Layout from './Components/Layout';
import Home from './Components/Home';
import Galery from './Components/Galery';
import Order from './Components/Order';
import NoPage from './Components/NoPage';

import './style/style.css';


function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<Home />} />
          <Route path="galery" element={<Galery />} />
          <Route path="order" element={<Order />} />
          <Route path="*" element={<NoPage />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;

const header = ReactDOM.createRoot(document.getElementById('header'));
const root = ReactDOM.createRoot(document.getElementById('root'));
const footer = ReactDOM.createRoot(document.getElementById('footer'));


header.render(
  <React.StrictMode>
    <Header />
  </React.StrictMode>
);

root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

footer.render(
  <React.StrictMode>
    <Footer />
  </React.StrictMode>
);