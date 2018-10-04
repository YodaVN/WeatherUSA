//
//  CollectionState.m
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/3/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import "CollectionState.h"

@implementation CollectionState
@synthesize stateArray;

+ (id)sharedManager {
    static CollectionState *sharedCollectionState = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCollectionState = [[self alloc] init];
    });
    return sharedCollectionState;
}

- (id)init {
    if (self = [super init]) {
        stateArray = [[NSMutableArray alloc]initWithObjects:
                      @"New York",@"California",@"Illinois",
                      @"Texas",@"Pennsylvania",@"Arizona",
                      @"Florida",@"Indiana",@"Ohio",
                      @"North Carolina",@"Michigan",@"Tennessee",
                      @"Massachusetts",@"Washington",@"Colorado",
                      @"Vermont",@"Maryland",@"Kentucky",
                      @"Oregon",@"Oklahoma",@"Wisconsin",
                      @"Nevada",@"New Mexico",@"Missouri",
                      @"Virginia",@"Georgia",@"Nebraska",
                      @"Minnesota",@"Kansas",@"Louisiana",
                      @"Hawaii",@"Alaska",@"New Jersey",
                      @"Idaho",@"Alabama",@"Iowa",
                      @"Arkansas",@"Utah",@"Rhode Island",
                      @"Mississippi",@"South Dakota",@"Connecticut",
                      @"South Carolina",@"New Hampshire",@"North Dakota",
                      @"Montana",@"Delaware",@"Maine",
                      @"Wyoming",@"West Virginia",nil];
    }
    return self;
}

@end
