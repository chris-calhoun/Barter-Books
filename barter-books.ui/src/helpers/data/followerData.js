import axios from 'axios';
import { baseUrl } from './config.json';

const followerUrl = `${baseUrl}/Followers`;

const addFollower = (followerObj) => new Promise((resolve, reject) => {
  axios.post(`${followerUrl}`, followerObj).then((response) => {
    resolve(response.data);
  }).catch((error) => reject(error));
});

export default {
  addFollower,
};
