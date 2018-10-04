//
//  DetailViewController.m
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/2/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController
@synthesize jsonArray;
@synthesize detailView;
@synthesize onGoingRequest;

- (void)viewDidLoad {
    [super viewDidLoad];
    detailView = [[DetailView alloc] initWithFrame:self.view.bounds];
    detailView.delegate = self;
    [self.view addSubview:detailView];
    self.onGoingRequest = 1;
    [self callAPI];
}
- (void)viewWillAppear:(BOOL)animated {
    if (self.onGoingRequest == 0) {
        [self.navigationController popViewControllerAnimated:NO];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self callAlert];
        });
    }
}

- (void)callAPI {
    ConnectAPI *connectAPI = [[ConnectAPI alloc] init];
    DetailViewModel *detailViewModel = [[DetailViewModel alloc] init];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        //Load the json on another thread
        [connectAPI connectToAPI:@"https://api.aerisapi.com/forecasts/" city:self.city state:self.state success:^(NSDictionary *responseDict) {
            self.jsonArray = [detailViewModel parseJsonToModel:responseDict];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateUI];
                [self.detailView setNeedsLayout];
            });
        } failure:^(NSError *error) {
            self.onGoingRequest = 0;
            [self viewWillAppear:YES];
        }];
    });
}

- (void)updateUI {
    DetailCity *detailCityToday = self.jsonArray[0];
    DetailCity *detailCityTmr = self.jsonArray[1];
    DetailCity *detailCityAfter = self.jsonArray[2];
    
    int averToday = ([detailCityToday.maxTempF intValue] + [detailCityToday.minTempF intValue])/2;
    int averTmr = ([detailCityTmr.maxTempF intValue] + [detailCityTmr.minTempF intValue])/2;
    int averAfter = ([detailCityAfter.maxTempF intValue] + [detailCityAfter.minTempF intValue])/2;
    
    self.detailView.weatherImage.image = [UIImage imageNamed:[self checkAvgTemp:averToday avg:true]];
    self.detailView.infoLabel.text = detailCityToday.weather;
    self.detailView.locationLabel.text = [[self.city stringByAppendingString:@", "] stringByAppendingString:self.state];
    
    self.detailView.avertempLabel.text = [NSString stringWithFormat:@"%d",averToday];
    self.detailView.hightempLabel.text = [@"H " stringByAppendingString:[detailCityToday.maxTempF stringValue]];
    self.detailView.lowtempLabel.text = [@"L " stringByAppendingString:[detailCityToday.minTempF stringValue]];
    [self.detailView.currentDayButton setImage:[UIImage imageNamed:[self checkAvgTemp:averToday avg:false]] forState:UIControlStateNormal];
    [self.detailView.tomorrowButton setImage:[UIImage imageNamed:[self checkAvgTemp:averTmr avg:false]] forState:UIControlStateNormal];
    [self.detailView.dayAfterButton setImage:[UIImage imageNamed:[self checkAvgTemp:averAfter avg:false]] forState:UIControlStateNormal];
}

- (void)updateUINextDay:(UIButton *)sender {
    DetailCity *detailCityToday = self.jsonArray[sender.tag];
    
    int averToday = ([detailCityToday.maxTempF intValue] + [detailCityToday.minTempF intValue])/2;
    
    self.detailView.weatherImage.image = [UIImage imageNamed:[self checkAvgTemp:averToday avg:true]];
    self.detailView.infoLabel.text = detailCityToday.weather;
    self.detailView.locationLabel.text = [[self.city stringByAppendingString:@", "] stringByAppendingString:self.state];
    
    self.detailView.avertempLabel.text = [NSString stringWithFormat:@"%d",averToday];
    self.detailView.hightempLabel.text = [@"H " stringByAppendingString:[detailCityToday.maxTempF stringValue]];
    self.detailView.lowtempLabel.text = [@"L " stringByAppendingString:[detailCityToday.minTempF stringValue]];
}

- (NSString *)checkAvgTemp:(int)avg avg:(Boolean)avgTemp {
    if (avg < 40) {
        if (avgTemp) {
            [self.detailView setBackgroundColor:[UIColor colorWithRed:167/255.0f green:132/255.0f blue:234/255.0f alpha:1.0f]];
        }
        return @"rainy-weather-128";
    } else if (avg >= 40 && avg < 60) {
        if (avgTemp) {
            [self.detailView setBackgroundColor:[UIColor colorWithRed:110/255.0f green:154/255.0f blue:253/255.0f alpha:1.0f]];
        }
        return @"chance-of-storm-128";
    } else if (avg >= 60 && avg < 70) {
        if (avgTemp) {
            [self.detailView setBackgroundColor:[UIColor colorWithRed:50/255.0f green:144/255.0f blue:242/255.0f alpha:1.0f]];
        }
        return @"clouds-128";
    } else if (avg >= 70) {
        if (avgTemp) {
            [self.detailView setBackgroundColor:[UIColor colorWithRed:250/255.0f green:136/255.0f blue:89/255.0f alpha:1.0f]];
        }
        return @"partly-cloudy-day-128";
    }
    
    return @"rainy-weather-128";
}

- (void)callAlert {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"The Internet connection appears to be offline. Try again later."
                                 message:@""
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    UIAlertAction* okButton = [UIAlertAction
                                actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    

    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
