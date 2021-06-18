import React from 'react';
import { Route, Switch } from 'react-router-dom';
import AboutView from '../views/AboutView';
import HomeView from '../views/HomeView';
import SearchResultsView from '../views/SearchResultsView';
import UserBooksView from '../views/UserBooksView';
import UserTradesView from '../views/UserTradesView';
import NotFoundView from '../views/NotFoundView';

export default function Routes({ user }) {
  return (
    <Switch>
      <Route exact path='/' component={() => <HomeView user={user}/>} />
      <Route exact path='/about' component={() => <AboutView />} />
      <Route exact path='/my-books' component={() => <UserBooksView />} />
      <Route
        exact
        path='/search-results/:term'
        component={(props) => <SearchResultsView {...props}/>}
      />
      <Route exact path='/user-books' component={() => <UserBooksView />} />
      <Route
        exact
        path='/user-trades'
        component={() => <UserTradesView />}
      />
      <Route component={NotFoundView} />
    </Switch>
  );
}
