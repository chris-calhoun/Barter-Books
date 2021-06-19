import React from 'react';

export default function FollowingCard({ user }) {
  // console.warn(user);
  return (
    <div className="find-friend-card">
      <div className='friend-img-container'>
        <img width="100%" src={user.imageUrl} alt={user.firstName} />
      </div>
      <p>{user.firstName} {user.lastName}</p>
    </div>
  );
}
