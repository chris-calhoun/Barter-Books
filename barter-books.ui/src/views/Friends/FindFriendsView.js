import React, { useEffect, useState } from 'react';
// import UserData from '../../helpers/data/userData';
import AuthData from '../../helpers/data/authData';
import FindFriendsCard from '../../components/Cards/Friends/FindFriendsCard';
import FollowerData from '../../helpers/data/followerData';

export default function FindFriendsView() {
  const [users, setUsers] = useState();
  const currentUserId = AuthData.getUid();

  useEffect(() => {
    FollowerData.getPotentialFollowers(currentUserId).then((response) => {
      setUsers(response);
    });
  }, [currentUserId]);

  const followUser = (newFriendId) => {
    const followerObj = {
      UserId: AuthData.getUid(),
      FollowerId: newFriendId,
    };
    FollowerData.addFollower(followerObj);
    const remainingUsers = users.filter((user) => user.id !== newFriendId);

    setUsers(remainingUsers);
  };

  const renderUsers = () => (users?.map((user) => <FindFriendsCard key={user.id} user={user} followUser={followUser}/>));

  return (
    <div className="find-friend-container">
      <h2>Find Friends</h2>
      {users !== [] && <div className="find-friend-cards">{renderUsers()}</div>}
    </div>
  );
}
