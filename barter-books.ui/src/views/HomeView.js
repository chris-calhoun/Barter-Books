import React from 'react';
import RecentlyAddedBooks from '../components/Cards/Books/BookRecentlyAddedCard';

export default function HomeView() {
  return (
    <div className='home'>
      <h1>Home View</h1>
      <RecentlyAddedBooks />
    </div>
  );
}
