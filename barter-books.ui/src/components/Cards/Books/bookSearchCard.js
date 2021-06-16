import React from 'react';
import {
  Card, CardBody,
  CardTitle, CardSubtitle,
} from 'reactstrap';

export default function bookSearchCard({ bookData }) {
  return (
    <div>
      <Card>
        <CardBody>
          <CardTitle tag="h5">{bookData.volumeInfo.title}</CardTitle>
          <CardSubtitle tag="h6" className="mb-2 text-muted">{bookData.volumeInfo.authors}</CardSubtitle>
        </CardBody>
        <img width="100%" src={bookData.volumeInfo.imageLinks.thumbnail} alt={bookData.volumeInfo.title} />
      </Card>
    </div>
  );
}
