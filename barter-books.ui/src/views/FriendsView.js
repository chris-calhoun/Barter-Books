import React from 'react';
import {
  Button,
} from 'reactstrap';

export default function FriendsView() {
  return (
    <div className="friends-view">
      <div className="friend-buttons">
        <div className="find-friends">
          <Button outline color="primary">find friends</Button>
        </div>
        <div className="followers">
          <Button outline color="primary">followers</Button>
        </div>
        <div className="following">
          <Button outline color="primary">following</Button>
        </div>
      </div>
      <div className="user-cards">
        <h2>user cards will go here</h2>
      </div>
    </div>
  );
}
