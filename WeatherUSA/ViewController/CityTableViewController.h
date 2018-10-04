//
//  CityTableViewController.h
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/2/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CityTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    NSArray *cities;
}

@property (nonatomic) NSString *state;

@end

NS_ASSUME_NONNULL_END
