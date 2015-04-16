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
        <GoogleMapView style={styles.map}
          showsUserLocation={true}
          markers={mapMarkers}
        />
      </View>
    );
  }
});

var styles = StyleSheet.create({
  map: {
    height: 300,
    margin: 10,
    borderWidth: 1,
    borderColor: '#000000',
  },
});

var mapMarkers = [{lat: 55, lng:37}, {lat: 0, lng:0}, {lat: -41.2864, lng:174.7762}]

AppRegistry.registerComponent('ReactNativeGoogleMaps', () => ReactNativeGoogleMaps);
