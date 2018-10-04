//
//  DetailViewController.h
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/2/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailView.h"
#import "DetailViewModel.h"
#import "ConnectAPI.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController<DetailViewDelegate> {
    NSArray *jsonArray;
    DetailView *detailView;
    int onGoingRequest;
}

@property (nonatomic) NSArray *jsonArray;
@property (nonatomic) DetailView *detailView;
@property (nonatomic) int onGoingRequest;

@property (nonatomic) NSString *state;
@property (nonatomic) NSString *city;

- (void)updateUINextDay:(UIButton *)sender;
- (void)updateUI;


@end

NS_ASSUME_NONNULL_END
