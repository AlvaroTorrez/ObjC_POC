//
//  ProtocolLocationService.h
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/17/21.
//
#import <Foundation/Foundation.h>
#import "Location.h"

#ifndef ProtocolLocationService_h
#define ProtocolLocationService_h

@protocol ProtocolLocationService

@required
- (Location*) getCurrentLocation;

@end

@interface  ProtocolLocationService : NSObject

@end


#endif /* ProtocolLocationService_h */



