import React from 'react';
import Auth from '../components/Auth';

export default function LoginView() {
  return (
    <div className='login-view'>
      <div className='image-box'>
        <h1 className='centered'>Barter Books</h1>
        <img src="https://wallpaperaccess.com/full/2964938.jpg" alt="books on a shelf"/>
      </div>
      <div className='content-box'>
        <Auth />
      </div>
    </div>
  );
}
