//
//  DetailView.h
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/2/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DetailViewDelegate <NSObject>

- (void)updateUINextDay:(int) buttonID;

@end

@interface DetailView : UIView

@property (assign) id<DetailViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet DetailView *view;
@property (retain, nonatomic) IBOutlet UIImageView *weatherImage;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *avertempLabel;
@property (weak, nonatomic) IBOutlet UILabel *hightempLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowtempLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentDay;
@property (weak, nonatomic) IBOutlet UIButton *currentDayButton;
@property (weak, nonatomic) IBOutlet UILabel *tomorrow;
@property (weak, nonatomic) IBOutlet UIButton *tomorrowButton;
@property (weak, nonatomic) IBOutlet UILabel *dayAfter;
@property (weak, nonatomic) IBOutlet UIButton *dayAfterButton;
@property (weak, nonatomic) IBOutlet UIView *nextDayView;
- (IBAction)viewTodayWeather:(id)sender;
- (IBAction)viewTomorrow:(id)sender;
- (IBAction)viewDayAfter:(id)sender;

@end

NS_ASSUME_NONNULL_END
