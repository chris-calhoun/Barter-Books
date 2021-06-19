import React, { useEffect, useState } from 'react';
import AuthData from '../../helpers/data/authData';
import FollowingCard from '../../components/Cards/Friends/FollowingCard';
import FollowerData from '../../helpers/data/followerData';

export default function FollowingView({ props }) {
  const [users, setUsers] = useState();
  const currentUserId = AuthData.getUid();

  useEffect(() => {
    FollowerData.getUserFollowing(currentUserId).then((response) => {
      setUsers(response);
    });
  }, [currentUserId]);

  const navigateToFriendsBooks = (userId) => {
    props.history.push({
      pathname: `/friends-books/${userId}`,
    });
  };

  const renderFollowing = () => (users?.map((user) => <FollowingCard key={user.id} user={user} viewBooks={navigateToFriendsBooks}/>));

  return (
    <div className="find-friend-container">
      <h2>Following</h2>
      {users !== [] && <div className="find-friend-cards">{renderFollowing()}</div>}
    </div>
  );
}
