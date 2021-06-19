import React, { useEffect, useState } from 'react';
import AuthData from '../../helpers/data/authData';
import FollowerCard from '../../components/Cards/Friends/FollowerCard';
import FollowerData from '../../helpers/data/followerData';

export default function FollowingView() {
  const [users, setUsers] = useState();
  const currentUserId = AuthData.getUid();

  useEffect(() => {
    FollowerData.getUserFollowing(currentUserId).then((response) => {
      setUsers(response);
    });
  }, [currentUserId]);

  const renderFollowing = () => (users?.map((user) => <FollowerCard key={user.id} user={user}/>));

  return (
    <div className="find-friend-container">
      <h2>Following</h2>
      {users !== [] && <div className="find-friend-cards">{renderFollowing()}</div>}
    </div>
  );
}
