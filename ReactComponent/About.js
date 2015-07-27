var React = require('react-native');
var BreadcrumbNavSample = require('./BreadcrumbNavSample');

var {
	StyleSheet,
	Text,
	View,
	Image,	
	ScrollView,
	PixelRatio,
	TouchableHighlight
} = React;

class NavButton extends React.Component {
  render() {
    return (
      <TouchableHighlight
        style={styles.button}
        underlayColor="#B5B5B5"
        onPress={this.props.onPress}>
        <Text style={styles.buttonText}>{this.props.text}</Text>
      </TouchableHighlight>
    );
  }
}

var About = React.createClass({

	render:function(){
		return(
			<View style = {{top:65, height:100, backgroundColor:'red'}}>
			 	<NavButton
          			onPress={() => {
          				alert(this.props.navigator);
            			this.props.navigator.pop();
          			}}
          			text="Pop"
        		/>
				<NavButton
          			onPress={() => {
            			this.props.navigator.push({
        					title: 'test',
       					 	component: BreadcrumbNavSample,
      					});
          			}}
          			text="Float in from right" 
          		/>
			</View>
		);
	}
});

var styles = StyleSheet.create({
	buttonText: {
    	fontSize: 17,
    	fontWeight: '500',
  	},
  	button: {
    	backgroundColor: 'white',
    	padding: 15,
    	borderBottomWidth: 1 / PixelRatio.get(),
    	borderBottomColor: '#CDCDCD',
  	}
});

module.exports = About;
