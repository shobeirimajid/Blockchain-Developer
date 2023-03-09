import { Outlet, Link } from "react-router-dom";
//import { useLocation } from 'react-router-dom'

const Layout = () => {

  //const location = useLocation();
  //console.log(location.pathname);

  return (
    <>
      <nav className="navigation">
          <ul id="navbar">
            <li>
                <Link  to="/">Home</Link>
            </li>
            <li>
                <Link to="/galery">Galery</Link>
            </li>
            <li>
                <Link to="/order">Order</Link>
            </li>
          </ul>
      </nav>

      <Outlet />
    </>
  )
};

export default Layout;