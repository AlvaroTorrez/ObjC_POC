//
//  IoC.m
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/10/21.
//

#import "IoC.h"

@implementation IoC

NSMutableDictionary<NSString *, NSObject *> *dependencies;

static IoC *_share = nil;

- (id) init {
    if ( self = [super init] ) {
        dependencies = [[NSMutableDictionary<NSString *, NSObject *> alloc] init];
    }
    return self;
}


+ (IoC*) share {
    @synchronized([IoC class]) {
        if (!_share)
            _share = [[self alloc] init];
        
        return _share;
    }
    return nil;
}

- (void) registerIoC:(NSObject*) instanceDI protocolToRegister:(Protocol*) protocolToRegister {
    NSString *nameProtocol = NSStringFromProtocol(protocolToRegister);
    [dependencies setObject:instanceDI forKeyedSubscript:nameProtocol];
}

- (NSObject*) resolve:(Protocol*) dependency {
    NSString *nameProtocol = NSStringFromProtocol(dependency);
    return [dependencies objectForKey:nameProtocol];
}

@end
