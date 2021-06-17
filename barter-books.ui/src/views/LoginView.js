import React from 'react';
import Auth from '../components/Auth';

export default function LoginView() {
  return (
    <div className='login-view'>
      <div className='image-box'>
        <h1 className='centered'>Barter Books</h1>
        <img src="https://images.unsplash.com/photo-1507842217343-583bb7270b66?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Ym9va3NoZWxmfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80" alt="books on a shelf"/>
      </div>
      <div className='content-box'>
        <Auth />
      </div>
    </div>
  );
}
