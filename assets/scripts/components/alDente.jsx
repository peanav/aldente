/** @jsx React.DOM */
var React = require('../vendor/react/react.js');
var Header = require('./header.jsx');

var user = {
  first_name: 'Paul',
  last_name: 'Navasard',
  email: 'pnavasard@gmail.com'
};

var alDente = React.createClass({
  render: function() {
    return (
      <div className="app">
        <Header user={user}></Header>
      </div>
    );
  }
});

module.exports = alDente;
