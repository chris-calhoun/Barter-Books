import React, { useEffect, useState } from 'react';
import UserData from '../../helpers/data/userData';
import AuthData from '../../helpers/data/authData';

export default function FindFriendsView() {
  const [users, setUsers] = useState();

  useEffect(() => {
    UserData.getAllUsers().then((response) => {
      setUsers(response.filter((user) => user.id !== AuthData.getUid()));
    });
  }, []);

  const renderUsers = () => (users?.map((user) => <p key={user.id} >{user.firstName}</p>));

  return (
    <div>
      <h2>Find Friends</h2>
      {renderUsers()}
    </div>
  );
}
