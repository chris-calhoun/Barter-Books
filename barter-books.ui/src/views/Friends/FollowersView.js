import React, { useEffect, useState } from 'react';
import AuthData from '../../helpers/data/authData';
import FollowerCard from '../../components/Cards/Friends/FollowerCard';
import FollowerData from '../../helpers/data/followerData';

export default function FollowersView() {
  const [users, setUsers] = useState();
  const currentUserId = AuthData.getUid();

  useEffect(() => {
    FollowerData.getUserFollowers(currentUserId).then((response) => {
      // console.warn(response);
      setUsers(response);
    });
  }, [currentUserId]);

  const renderFollowers = () => (users?.map((user) => <FollowerCard key={user.id} user={user}/>));

  return (
    <div className="find-friend-container">
      <h2>Followers</h2>
      {users !== [] && <div className="find-friend-cards">{renderFollowers()}</div>}
    </div>
  );
}
