import React, { Component } from 'react';
import {
  Form,
  Input,
} from 'reactstrap';
import BookData from '../../helpers/data/bookData';

export default class index extends Component {
  state = {
    books: [],
    searchText: '',
  }

  handleChange = (e) => {
    this.setState({
      [e.target.name]: e.target.value,
    });
  }

  handleSubmit = (e) => {
    e.preventDefault();

    BookData.getSearchedBooks(this.state.searchText).then((response) => {
      this.setState({
        books: response,
        searchText: '',
      });
    });
  }

  render() {
    const { books, searchText } = this.state;

    const renderBooks = () => (
      books.map((book) => <>{book.volumeInfo.title}
      </>)
    );

    return (
      <>
        <Form onSubmit={this.handleSubmit}>
            <Input
              type='search'
              name='searchText'
              id='searchText'
              placeholder='enter a book title or author'
              value={searchText}
              onChange={this.handleChange}
            />
        </Form>
        {books !== [] && <div className='d-flex flex-wrap container'>{renderBooks()}</div>}
      </>
    );
  }
}
