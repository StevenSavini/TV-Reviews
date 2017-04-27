import React from 'react';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import ReviewShowContainer from './containers/ReviewShowContainer';


const App = (props) => {
  return (
    <Router history={browserHistory}>
      <Route path='/' >
        <Route path="shows/:id/reviews/new" component={ReviewShowContainer} />
      </Route>
    </Router>
  );
}

export default App;
