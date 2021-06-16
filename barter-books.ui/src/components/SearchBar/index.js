import React, { Component } from 'react';
import {
  Form,
  FormGroup,
  Input,
} from 'reactstrap';

export default class index extends Component {
  render() {
    return (
      <Form>
        <FormGroup>
          <Input
            type='search'
            name='bookSearch'
            id='bookSearch'
            placeholder='enter a book title or author'
          />
        </FormGroup>
      </Form>
    );
  }
}
