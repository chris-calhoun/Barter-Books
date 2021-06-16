import React, { Component } from 'react';
import BookData from '../helpers/data/bookData';

export default class SearchResultsView extends Component {
  state = {
    searchText: '',
    books: [],
  };

  componentDidMount() {
    this.showResults();
  }

  componentDidUpdate(prevState) {
    if (prevState.match.params.term !== this.props.match.params.term) {
      this.showResults();
    }
  }

  showResults = () => {
    const searchText = this.props.match.params.term;

    BookData.getSearchedBooks(searchText).then((response) => {
      this.setState({
        books: response,
        searchText,
      });
    });
  }

  render() {
    const { books, searchText } = this.state;

    const renderBooks = () => (
      books.map((book) => <p key={book.id}>{book.volumeInfo.title}</p>)
    );
    return (
      <div>
        <h1>Search results for</h1>
        <h3>{searchText}</h3>
        {books !== [] && <div className='d-flex flex-wrap container'>{renderBooks()}</div>}
      </div>
    );
  }
}
