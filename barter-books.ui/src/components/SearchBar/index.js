import React, { Component } from 'react';
import {
  Form,
  Input,
} from 'reactstrap';
import { withRouter } from 'react-router-dom';
// import BookData from '../../helpers/data/bookData';

class SearchBar extends Component {
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

    this.props.history.push(`/search-results/${this.state.searchText}`);
    // BookData.getSearchedBooks(this.state.searchText).then((response) => {
    //   this.setState({
    //     books: response,
    //     searchText: '',
    //   });
    // });
  }

  render() {
    const { searchText } = this.state;

    // const renderBooks = () => (
    //   books.map((book) => <>{book.volumeInfo.title}
    //   </>)
    // );

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
        {/* {books !== [] && <div className='d-flex flex-wrap container'>{renderBooks()}</div>} */}
      </>
    );
  }
}

export default withRouter(SearchBar);
