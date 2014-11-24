//
//  AppDelegate.h
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//
// Every view controller must have the instance of this class
// Subclassing the VCPage (designed parent class for view controllers), VCUserTables (designed parent class for tableview controllers) and VCTableViewDetails (designed for tableview controllers of static cells) will get the instance of this class so subclasses do not need to get the instance of this class anymore
// AppDelegate is theoritically accessible everywhere  in the controller classes in the app so IMPORTANT CLASSES ARE MADE TO BE ACCESSIBLE HERE

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

//important classes
@property (strong, nonatomic, readonly) VCSlider *propSlider;
@property (strong, nonatomic, readonly) OnlineGateway *propGatewayOnline;
@property (strong, nonatomic, readonly) OfflineGateway *propGatewayOffline;
@property (strong, nonatomic) UserPageNavigators *propPageNavigator;

//detail classes
@property (strong, nonatomic) NSDateFormatter *propDateFormatVelosi;
@property (strong, nonatomic, readonly) UserDetails *propUserDetails;
@property (strong, nonatomic) User *propUser;
@property (strong, nonatomic, readonly) CurrencyList *propCurrency;
@property (strong, nonatomic, readonly) CountryList *propCountries;
@property (strong, nonatomic, readonly) NSArray *propListReferrers, *propListSearchIns, *propListJobTypes, *propListPostedWithins;
@property (strong, nonatomic, readonly) NSDictionary *propDictReferrers, *propDictSearchIns, *propDictJobTypes, *propDictPostedWithins;

//required by IOS
@property (strong, nonatomic) UIWindow *window;



//Setup methods which will be triggered only once
- (void)setupOnApplicationLaunchReferrerDictionary:(NSDictionary *)dictionary fromOnlineGateway:(OnlineGateway *)key;
- (void)setupOnSliderOnLoad:(VCSlider *)slider;
@end

