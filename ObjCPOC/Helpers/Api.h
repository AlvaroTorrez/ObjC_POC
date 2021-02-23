//
//  Api.h
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/12/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Api : NSObject
+ (void) request:(NSString*)method
             url:(NSString*)url
         headers:(nullable NSDictionary*)headers
      parameters:(nullable NSDictionary*) parameters
            body:(nullable NSData*)body
     onCompleted:(void (^)(NSURLResponse *response, NSData *data, NSError *error))onCompleted;

+ (void) getRequest:(NSString*)url headers:(nullable NSDictionary*)headers parameters:(nullable NSDictionary*)parameters onCompleted:(void (^)(NSURLResponse *response, NSData *data, NSError *error))onCompleted;
@end

NS_ASSUME_NONNULL_END
