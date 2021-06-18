import React from 'react';
import {
  Card, CardBody,
  CardTitle, CardSubtitle, Button,
} from 'reactstrap';

export default function BookSearchCard({ bookData, addBook }) {
  return (
      <Card>
        <div className='card-img-container'>
          <img className="book-image" width="100%" src={bookData.volumeInfo.imageLinks?.thumbnail} alt={bookData.volumeInfo.title} />
        </div>
        <CardBody className='card-content'>
          <CardTitle className="text-title">{bookData.volumeInfo.title}</CardTitle>
          <CardSubtitle className="mb-2 text-author">{bookData.volumeInfo?.authors.join(', ')}</CardSubtitle>
        </CardBody>
        <Button onClick={() => addBook(bookData.volumeInfo.title)} outline color="primary">Add Book</Button>{' '}
      </Card>
  );
}
