import React, { useState, useEffect } from 'react';
import BookData from '../helpers/data/bookData';
import BookSearchCard from '../components/Cards/Books/bookSearchCard';
import CollectionData from '../helpers/data/collectionData';

export default function SearchResultsView(props) {
  const [books, setBooks] = useState([]);
  const [collection, setCollection] = useState([]);
  const searchText = props.match.params.term;

  useEffect(() => {
    BookData.getSearchedBooks(searchText).then((response) => {
      setBooks(response);
    });
    CollectionData.getUserCollection(props.user.uid).then((response) => {
      setCollection(response);
    });
  }, [searchText, props.user.uid]);

  const addBook = (bookData) => {
    const bookObj = {
      CollectionId: collection.id,
      Name: bookData.volumeInfo.title,
      Image: bookData.volumeInfo.imageLinks.thumbnail,
      Author: bookData.volumeInfo.authors.join(', '),
      PublishDate: bookData.volumeInfo.publishedDate,
      PageCount: bookData.volumeInfo.pageCount,
    };
    BookData.addUserBook(bookObj);
  };

  const renderBooks = () => (
    books.map((book) => (book.volumeInfo.imageLinks !== undefined && <BookSearchCard key={book.id} bookData={book} addBook={addBook} />))
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
