//
//  BSDataManager.h
//  BSBusChallenge
//
//  Created by Mick Lerche on 3/24/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol BSDataDelegate <NSObject>

@optional
- (void)gotBusData:(id)array;

@end
@interface BSDataManager : NSObject


//@property NSString *callType;
//@property NSString *searchReplacement;
//@property NSString *userKey;

@property NSString *busUrl;
//@property NSString *commentUrl;
@property NSDictionary *dictionary;
@property NSArray *array;


@property (nonatomic, assign) id <BSDataDelegate> delegate;



- (void)getBusData;
//- (void)getDictionaryData:(NSString *)searchReplacement;
//- (instancetype)initWithType:(NSString *)callType WithSearch:(NSString *)searchReplacement;



@end


