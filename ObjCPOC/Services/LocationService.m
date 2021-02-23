//
//  LocationService.m
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/17/21.
//

#import "LocationService.h"

@implementation LocationService

CLLocationManager *_locationManager;
CLLocation *_location;

BOOL _updatingLocation;

- (id)init {
    if (self = [super init]) {
        _locationManager = [[CLLocationManager alloc] init];
    }
    return self;
}

- (Location *) getCurrentLocation {
    [_locationManager requestWhenInUseAuthorization];
    [self startLocationManager];
    Location *result = [[Location alloc] init];
    result.latitude = _location.coordinate.latitude;
    result.longitude = _location.coordinate.longitude;
    return result;
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
  NSLog(@"didFailWithError %@", error);
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *newLocation = [locations lastObject];
    
    _location = newLocation;

    NSLog(@"didUpdateLocations %@", newLocation);
}

- (void) startLocationManager {
  if ([CLLocationManager locationServicesEnabled]) { //locationServicesEnabled : Returns a Boolean value indicating whether location services are enabled on the device.

    // Tell the location manager to start fetching the location.
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    [_locationManager startUpdatingLocation]; ////Starts the generation of updates that report the user’s current location
    _updatingLocation = YES;
  }
}


@end
