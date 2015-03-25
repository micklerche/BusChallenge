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
@property NSString *interModal;
@property NSString *address;
@property BOOL isMetra;
@property int arrayIndex;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary arrayIndex:(int)arrayIndex;
- (NSString *)getProperty:(NSString *)propertyName;

@end
