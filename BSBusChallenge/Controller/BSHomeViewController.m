//
//  BSHomeViewController.m
//  BSBusChallenge
//
//  Created by Mick Lerche on 3/24/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "BSHomeViewController.h"
#import "BSDataManager.h"
#import "BSBusStop.h"
#import "BSMapViewController.h"


@interface BSHomeViewController () <BSDataDelegate>
@property (strong, nonatomic) IBOutlet UITableView *busTableView;
@property NSArray *bsBusStopArray;
@end

@implementation BSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bsBusStopArray = [NSArray new];

    BSDataManager *dataManager = [BSDataManager new];
    dataManager.delegate = self;
    [dataManager getBusData];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BSMapViewController *mvc = [segue destinationViewController];
    mvc.bsBusStops = self.bsBusStopArray;


}


#pragma mark - "BSData Delegate"

- (void)gotBusData:(id)array {
    NSLog(@"Delegate Data Received");

    self.bsBusStopArray = array;
    NSLog(@"Delegate item count: %li", (long)self.bsBusStopArray.count);

    [self.busTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bsBusStopArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BusCell"];

    BSBusStop *bsBusStop = [self.bsBusStopArray objectAtIndex:indexPath.row];
    cell.textLabel.text = bsBusStop.ctaStopName;

    return cell;
}





































@end
