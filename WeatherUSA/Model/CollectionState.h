//
//  CollectionState.h
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/3/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionState : NSObject {
    NSMutableArray *stateArray;
}

@property (nonatomic, retain) NSMutableArray *stateArray;

+ (id)sharedManager;

@end

NS_ASSUME_NONNULL_END
