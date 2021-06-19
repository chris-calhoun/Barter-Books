import React, { useState, useEffect } from 'react';
import CollectionData from '../helpers/data/collectionData';
import BookData from '../helpers/data/bookData';
import UserBookCard from '../components/Cards/Books/UserBookCard';

export default function UserCollectionView(props) {
  const [collectionDescription, setCollectionDescription] = useState();
  const [collectionBooks, setCollectionBooks] = useState(null);

  useEffect(() => {
    console.warn(props.user.uid);
    CollectionData.getUserCollection(props.user.uid).then((response) => {
      setCollectionDescription(response.description);
    });
    BookData.getBooksFromCollection(props.user.uid).then((response) => {
      setCollectionBooks(response);
    });
  }, [props.user.uid, collectionDescription]);

  const renderBooks = () => (
    collectionBooks.map((book) => (book.volumeInfo.imageLinks !== undefined && <UserBookCard key={book.id} bookData={book} />))
  );

  return (
    <div>
      <h1>User Books View</h1>
      {collectionDescription}
      {renderBooks}
    </div>
  );
}
