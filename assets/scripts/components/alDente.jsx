/** @jsx React.DOM */
var React = require('../vendor/react/react.js');
var Header = require('./header.jsx');
var RecipeDetail = require('./recipeDetail.jsx');

var recipe = {
  name: 'German Pankackes',
  image_url: 'http://www.creative-culinary.com/wp-content/uploads/germanpancake-serving.jpg',
  prep_time: '20',
  tags: [ 'Breakfast', 'Dinner', '9X13' ]
}

var alDente = React.createClass({
  render: function() {
    return (
      <div id="csstyle">
        <Header user={this.props.user} />
        <RecipeDetail recipe={recipe} />
      </div>
    );
  }
});

module.exports = alDente;
