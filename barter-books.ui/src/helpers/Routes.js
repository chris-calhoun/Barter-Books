import React from 'react';
import { Route, Switch } from 'react-router-dom';
import AboutView from '../views/AboutView';
import HomeView from '../views/HomeView';
import SearchResultsView from '../views/SearchResultsView';
import UserBooksView from '../views/UserBooksView';
import UserTradesView from '../views/UserTradesView';

export default function Routes() {
  return (
    <Switch>
      <Route exact path='/' component={() => <HomeView />} />
      <Route exact path='/about' component={() => <AboutView />} />
      <Route
        exact
        path='/search-results'
        component={() => <SearchResultsView />}
      />
      <Route exact path='/user-books' component={() => <UserBooksView />} />
      <Route
        exact
        path='/user-trades-view'
        component={() => <UserTradesView />}
      />
    </Switch>
  );
}
