/** @jsx React.DOM */
var React = require('../vendor/react/react.js');
var Header = require('./header.jsx');

var alDente = React.createClass({
  render: function() {
    return (
      <div className="app">
        <Header user={this.props.user}></Header>
      </div>
    );
  }
});

module.exports = alDente;
