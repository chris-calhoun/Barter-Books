import axios from 'axios';
import { baseUrl } from './config.json';

const collectionUrl = `${baseUrl}/Collections`;

const getUserCollection = (userId) => new Promise((resolve, reject) => axios.get(`${collectionUrl}/${userId}`)
  .then((response) => {
    resolve(response.data[0]);
  }).catch((error) => reject(error)));

const createCollection = (collectionData) => new Promise((resolve, reject) => {
  axios.post(`${collectionUrl}`, collectionData).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const updateCollection = (collectionData) => new Promise((resolve, reject) => {
  axios.patch(`${collectionUrl}`, collectionData).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

export default {
  createCollection,
  updateCollection,
  getUserCollection,
};
