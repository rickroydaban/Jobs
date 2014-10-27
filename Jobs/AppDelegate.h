//
//  AppDelegate.h
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OnlineGateway.h"
#import "OfflineGateway.h"
#import "UserDetails.h"
#import "UserPageNavigators.h"
#import "CurrencyList.h"
#import "VCSlider.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic, readonly) VCSlider *slider;
@property (strong, nonatomic, readonly) OnlineGateway *onlineGateway;
@property (strong, nonatomic) NSDateFormatter *velosiDateFormat;
@property (strong, nonatomic, readonly) OfflineGateway *offlineGateway;
@property (strong, nonatomic) UserPageNavigators *pageNavigator;
@property (strong, nonatomic, readonly) NSArray *referrerList;
@property (strong, nonatomic, readonly) NSDictionary *referrerDictionary;
@property (strong, nonatomic, readonly) UserDetails *userDetails;
@property (strong, nonatomic, readonly) CurrencyList *currencyList;

- (void)updateReferrerDictionaryFromOnlineGateway:(OnlineGateway *)key dictionary:(NSDictionary *)dictionary;
- (void)updateSlider:(VCSlider *)slider;
@end

