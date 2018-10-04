//
//  WeatherUSATests.m
//  WeatherUSATests
//
//  Created by Nhan Nguyen on 10/3/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DetailViewModel.h"
#import "DetailViewController.h"

@interface WeatherUSATests : XCTestCase {
    DetailViewController *detailViewController;
}

@end

@implementation WeatherUSATests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [super setUp];
    detailViewController = DetailViewController.new;
    detailViewController.onGoingRequest = 1;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    detailViewController = nil;
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testAllInfoContractsAreRetrievedUponViewAppearing {
    //Give
    ConnectAPI *connectAPI = [[ConnectAPI alloc] init];
    
    //When
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        //Load the json on another thread
        [connectAPI connectToAPI:@"https://api.aerisapi.com/forecasts/" city:@"Fairfield" state:@"IA" success:^(NSDictionary *responseDict) {
            detailViewController.onGoingRequest = 1;
        } failure:^(NSError *error) {
            detailViewController.onGoingRequest = 0;
        }];
    });
    
    //Then
    XCTAssertEqual(detailViewController.onGoingRequest, 1);
}
@end
