import React from 'react';
import firebase from 'firebase/app';
import { BrowserRouter as Router } from 'react-router-dom';
import fbConnection from '../helpers/data/fbConnection';
import MyNavbar from '../components/MyNavbar';
import Routes from '../helpers/Routes';
import LoginView from '../views/LoginView';
import '../styles/App.scss';

fbConnection();

class App extends React.Component {
  state = {
    user: null,
  };

  componentDidMount() {
    this.removeListener = firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        user
          .getIdToken()
          .then((token) => sessionStorage.setItem('token', token));
        this.setState({ user });
      } else {
        this.setState({ user: false });
      }
    });
  }

  componentWillUnmount() {
    this.removeListener();
  }

  render() {
    const { user } = this.state;
    const loadComponent = () => {
      let component = '';
      if (user) {
        component = <>
          <MyNavbar user={user} />
          <Routes user={user} />
        </>;
      } else {
        component = <LoginView />;
      }
      return component;
    };

    return (
      <div className='App'>
        <Router>
          {loadComponent()}
        </Router>
      </div>
    );
  }
}

export default App;
