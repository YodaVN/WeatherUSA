//
//  StateTableViewController.h
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/2/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionState.h"

NS_ASSUME_NONNULL_BEGIN

@interface StateTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    NSArray *stateArray;
}

@end

NS_ASSUME_NONNULL_END
