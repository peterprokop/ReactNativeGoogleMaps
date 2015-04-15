/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} = React;

var GoogleMapView = require('./GoogleMapView.js')

var ReactNativeGoogleMaps = React.createClass({
  render: function() {
    return (
      <View>
        <GoogleMapView style={styles.map} showsUserLocation={true} />
      </View>
    );
  }
});

var styles = StyleSheet.create({
  map: {
    height: 640,
    margin: 10,
    borderWidth: 1,
    borderColor: '#000000',
  },
});

AppRegistry.registerComponent('ReactNativeGoogleMaps', () => ReactNativeGoogleMaps);
