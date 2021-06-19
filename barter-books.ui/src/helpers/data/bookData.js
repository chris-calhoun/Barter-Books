import axios from 'axios';
import appApiKey from '../apiKey';
import { baseUrl } from './config.json';

const booksUrl = `${baseUrl}/Books`;

const getSearchedBooks = (userSearch) => new Promise((resolve, reject) => {
  // remove apiApiKey if quota is hit during testing
  // axios.get(`https://www.googleapis.com/books/v1/volumes?q=${userSearch}&maxResults=10`)
  axios.get(`https://www.googleapis.com/books/v1/volumes?q=${userSearch}&maxResults=5&key=${appApiKey.exApiKey}`)
    .then((response) => {
      resolve(Object.values(response.data.items));
    }).catch((error) => reject(error));
});

const addUserBook = (bookObj) => new Promise((resolve, reject) => {
  axios.post(`${booksUrl}`, bookObj).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const getBooksFromCollection = (userId) => new Promise((resolve, reject) => {
  axios.get(`${booksUrl}/Collection/${userId}`)
    .then((response) => {
      resolve(Object.values(response.data));
    }).catch((error) => reject(error));
});

export default {
  getSearchedBooks,
  addUserBook,
  getBooksFromCollection,
};
