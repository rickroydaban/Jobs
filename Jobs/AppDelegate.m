//
//  AppDelegate.m
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "AppDelegate.h"
#import "CurrencyList.h"

@interface AppDelegate (){
    
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _propListCountries = [[CountryList alloc] init];
    _propListSearchIns = @[@"Job Title and Description", @"Job Title", @"Job Description"];
    _propDictSearchIns = [NSDictionary dictionaryWithObjects:@[@"0", @"1", @"2"] forKeys:_propListSearchIns];
    _propListJobTypes = @[@"Permanent", @"Contract", @"Temporary", @"Part time", @"Ad hoc", @"Any", @"Unknown"];
    _propDictJobTypes = [NSDictionary dictionaryWithObjects:@[@"1", @"2", @"3", @"4", @"5", @"9", @"0"] forKeys:_propListJobTypes];
    _propListPostedWithins = @[@"Any", @"42 Days", @"35 Days", @"28 Days", @"21 Days", @"14 Days", @"7 Days",@"1 Day"];
    _propDictPostedWithins = [NSDictionary dictionaryWithObjects:@[@"0", @"42", @"35", @"28", @"21", @"14", @"7", @"1"] forKeys:_propListPostedWithins];

    
    _propUserDetails = [[UserDetails alloc] init];
    _propGatewayOnline = [OnlineGateway sharedOnlineGateway:self];
    _propGatewayOffline = [OfflineGateway sharedOfflineGateway:self];
    self.propDateFormatVelosi = [[NSDateFormatter alloc] init];
    self.propDateFormatVelosi.dateFormat = @"dd/MMM/yyyy";
    self.propPageNavigator = [UserPageNavigators sharedNavigators];
//    _propListReferrers = [self.propGatewayOnline getReferrerList];
    _propListCurrency = [[CurrencyList alloc] init];
        
    return YES;
}

- (void)updateSlider:(VCSlider *)slider{
    _propSlider = slider;
}

- (void)updateReferrerDictionary:(NSDictionary *)dictionary fromOnlineGateway:(OnlineGateway *)key{
    _propDictReferrers = dictionary;
}

@end
