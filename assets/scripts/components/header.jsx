/** @jsx React.DOM */
var React = require('../vendor/react/react.js');

var Header = React.createClass({
  render: function() {
    return (
      <div className="header">
        <div className="header_title">alDente</div>
        <div className="header_user">
          <img src={this.props.user.gravatar_image_url} />
        </div>
      </div>
    );
  }
});

module.exports = Header;
