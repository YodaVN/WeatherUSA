//
//  CityTableViewController.m
//  WeatherUSA
//
//  Created by Nhan Nguyen on 10/2/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

#import "CityTableViewController.h"

@interface CityTableViewController () {
    NSString *selectCity;
}
@end

@implementation CityTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getCityFromJSON];
}

- (void)getCityFromJSON {
    NSDictionary *dict = [self JSONFromFile];
    cities = [dict objectForKey:_state];
    cities = [cities sortedArrayUsingSelector:@selector(compare:)];
}

- (NSDictionary *)JSONFromFile {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cityList" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

// Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"city";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [cities objectAtIndex:indexPath.row];
    return cell;
}

//Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectCity = [cities objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"DetailSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.state = _state;
        detailViewController.city = selectCity;
    }
}
@end
