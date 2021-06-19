import React, { useState, useEffect } from 'react';
import RecentlyAddedBooksCard from '../components/Cards/Books/bookRecentlyAddedCard';
import BookData from '../helpers/data/bookData';

export default function HomeView(props) {
  const [addedBooks, setAddedBooks] = useState([]);

  useEffect(() => {
    BookData.getRecentlyAddedBooks(props.user.uid).then((response) => {
      setAddedBooks(response);
    });
  }, [props.user.uid]);

  const renderBooks = () => (
    addedBooks.map((book) => (<RecentlyAddedBooksCard key={book.id} bookData={book}/>))
  );

  return (
    <div className='home'>
      <h1>Timeline</h1>
      <div className='added-books-container'>
        {addedBooks !== []
        && <div className='added-books-cards'>{renderBooks()}</div>}
      </div>
    </div>
  );
}
