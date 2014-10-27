//
//  AppDelegate.m
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "AppDelegate.h"
#import "CurrencyList.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _userDetails = [[UserDetails alloc] init];
    _onlineGateway = [OnlineGateway sharedOnlineGateway:self];
    _offlineGateway = [OfflineGateway sharedOfflineGateway:self];
    self.velosiDateFormat = [[NSDateFormatter alloc] init];
    self.velosiDateFormat.dateFormat = @"dd/MMM/yyyy";
    self.pageNavigator = [UserPageNavigators sharedNavigators];
    _referrerList = [self.onlineGateway getReferrerList];
    _currencyList = [[CurrencyList alloc] init];
    
    if(self.referrerList == nil)
        [[[UIAlertView alloc] initWithTitle:nil message:@"Cannot connect to server" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
    
    return YES;
}

- (void)updateSlider:(VCSlider *)slider{
    _slider = slider;
}

- (void)updateReferrerDictionaryFromOnlineGateway:(OnlineGateway *)key dictionary:(NSDictionary *)dictionary{
    _referrerDictionary = dictionary;
}

@end
