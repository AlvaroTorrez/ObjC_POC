//
//  ProtocolAuthService.h
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/10/21.
//
#import <Foundation/Foundation.h>

#ifndef ProtocolAuthService_h
#define ProtocolAuthService_h

typedef NS_ENUM(NSInteger,AuthStatus){
    AuthStatus_SUCCEEDED,
    AuthStatus_FAILED
};

@protocol ProtocolAuthService
@required
- (void) authUser:(NSString *) userName password:(NSString *) password onCompleted:(void (^)(AuthStatus result)) onCompleted;
@end
 
@interface ProtocolAuthService : NSObject
 
@end


#endif /* ProtocolAuthService_h */
