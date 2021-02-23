//
//  AuthService.m
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/10/21.
//

#import "AuthService.h"

@implementation AuthService

- (void)authUser:(NSString *)userName password:(NSString *) password onCompleted:(void (^)(AuthStatus)) onCompleted {
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //code to be executed on the main queue after delay
        if ([userName  isEqual: @"test"] && [password  isEqual: @"123"]) {
            onCompleted(AuthStatus_SUCCEEDED);
        } else {
            onCompleted(AuthStatus_FAILED);
        }
    });
}


@end
