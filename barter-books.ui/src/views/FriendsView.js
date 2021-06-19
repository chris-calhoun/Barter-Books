import React, { useState } from 'react';
import {
  Button,
} from 'reactstrap';
import FindFriendsView from './Friends/FindFriendsView';
import FollowersView from './Friends/FollowersView';
import FollowingView from './Friends/FollowingView';

export default function FriendsView() {
  const [view, setView] = useState('find-friends-btn');

  let component = '';
  switch (view) {
    case 'find-friends-btn':
      component = (<FindFriendsView />);
      break;
    case 'followers-btn':
      component = (<FollowersView />);
      break;
    case 'following-btn':
      component = (<FollowingView />);
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
        {component}
    </div>
  );
}
