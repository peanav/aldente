/** @jsx React.DOM */
var React = require('./vendor/react/react.js');

var alDente = require('./components/alDente.jsx');

React.renderComponent(<alDente user={user}></alDente>, document.querySelector('.app'));
