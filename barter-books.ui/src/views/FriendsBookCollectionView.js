import React, { useState, useEffect } from 'react';
import CollectionData from '../helpers/data/collectionData';
import BookData from '../helpers/data/bookData';
import FriendBookCard from '../components/Cards/Books/FriendBookCard';
import UserData from '../helpers/data/userData';

export default function FriendsBookCollectionView(props) {
  const [collectionDescription, setCollectionDescription] = useState();
  const [collectionBooks, setCollectionBooks] = useState([]);
  const [userDetails, setUserDetails] = useState([]);

  useEffect(() => {
    CollectionData.getUserCollection(props.match.params.id).then((response) => {
      setCollectionDescription(response.description);
    });
    BookData.getBooksFromCollection(props.match.params.id).then((response) => {
      setCollectionBooks(response);
    });
    UserData.getSingleUser(props.match.params.id).then((response) => {
      console.warn(response);
      setUserDetails(response);
    });
  }, [props.match.params.id, collectionDescription]);

  const renderBooks = () => (
    collectionBooks.map((book) => (<FriendBookCard key={book.id} bookData={book} />))
  );

  return (
    <div>
      <h1>{userDetails.firstName}'s Books</h1>
      {collectionDescription}
      <div className='my-books-container'>
        {collectionBooks !== []
        && <div className='my-books-cards'>{renderBooks()}</div>}
      </div>
    </div>
  );
}
