//
//  AppDelegate.m
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Parse/Parse.h>

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Parse setApplicationId:@"CrLFIojdpIQUltqfPcIaus6Ok5U63tJFWdfDL4ok" clientKey:@"A39TyCCOA8sJAw4U0H0VvogIEKG59p4IcYicbaF6"];
    
    // Register for Push Notitications
    UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                    UIUserNotificationTypeBadge |
                                                    UIUserNotificationTypeSound);
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                             categories:nil];
    [application registerUserNotificationSettings:settings];
    [application registerForRemoteNotifications];
    
    _propCountries = [[CountryList alloc] init];
    _propListSearchIns = @[@"Job Title and Description", @"Job Title", @"Job Description"];
    _propDictSearchIns = [NSDictionary dictionaryWithObjects:@[@"0", @"1", @"2"] forKeys:_propListSearchIns];
    _propListJobTypes = @[@"Permanent", @"Contract", @"Temporary", @"Part time", @"Ad hoc", @"Any", @"Unknown"];
    _propDictJobTypes = [NSDictionary dictionaryWithObjects:@[@"1", @"2", @"3", @"4", @"5", @"9", @"0"] forKeys:_propListJobTypes];
    _propListPostedWithins = @[@"Any", @"42 Days", @"35 Days", @"28 Days", @"21 Days", @"14 Days", @"7 Days",@"1 Day"];
    _propDictPostedWithins = [NSDictionary dictionaryWithObjects:@[@"0", @"42", @"35", @"28", @"21", @"14", @"7", @"1"] forKeys:_propListPostedWithins];
    
    _propUserDetails = [[UserChoicesFactory alloc] init];
    _propGatewayOnline = [OnlineGateway sharedOnlineGateway:self];
    _propGatewayOffline = [OfflineGateway sharedOfflineGateway:self];
    self.propDateFormatVelosi = [[NSDateFormatter alloc] init];
    self.propDateFormatVelosi.dateFormat = @"yyyy-MM-dd";
    self.propPageNavigator = [PageNavigatorFactory sharedNavigators];
    _propListReferrers = [self.propGatewayOnline getReferrerList];
    _propCurrency = [[CurrencyList alloc] init];
        
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}

//no private methods in app delegate

#pragma mark public methods
- (void)setupOnSliderOnLoad:(VCSlider *)slider{
    _propSlider = slider;
}

- (void)setupOnApplicationLaunchReferrerDictionary:(NSDictionary *)dictionary fromOnlineGateway:(OnlineGateway *)key{
    _propDictReferrers = dictionary;
}

@end
