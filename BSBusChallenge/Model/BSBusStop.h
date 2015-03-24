//
//  BSBusStop.h
//  BSBusChallenge
//
//  Created by Mick Lerche on 3/24/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSBusStop : NSObject
@property NSDictionary *dictionary;
@property NSString *ID;
@property NSString *ctaStopName;
@property NSString *routes;
@property NSString *longitude;
@property NSString *latitude;
@property NSString *direction;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
