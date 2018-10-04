//
//  DetailViewModel.h
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/2/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailCity.h"
#import "ConnectAPI.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewModel : NSObject
- (NSArray *)parseJsonToModel:(NSDictionary *)responseObject;

@end

NS_ASSUME_NONNULL_END
