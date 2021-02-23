//
//  IoC.h
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/10/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface IoC : NSObject

+ (IoC *) share;

- (void) registerIoC:(NSObject*) instanceDI protocolToRegister:(Protocol*)protocolToRegister;

- (NSObject *) resolve:(Protocol*) dependency;
@end

NS_ASSUME_NONNULL_END
