//
//  AppDelegate.h
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//
// AppDelegate is theoritically accessible everywhere  in the controller classes so CLASSES THAT NEEDS TO BE GLOBALLY ACCESSIBLE MUST BE DECLARED HERE
// to get this instance from a view controller, JUST CALL [self sharedApplication].delegate

/************************* SUPER CLASSES *************************/
//    VCPage === view controllers that may have tableviewcontrollers
//    VCList === tableviewcontrollers with dynamic cells
//    VCDetail == tableviewcontrollers with static cells

/************************ IMPORTANT NOTE ************************/
//    initial view controller must be a VCSlider class and should initialize self's slider property

#import "OnlineGateway.h"
#import "OfflineGateway.h"
#import "UserChoicesFactory.h"
#import "PageNavigatorFactory.h"
#import "CurrencyList.h"
#import "VCSlider.h"
#import "CountryList.h"
@class User;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

//important classes
@property (strong, nonatomic, readonly) VCSlider *propSlider;
@property (strong, nonatomic, readonly) OnlineGateway *propGatewayOnline;
@property (strong, nonatomic, readonly) OfflineGateway *propGatewayOffline;
@property (strong, nonatomic) PageNavigatorFactory *propPageNavigator;
@property (strong, nonatomic) NSMutableArray *languageChangeObservables; //list of labels to change on language change

//detail classes
@property (strong, nonatomic) NSDateFormatter *propDateFormatVelosi;
@property (strong, nonatomic, readonly) UserChoicesFactory *propUserDetails;
//@property (strong, nonatomic) User *propUser;
@property (strong, nonatomic, readonly) CurrencyList *propCurrency;
@property (strong, nonatomic, readonly) CountryList *propCountries;
@property (strong, nonatomic, readonly) NSArray *propListReferrers, *propListSearchIns, *propListJobTypes, *propListPostedWithins;
@property (strong, nonatomic, readonly) NSDictionary *propDictReferrers, *propDictSearchIns, *propDictJobTypes, *propDictPostedWithins;

//required by IOS
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *errorTitle, *messageErrorGeneral, *messageSaveSuccessful, *cancelButton;


//Setup methods which will be triggered only once
- (void)setupOnApplicationLaunchReferrerDictionary:(NSDictionary *)dictionary fromOnlineGateway:(OnlineGateway *)key;
- (void)setupOnSliderOnLoad:(VCSlider *)slider;
@end

