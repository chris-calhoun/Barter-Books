import React, { useEffect, useState } from 'react';
import UserData from '../../helpers/data/userData';
import AuthData from '../../helpers/data/authData';
import FindFriendsCard from '../../components/Cards/Friends/FindFriendsCard';

export default function FindFriendsView() {
  const [users, setUsers] = useState();

  useEffect(() => {
    UserData.getAllUsers().then((response) => {
      setUsers(response.filter((user) => user.id !== AuthData.getUid()));
    });
  }, []);

  const followUser = (newFriendId) => {
    console.warn(newFriendId);
  };

  const renderUsers = () => (users?.map((user) => <FindFriendsCard key={user.id} user={user} followUser={followUser}/>));

  return (
    <div className="find-friend-container">
      <h2>Find Friends</h2>
      <div className="find-friend-cards">{renderUsers()}</div>
    </div>
  );
}
