import firebase from 'firebase/app';
import 'firebase/auth';
import axios from 'axios';
import { baseUrl } from './config.json';
import CollectionData from './collectionData';

const userDataUrl = `${baseUrl}/Users`;

const getUid = () => firebase.auth().currentUser?.uid;

const loginClickEvent = (e) => {
  e.preventDefault();

  const provider = new firebase.auth.GoogleAuthProvider();
  firebase.auth().signInWithPopup(provider).then((cred) => {
    const user = cred.additionalUserInfo.profile;
    if (cred.additionalUserInfo.isNewUser) {
      const userObj = {
        Id: cred.user.uid,
        FirstName: user.given_name,
        LastName: user.family_name,
        Email: user.email,
        imageUrl: cred.user.photoURL,
      };

      axios.post(`${userDataUrl}`, userObj);
      CollectionData.createCollection({ UserId: cred.user.uid, Description: 'test' });
    }
  });
};

const logoutClickEvent = (e) => {
  e.preventDefault();
  // window.sessionStorage.removeItem('token');
  firebase.auth().signOut();
  // window.location.href = '/';
};

export default { getUid, loginClickEvent, logoutClickEvent };
