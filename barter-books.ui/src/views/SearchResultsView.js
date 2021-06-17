import React, { useState, useEffect } from 'react';
import BookData from '../helpers/data/bookData';
import BookSearchCard from '../components/Cards/Books/bookSearchCard';

export default function SearchResultsView(props) {
  const [books, setBooks] = useState([]);
  const searchText = props.match.params.term;

  useEffect(() => {
    BookData.getSearchedBooks(searchText).then((response) => {
      setBooks(response);
    });
  }, [searchText]);

  const renderBooks = () => (
    books.map((book) => (book.volumeInfo.imageLinks !== undefined && <BookSearchCard key={book.id} bookData={book} />))
  );

  return (
    <div>
      <h1>Search results for</h1>
      <h5>{searchText}</h5>
      <div className='search-results-container'>
        {books !== [] && <div className='search-results-cards'>{renderBooks()}</div>}
      </div>
    </div>
  );
}
