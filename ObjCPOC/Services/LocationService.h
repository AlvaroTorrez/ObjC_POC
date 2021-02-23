//
//  LocationService.h
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/17/21.
//

#import <Foundation/Foundation.h>
#import "ProtocolLocationService.h"
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocationService : NSObject<ProtocolLocationService, CLLocationManagerDelegate>

@end

NS_ASSUME_NONNULL_END
