/** @jsx React.DOM */
var React = require('./vendor/react/react.js');

var alDente = require('./components/alDente.jsx');

React.renderComponent(<alDente></alDente>, document.querySelector('.app'));
