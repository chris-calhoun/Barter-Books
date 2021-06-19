import React, { useState } from 'react';
import {
  Button,
} from 'reactstrap';

export default function FriendsView(props) {
  const [view, setView] = useState('find-friends-btn');

  let component = '';
  switch (view) {
    case 'find-friends-btn':
      component = (
      <>
        <h2>find friends</h2>
      </>);
      break;
    case 'followers-btn':
      component = (
      <>
        <h2>followers</h2>
      </>);
      break;
    case 'following-btn':
      component = (
      <>
        <h2>find friends</h2>
      </>);
      break;
    default:
      console.warn('view not found.');
  }

  return (
    <div className="friends-view">
      <div className="friend-buttons">
        <div className="find-friends">
          <Button id="find-friends-btn" onClick={(e) => setView(e.target.id)} outline color="primary">find friends</Button>
        </div>
        <div className="followers">
          <Button id="followers-btn" onClick={(e) => setView(e.target.id)} outline color="primary">followers</Button>
        </div>
        <div className="following">
          <Button id="following-btn" onClick={(e) => setView(e.target.id)} outline color="primary">following</Button>
        </div>
      </div>
      <div className="user-cards">
        <h2>user cards will go here</h2>
        {component}
      </div>
    </div>
  );
}
