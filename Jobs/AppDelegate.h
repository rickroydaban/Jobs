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
#import "CountryList.h"
@class User;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) User *propUser;
@property (strong, nonatomic, readonly) VCSlider *propSlider;
@property (strong, nonatomic, readonly) OnlineGateway *propGatewayOnline;
@property (strong, nonatomic, readonly) OfflineGateway *propGatewayOffline;
@property (strong, nonatomic, readonly) UserDetails *propUserDetails;
@property (strong, nonatomic, readonly) NSArray *propListReferrers;
@property (strong, nonatomic, readonly) NSDictionary *propDictReferrers;
@property (strong, nonatomic, readonly) CurrencyList *propCurrency;
@property (strong, nonatomic) UserPageNavigators *propPageNavigator;
@property (strong, nonatomic) NSDateFormatter *propDateFormatVelosi;

@property (strong, nonatomic, readonly) NSArray *propListSearchIns, *propListJobTypes, *propListPostedWithins;
@property (strong, nonatomic, readonly) CountryList *propCountries;
@property (strong, nonatomic, readonly) NSDictionary *propDictSearchIns, *propDictJobTypes, *propDictPostedWithins;

- (void)updateReferrerDictionary:(NSDictionary *)dictionary fromOnlineGateway:(OnlineGateway *)key;
- (void)updateSlider:(VCSlider *)slider;
@end

