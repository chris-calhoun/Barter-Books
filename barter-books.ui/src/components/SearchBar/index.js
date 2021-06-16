import React, { Component } from 'react';
import {
  Form,
  Input,
} from 'reactstrap';
import { withRouter } from 'react-router-dom';

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
  }

  render() {
    const { searchText } = this.state;

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
      </>
    );
  }
}

export default withRouter(SearchBar);
