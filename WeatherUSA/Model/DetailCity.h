//
//  DetailCity.h
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/2/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailCity : NSObject

@property (nonatomic, strong) NSNumber *maxTempF;
@property (nonatomic, strong) NSNumber *minTempF;
@property (nonatomic, strong) NSString *weather;

- (instancetype)initWithDictionary: (NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
