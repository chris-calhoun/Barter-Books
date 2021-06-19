import React, { useState, useEffect } from 'react';
import CollectionData from '../helpers/data/collectionData';
import BookData from '../helpers/data/bookData';
import UserBookCard from '../components/Cards/Books/UserBookCard';

export default function UserCollectionView(props) {
  const [collectionDescription, setCollectionDescription] = useState();
  const [collectionBooks, setCollectionBooks] = useState([]);

  useEffect(() => {
    CollectionData.getUserCollection(props.user.uid).then((response) => {
      setCollectionDescription(response.description);
    });
    BookData.getBooksFromCollection(props.user.uid).then((response) => {
      setCollectionBooks(response);
    });
  }, [props.user.uid, collectionDescription]);

  const deleteBook = (bookId) => {
    BookData.deleteBook(bookId);
    const remainingBooks = collectionBooks.filter((book) => book.id !== bookId);
    setCollectionBooks(remainingBooks);
  };

  const renderBooks = () => (
    collectionBooks.map((book) => (<UserBookCard key={book.id} bookData={book} deleteBook={deleteBook} />))
  );

  return (
    <div>
      <h1>User Books View</h1>
      {collectionDescription}
      <div className='my-books-container'>
        {collectionBooks !== []
        && <div className='my-books-cards'>{renderBooks()}</div>}
      </div>
    </div>
  );
}
