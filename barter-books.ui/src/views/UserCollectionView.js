import React, { useState, useEffect } from 'react';
import CollectionData from '../helpers/data/collectionData';

export default function UserCollectionView(user) {
  const [userHasACollection, setUserHasACollection] = useState(false);

  useEffect(() => {
    CollectionData.getUserCollection(user.Id).then((response) => {
      if (response) {
        setUserHasACollection(true);
      } else {
        setUserHasACollection(false);
      }
    });
  });

  return (
    <div>
      <h1>User Books View</h1>
      {!userHasACollection
      && <h2>no collection</h2>}
      {userHasACollection
      && <h2>User has a collection</h2>}
    </div>
  );
}
