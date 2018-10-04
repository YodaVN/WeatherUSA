//
//  ConnectAPI.h
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/2/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ConnectAPI: UIViewController<NSURLConnectionDelegate> {
    NSMutableData *_responseData;
}

- (void)connectToAPI:(NSString *)urlStr city:(NSString *)city state:(NSString *)state success:(void (^)(NSDictionary *responseDict))success failure:(void(^)(NSError* error))failure;

@end
