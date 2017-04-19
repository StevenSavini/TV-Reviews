import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import Show from './components/Show';

$(function() {
 ReactDOM.render(
   <div>
     <Show />
   </div>,
   document.getElementById('show')
 );
});
