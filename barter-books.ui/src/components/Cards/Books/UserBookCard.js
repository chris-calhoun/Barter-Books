import React from 'react';
import {
  Card, CardBody,
  CardTitle, CardSubtitle, Button,
} from 'reactstrap';

export default function BookSearchCard({ bookData, removeBook }) {
  return (
      <Card>
        <div className='card-img-container'>
          <img width="100%" src={bookData.image} alt={bookData.name} />
        </div>
        <CardBody className='card-content'>
          <CardTitle className="text-title">{bookData.name}</CardTitle>
          <CardSubtitle className="mb-2 text-author">{bookData.author}</CardSubtitle>
        </CardBody>
        <Button onClick={() => removeBook(bookData)} outline color="primary">Delete Book</Button>{' '}
      </Card>
  );
}
