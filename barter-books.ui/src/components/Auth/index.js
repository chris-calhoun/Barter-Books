import React, { Component } from 'react';
import 'firebase/auth';
import {
  UncontrolledDropdown,
  DropdownToggle,
  DropdownMenu,
  DropdownItem,
} from 'reactstrap';
import AuthData from '../../helpers/data/authData';

export default class Auth extends Component {
  render() {
    const { user } = this.props;
    return (
      <>
      {/* if not logged in, show login button */}
        { !user ? <button className='nav-link btn btn-primary' onClick={(e) => AuthData.loginClickEvent(e)}>Login</button>
        // else show user image and dropdown caret with logout button and name
          : <>
              <img className="userInfo" src={user?.photoURL} alt={user?.displayName} />
              <UncontrolledDropdown>
              <DropdownToggle nav caret>
              </DropdownToggle>
            <DropdownMenu right>
            <DropdownItem>
              {user?.displayName}
              </DropdownItem>
              <DropdownItem>
                <div
                  className='nav-link btn btn-danger'
                  onClick={(e) => AuthData.logoutClickEvent(e)}
                >
                  Logout
                </div>
              </DropdownItem>
            </DropdownMenu>
          </UncontrolledDropdown>
        </>
        }
        </>
    );
  }
}
