import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import {
  Collapse,
  Navbar,
  NavbarToggler,
  Nav,
  NavItem,
} from 'reactstrap';
import Auth from '../Auth';
import SearchBar from '../SearchBar';

export default function MyNavbar(props) {
  const { user } = props;
  const [isOpen, setIsOpen] = useState(false);
  const toggle = () => setIsOpen(!isOpen);

  return (
    <div>
      <Navbar
        color='light'
        light
        expand='md'
        className='justify-content-between'>
        <Link className='navbar-brand' to='/'>
          Barter Books
        </Link>
        <NavbarToggler onClick={toggle} />
        <Collapse isOpen={isOpen} navbar>
          <Nav className='mr-auto' navbar>
            <SearchBar />
            <NavItem>
              <Link className="nav-link" to='/'>
                Home
              </Link>
            </NavItem>
            <NavItem>
              <Link className="nav-link" to='/my-books'>
                My Books
              </Link>
            </NavItem>
            <NavItem>
              <Link className="nav-link" to='/friends'>
                Friends
              </Link>
            </NavItem>
            {/* <NavItem>
              <Link className="nav-link" to='/about'>
                About
              </Link>
            </NavItem> */}
            <Auth className="auth" user={user} />
          </Nav>
        </Collapse>
      </Navbar>
    </div>
  );
}
