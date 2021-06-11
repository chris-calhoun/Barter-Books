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
      <Route exact path='/' component={() => <HomeView/>} />
      <Route exact path='/' component={() => <AboutView/>} />
      <Route exact path='/' component={() => <SearchResultsView/>} />
      <Route exact path='/' component={() => <UserBooksView/>} />
      <Route exact path='/' component={() => <UserTradesView/>} />
    </Switch>
  );
}
