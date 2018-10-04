//
//  DetailCity.m
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/2/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import "DetailCity.h"

@implementation DetailCity

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.dictionary = dictionary;
    }
    return self;
}

- (void)setDictionary:(NSDictionary *)dictionary{
    self.maxTempF = dictionary[@"maxTempF"] ? : @"";
    self.minTempF = dictionary[@"first_name"] ? : @"";
    self.weather = dictionary[@"weather"] ? : @"";
}                             

@end
