import axios from 'axios';
import { baseUrl } from './config.json';

const followerUrl = `${baseUrl}/Followers`;

const addFollower = (followerObj) => new Promise((resolve, reject) => {
  axios.post(`${followerUrl}`, followerObj).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

const getPotentialFollowers = (userId) => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/Users/Potential/${userId}`)
    .then((response) => {
      resolve(Object.values(response.data));
    }).catch((error) => reject(error));
});

const getUserFollowers = (userId) => new Promise((resolve, reject) => {
  axios.get(`${baseUrl}/Users/Followers/${userId}`)
    .then((response) => {
      resolve(Object.values(response.data));
    }).catch((error) => reject(error));
});

export default {
  addFollower,
  getPotentialFollowers,
  getUserFollowers,
};
