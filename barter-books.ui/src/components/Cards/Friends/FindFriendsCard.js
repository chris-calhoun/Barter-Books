import React from 'react';
import {
  Button,
} from 'reactstrap';

export default function FindFriendsCard({ user, followUser }) {
  // console.warn(user);
  return (
    <div className="find-friend-card">
      <div className='friend-img-container'>
        <img width="100%" src={user.imageUrl} alt={user.firstName} />
      </div>
      <p>{user.firstName} {user.lastName}</p>
      <Button id={user.id} onClick={(e) => followUser(e.target.id)} outline color="secondary">Follow</Button>
    </div>
  );
}
