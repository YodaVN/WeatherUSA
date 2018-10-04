//
//  StateTableViewController.m
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/2/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import "StateTableViewController.h"
#import "CityTableViewController.h"
#import "ConnectAPI.h"

@interface StateTableViewController () {
    NSString *selectState;
}

@end

@implementation StateTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CollectionState *sharedManager = [CollectionState sharedManager];
    stateArray = sharedManager.stateArray;
    stateArray = [stateArray sortedArrayUsingSelector:@selector(compare:)];
    self.navigationController.navigationBar.translucent = NO;
    
}

// Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [stateArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"state";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [stateArray objectAtIndex:indexPath.row];
    return cell;
}

// Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectState = [stateArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"CitySegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CitySegue"]) {
        CityTableViewController *cityTableViewController = segue.destinationViewController;
        NSLog(@"%@", selectState);
        cityTableViewController.state = selectState;
    }
}

@end
