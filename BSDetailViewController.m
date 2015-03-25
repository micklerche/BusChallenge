//
//  BSDetailViewController.m
//  BSBusChallenge
//
//  Created by Mick Lerche on 3/24/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "BSDetailViewController.h"
#import "BSBusStop.h"

@interface BSDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *bsAddress;

@end

@implementation BSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bsAddress.text = [self.bsBusStop getProperty:@"ward"];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
