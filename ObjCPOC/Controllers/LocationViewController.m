//
//  LocationViewController.m
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/12/21.
//
#import <MapKit/MapKit.h>
#import "LocationViewController.h"
#import "IoC.h"
#import "ProtocolLocationService.h"
#import "Location.h"
#import <CoreLocation/CoreLocation.h>
//#import <NotificationCenter/NotificationCenter.h>


@interface LocationViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (weak, nonatomic) IBOutlet UILabel *latitudeText;
@property (weak, nonatomic) IBOutlet UILabel *longitude;

@end

@implementation LocationViewController

NSObject<ProtocolLocationService> *locationService;

- (id) init {
    self = [super init];
    [self setupTabBarItem];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    locationService = (NSObject<ProtocolLocationService> *)[[IoC share] resolve:@protocol(ProtocolLocationService)] ;
}

- (void)viewDidAppear:(BOOL)animated {
    NSDictionary * userInfo = @{ @"tabName" : @"Location" };
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateMainName" object:nil userInfo:userInfo];
}

- (void) setupTabBarItem {
    [[self tabBarItem] setImage:[UIImage systemImageNamed:@"location.fill"] ];
    [[self tabBarItem] setTitle:@"Location"];
    [self setTitle:@"Location"];
}

- (IBAction)onCurrentLocation:(id)sender {
    Location *location = [locationService getCurrentLocation];
    dispatch_async(dispatch_get_main_queue(), ^{
        self->_latitudeText.text = [[NSNumber numberWithDouble:location.latitude] stringValue];
        self->_longitude.text= [[NSNumber numberWithDouble:location.longitude] stringValue];
        [self->_map setCenterCoordinate:CLLocationCoordinate2DMake(location.latitude,location.longitude)];
    });
}

@end
