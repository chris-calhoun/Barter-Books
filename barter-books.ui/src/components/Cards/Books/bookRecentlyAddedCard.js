import React from 'react';

export default function BookRecentlyAddedCard({ bookData }) {
  return (
    <div>
        <div className='card-img-container'>
          <img width="100%" src={bookData.image} alt={bookData.name} />
        </div>
      <p>Title: {bookData.name}</p>
      <p>Author: {bookData.name}</p>
      <p>Added by: {bookData.firstName} {bookData.lastName}</p>
      <p>Data added: {bookData.dateAddedToCollection}</p>
    </div>
  );
}
