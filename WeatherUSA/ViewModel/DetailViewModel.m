//
//  DetailViewModel.m
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/2/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import "DetailViewModel.h"

@implementation DetailViewModel

- (NSArray *)parseJsonToModel:(NSDictionary *)responseObject {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    if ([responseObject isKindOfClass:[NSDictionary class]]){
        NSArray *jsonArray = responseObject[@"response"];
        
        if ([jsonArray isKindOfClass:[NSArray class]]){//Added instrospection as suggested in comment.
            for (NSDictionary *dictionary in jsonArray) {
                NSArray *periodArray = dictionary[@"periods"];
                for (NSDictionary *currentWeather in periodArray) {
                    DetailCity *detailCity = [[DetailCity alloc] init];
                    detailCity.maxTempF = [currentWeather objectForKey:@"maxTempF"];
                    detailCity.minTempF = [currentWeather objectForKey:@"minTempF"];
                    detailCity.weather = [currentWeather objectForKey:@"weather"];

                    [result addObject:detailCity];
                }
            }
        }
    }
    
    return result;
}

@end
