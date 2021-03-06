import React from 'react';
import { Route, Switch, Redirect } from 'react-router-dom';
import AboutView from '../views/AboutView';
import HomeView from '../views/HomeView';
import SearchResultsView from '../views/SearchResultsView';
import UserCollectionView from '../views/UserCollectionView';
import UserTradesView from '../views/UserTradesView';
import NotFoundView from '../views/NotFoundView';
import LoginView from '../views/LoginView';
import FriendsView from '../views/FriendsView';
import FriendsBookCollectionView from '../views/FriendsBookCollectionView';

export default function Routes({ user }) {
  return (
    <Switch>
      <Route exact path='/' user={user} component={() => <HomeView user={user}/>} />
      <Route exact path='/about' component={() => <AboutView />} />
      <PrivateRoute exact path='/my-books' component={UserCollectionView} userId={user.uid} user={user}/>
      <Route
        exact
        path='/friends-books/:id'
        component={(props) => <FriendsBookCollectionView {...props} user={user}/>}
      />
      <PrivateRoute exact path='/friends' component={FriendsView} userId={user.uid} user={user}/>
      <Route
        exact
        path='/search-results/:term'
        user={user} component={(props) => <SearchResultsView {...props} user={user}/>}
      />
      <Route
        exact
        path='/user-trades'
        component={() => <UserTradesView user={user}/>}
      />
       <Route exact path='/login' component={LoginView}/>
      <Route component={NotFoundView} />
    </Switch>
  );
}

const PrivateRoute = ({ component: Component, user, ...rest }) => {
  const routeChecker = (route) => (user
    ? (<Component {...route} user={user}/>)
    : (<Redirect to={{ pathname: '/pleaseLogin', state: { from: route.location } }} />));

  return <Route {...rest} render={(props) => routeChecker(props)}/>;
};
