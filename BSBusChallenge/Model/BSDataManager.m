//
//  BSDataManager.m
//  BSBusChallenge
//
//  Created by Mick Lerche on 3/24/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "BSDataManager.h"
#import "BSBusStop.h"

@implementation BSDataManager

- (void)getBusData {

    NSString *urlText = @"https://s3.amazonaws.com/mobile-makers-lib/bus.json";

    NSURL *url = [NSURL URLWithString:urlText];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

                               self.dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                 options:NSJSONReadingAllowFragments
                                                                                   error:&connectionError];
                               self.array = [self.dictionary valueForKey:@"row"];
                               NSMutableArray *bsBusStops = [NSMutableArray new];

                               NSLog(@"Data Received");

                               for (NSDictionary *busStop in self.array) {
                                   BSBusStop *bsBusStop = [[BSBusStop alloc]initWithDictionary:busStop];
                                   [bsBusStops addObject:bsBusStop];
                                   NSLog(@"%@", bsBusStop.ctaStopName);
                               }








                               [self.delegate gotBusData:bsBusStops];









                               NSLog(@"Data items: %li", (long)self.array.count);
                               
                           }];
    
}



@end
