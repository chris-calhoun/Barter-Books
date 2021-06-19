import React from 'react';
import {
  Button,
} from 'reactstrap';

export default function FollowingCard({ user, viewBooks }) {
  return (
    <div className="find-friend-card">
      <div className='friend-img-container'>
        <img width="100%" src={user.imageUrl} alt={user.firstName} />
      </div>
      <p>{user.firstName} {user.lastName}</p>
      <Button id={user.id} onClick={() => viewBooks(user.id)} outline color="secondary">View Books</Button>
    </div>
  );
}
