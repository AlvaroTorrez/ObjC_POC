//
//  SetupIoC.m
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/10/21.
//

#import "SetupIoC.h"
#import "IoC.h"
#import "AuthService.h"
#import "ProtocolAuthService.h"
#import "LocationService.h"
#import "ProtocolLocationService.h"

@implementation SetupIoC

+ (void) setup {
    [[IoC share] registerIoC:[[AuthService alloc] init] protocolToRegister: @protocol(ProtocolAuthService)];
    [[IoC share] registerIoC:[[LocationService alloc] init] protocolToRegister: @protocol(ProtocolLocationService)];
}

@end
