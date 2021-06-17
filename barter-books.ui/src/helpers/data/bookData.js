import axios from 'axios';
import { appApiKey } from './config.json';

const getSearchedBooks = (userSearch) => new Promise((resolve, reject) => {
  // remove apiApiKey if quota is hit during testing
  // axios.get(`https://www.googleapis.com/books/v1/volumes?q=${userSearch}&maxResults=10`)
  axios.get(`https://www.googleapis.com/books/v1/volumes?q=${userSearch}&maxResults=2&key=${appApiKey}`)
    .then((response) => {
      resolve(Object.values(response.data.items));
    }).catch((error) => reject(error));
});

export default {
  getSearchedBooks,
};
