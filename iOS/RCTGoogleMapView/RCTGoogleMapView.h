//
//  RCTGoogleMapView.h
//  ReactNativeGoogleMaps
//
//  Created by Peter Prokop on 15/04/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@class RCTEventDispatcher;

@interface RCTGoogleMapView: GMSMapView

@property (nonatomic, copy) NSArray *markers;

@end