//
//  DetailView.m
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/2/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import "DetailView.h"
#import "DetailViewController.h"

@implementation DetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [[NSBundle mainBundle] loadNibNamed:@"DetailView" owner:self options:nil];
        [self addSubview:self.view];
        self.view.frame = self.bounds;
        
        self.currentDayButton.tag = 0;
        [self.currentDayButton addTarget:self.delegate action:@selector(updateUINextDay:) forControlEvents:UIControlEventTouchUpInside];
        self.tomorrowButton.tag = 1;
        [self.tomorrowButton addTarget:self.delegate action:@selector(updateUINextDay:) forControlEvents:UIControlEventTouchUpInside];
        self.dayAfterButton.tag = 2;
        [self.dayAfterButton addTarget:self.delegate action:@selector(updateUINextDay:) forControlEvents:UIControlEventTouchUpInside];
        self.nextDayView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f];
    }
    return self;
}

- (IBAction)viewTodayWeather:(id)sender {
    
}

- (IBAction)viewTomorrow:(id)sender {
    
}

- (IBAction)viewDayAfter:(id)sender {
    
}
@end
