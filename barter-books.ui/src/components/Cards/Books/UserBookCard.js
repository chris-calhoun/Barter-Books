import React from 'react';
import {
  Card, CardBody,
  CardTitle, CardSubtitle,
} from 'reactstrap';

export default function BookSearchCard({ bookData }) {
  return (
      <Card>
        <div className='card-img-container'>
          <img className="book-image" width="100%" src={bookData.volumeInfo.imageLinks?.thumbnail} alt={bookData.volumeInfo.title} />
        </div>
        <CardBody className='card-content'>
          <CardTitle className="text-title">{bookData.volumeInfo.title}</CardTitle>
          <CardSubtitle className="mb-2 text-author">{bookData.volumeInfo?.authors.join(', ')}</CardSubtitle>
        </CardBody>
        {/* <Button onClick={() => addBook(bookData)} outline color="primary">Add Book</Button>{' '} */}
      </Card>
  );
}
