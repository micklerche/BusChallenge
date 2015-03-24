//
//  BSBusStop.m
//  BSBusChallenge
//
//  Created by Mick Lerche on 3/24/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "BSBusStop.h"

@implementation BSBusStop

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.dictionary = dictionary;
        self.ctaStopName = [self.dictionary objectForKey:@"cta_stop_name"];
        self.longitude = [self.dictionary objectForKey:@"longitude"];
        self.latitude = [self.dictionary objectForKey:@"latitude"];
        self.direction = [self.dictionary objectForKey:@"direction"];
        self.routes = [self.dictionary objectForKey:@"routes"];
    }

    return self;
}




@end
