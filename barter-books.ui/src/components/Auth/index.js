import React, { Component } from 'react';
import 'firebase/auth';
import {
  UncontrolledDropdown,
  DropdownToggle,
  DropdownMenu,
  DropdownItem,
  Button,
} from 'reactstrap';
import AuthData from '../../helpers/data/authData';

export default class Auth extends Component {
  render() {
    const { user } = this.props;
    return (
      <>
      {/* if not logged in, show login button */}
        { !user ? <Button color='primary' onClick={(e) => AuthData.loginClickEvent(e)}>Login</Button>
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
                <Button color='danger' onClick={(e) => AuthData.logoutClickEvent(e)}>Logout</Button>
              </DropdownItem>
            </DropdownMenu>
          </UncontrolledDropdown>
        </>
        }
        </>
    );
  }
}
