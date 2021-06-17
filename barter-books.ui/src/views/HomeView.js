import React from 'react';
import Loader from '../components/Loader';
import RecentlyAddedBooks from '../components/Cards/Books/bookRecentlyAddedCard';
import LoginView from './LoginView';

export default function HomeView(props) {
  const loadComponent = () => {
    let component = '';
    if (props.user === null) {
      component = <Loader />;
    } else if (props.user) {
      component = <RecentlyAddedBooks />;
    } else {
      component = <LoginView />;
    }
    return component;
  };

  return (
    <div className='home'>
      <h1>Home View</h1>
      {loadComponent()}
    </div>
  );
}
