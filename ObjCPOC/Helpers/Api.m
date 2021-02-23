//
//  Api.m
//  ObjCPOC
//
//  Created by Alvaro Torrez on 2/12/21.
//

#import "Api.h"

@implementation Api
+ (void) request:(NSString*)method url:(NSString*)url headers:(nullable NSDictionary*)headers parameters:(nullable NSDictionary*) parameters body:(nullable NSData*)body onCompleted:(void (^)(NSURLResponse *response, NSData *data, NSError *error))onCompleted {
    
    if (parameters) {
        
    }
    
    NSURL *fullUrl = [NSURL URLWithString:url];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:fullUrl];
    urlRequest.HTTPMethod = method;
    
    if (headers) {
        
    }
    
    if (body) {
        urlRequest.HTTPBody = body;
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:urlRequest
                completionHandler:^(NSData *data,
                                    NSURLResponse *response,
                                    NSError *error) {
        onCompleted(response, data, error);
    }] resume];
    
}

+ (void) getRequest:(NSString*)url headers:(nullable NSDictionary*)headers parameters:(nullable NSDictionary*)parameters onCompleted:(void (^)(NSURLResponse *response, NSData *data, NSError *error))onCompleted {
    [Api request:@"GET" url:url headers:headers parameters:parameters body:nil onCompleted:^(NSURLResponse * _Nonnull response, NSData * _Nonnull data, NSError * _Nonnull error) {
        onCompleted(response, data, error);
    }];
}
@end
