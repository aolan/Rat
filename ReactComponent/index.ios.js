var React = require('react-native');
var About = require('./About');

var {
    NavigatorIOS,
    AppRegistry,
    StyleSheet
} = React;

var NV = React.createClass({

    render: function(){
        return(
            <NavigatorIOS 
                style = {styles.container}
                initialRoute = {{
                    title: '关于我们',
                    component: About,
                    title1:''
                }}
            />
        );
    }
});

var styles = StyleSheet.create({
    container: {
        flex: 1
    }
});

AppRegistry.registerComponent('Rat', () => NV);
