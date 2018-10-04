//
//  DetailViewModel.m
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/2/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectAPI.h"
@implementation ConnectAPI

- (void)connectToAPI:(NSString *)urlStr city:(NSString *)city state:(NSString *)state success:(void (^)(NSDictionary *responseDict))success failure:(void(^)(NSError* error))failure {
    // Get Client ID and Client Secret
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [path stringByAppendingPathComponent:@"Info.plist"];
    NSDictionary *plistData = [NSDictionary dictionaryWithContentsOfFile:finalPath];
    NSString *clientId = plistData[@"WeatherKey"][@"client_id"];
    NSString *clientSecret = plistData[@"WeatherKey"][@"client_secret"];
    
    // Prepare URLString
    NSMutableString *stringToAPI = [[NSMutableString alloc] initWithString:urlStr];
    [stringToAPI appendString:city];
    [stringToAPI appendString:@","];
    [stringToAPI appendString:state];
    [stringToAPI appendString:@"?&format=json&filter=day&limit=3&fields=periods.maxTempF,periods.minTempF,periods.weather&client_id="];
    [stringToAPI appendString:clientId];
    [stringToAPI appendString:@"&client_secret="];
    [stringToAPI appendString:clientSecret];
    NSString *urlAsString = [NSString stringWithFormat:@"%@", stringToAPI];
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *encodedUrlAsString = [urlAsString stringByAddingPercentEncodingWithAllowedCharacters:set];
    
    // Setup session to call to API
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[session dataTaskWithURL:[NSURL URLWithString:encodedUrlAsString]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                if (!error) {
                    // Success
                    if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                        NSError *jsonError;
                        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                        
                        if (jsonError) {
                            // Error Parsing JSON
                            
                        } else {
                            success(jsonResponse);
                        }
                    }  else {
                        //Web server is returning an error
                    }
                } else {
                    // Fail
                    failure(error);
                    NSLog(@"error : %@", error.description);
                }
            }] resume];
}

@end
