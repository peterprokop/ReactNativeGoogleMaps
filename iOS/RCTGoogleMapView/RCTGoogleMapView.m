//
//  RCTGoogleMapView.m
//  ReactNativeGoogleMaps
//
//  Created by Peter Prokop on 15/04/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "RCTGoogleMapView.h"

#import "RCTConvert.h"
#import "RCTEventDispatcher.h"
#import "RCTLog.h"
#import "RCTUtils.h"

@implementation RCTGoogleMapView
{
  NSArray *_markers;
  NSMutableArray *_markersInternal;
}

+ (void)initialize
{
  [super initialize];
  
  #error Provide your GMS API key
  [GMSServices provideAPIKey:@""];
}

- (instancetype)init
{
  if ((self = [super init])) {

  }
  return self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  // Force resize subviews - only the layer is resized by default
  CGRect mapFrame = self.frame;
  self.frame = CGRectZero;
  self.frame = mapFrame;
}

- (void)updateToFitAllMarkers
{
  if (!_markersInternal.count) {
    return;
  }
  
  GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc] init];
  for (GMSMarker* marker in _markersInternal) {
    bounds = [bounds includingCoordinate:marker.position];
  }

  GMSCameraUpdate *update = [GMSCameraUpdate fitBounds:bounds withPadding:40.0];

  [self animateWithCameraUpdate:update];
}

#pragma mark Accessors

- (void)setShowsUserLocation:(BOOL)showsUserLocation
{
  /*
  if (self.showsUserLocation != showsUserLocation) {
    if (showsUserLocation && !_locationManager) {
      _locationManager = [[CLLocationManager alloc] init];
      if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
      }
    }
    [super setShowsUserLocation:showsUserLocation];
    
    // If it needs to show user location, force map view centered
    // on user's current location on user location updates
    self.followUserLocation = showsUserLocation;
  }
   */
}

- (void)setMarkers:(NSArray *)markers
{
  if (_markers != markers) {
    _markers = [markers copy];

    for (GMSMarker* marker in _markersInternal) {
      marker.map = nil;
    }
    
    _markersInternal = [NSMutableArray arrayWithCapacity:_markers.count];
    
    for (NSDictionary* markerDictionary in markers) {
      CLLocationDegrees lat = ((NSNumber*)markerDictionary[@"lat"]).doubleValue;
      CLLocationDegrees lng = ((NSNumber*)markerDictionary[@"lng"]).doubleValue;
      
      GMSMarker* marker = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(lat, lng)];
      marker.map = self;
      
      [_markersInternal addObject:marker];
    }
    
    [self updateToFitAllMarkers];
  }
}

/*
- (void)setRegion:(MKCoordinateRegion)region
{
  // If location is invalid, abort
  if (!CLLocationCoordinate2DIsValid(region.center)) {
    return;
  }
  
  // If new span values are nil, use old values instead
  if (!region.span.latitudeDelta) {
    region.span.latitudeDelta = self.region.span.latitudeDelta;
  }
  if (!region.span.longitudeDelta) {
    region.span.longitudeDelta = self.region.span.longitudeDelta;
  }
  
  // Animate to new position
  [super setRegion:region animated:YES];
}
*/

@end