/** @jsx React.DOM */
var React = require('../vendor/react/react.js');

var Header = React.createClass({
  render: function() {
    console.log(this.props);
    return (
      <div className="header">
        <div className="header__title">alDente</div>
        <div className="header__user">
          <img src={this.props.user.gravatar_image_url} />
        </div>
      </div>
    );
  }
});

module.exports = Header;
