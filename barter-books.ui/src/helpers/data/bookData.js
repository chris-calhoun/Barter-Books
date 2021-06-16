import axios from 'axios';
import { appApiKey } from './config.json';

const getSearchedBooks = (userSearch) => new Promise((resolve, reject) => {
  axios.get(`https://www.googleapis.com/books/v1/volumes?q=${userSearch}&maxResults=25&key=${appApiKey}`)
    .then((response) => {
      resolve(Object.values(response.data.items));
    }).catch((error) => reject(error));
});

export default {
  getSearchedBooks,
};
