import axios from 'axios';
// import { appApiKey } from './config.json';

const getSearchedBooks = (userSearch) => new Promise((resolve, reject) => {
  // remove apiApiKey if quota is hit during testing
  // axios.get(`https://www.googleapis.com/books/v1/volumes?q=${userSearch}&maxResults=5&key=${appApiKey}`)
  axios.get(`https://www.googleapis.com/books/v1/volumes?q=${userSearch}&maxResults=25`)
    .then((response) => {
      resolve(Object.values(response.data.items));
    }).catch((error) => reject(error));
});

export default {
  getSearchedBooks,
};
