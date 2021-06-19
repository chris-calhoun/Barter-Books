import React from 'react';
import {
  Card, CardBody,
  CardTitle, CardSubtitle,
} from 'reactstrap';

export default function BookRecentlyAddedCard({ bookData }) {
  return (
    <Card>
        <div className='card-img-container'>
          <img width="100%" src={bookData.image} alt={bookData.name} />
        </div>
        <CardBody className='card-content'>
          <CardTitle className="text-title">{bookData.name}</CardTitle>
          <CardSubtitle className="mb-2 text-author">{bookData.author}</CardSubtitle>
          <CardSubtitle className="mb-2 text-author">Added by: {bookData.firstName} {bookData.lastName}</CardSubtitle>
          <CardSubtitle className="mb-2 text-author">Data added: {bookData.dateAddedToCollection}</CardSubtitle>
        </CardBody>
    </Card>
  );
}
