//
//  OfflineGateway.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/1/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

//Only the user id will be saved in the user defaults to save space since we need to refresh the data for every viewdidload in the user detail page using the saved id here

#define SESSION @"sessionkey"

#import "OfflineGateway.h"
#import "User.h"
#import "AppDelegate.h"

@interface OfflineGateway(){
    NSUserDefaults *_prefs;
    AppDelegate *_appDelegate;
}
@end

@implementation OfflineGateway

static OfflineGateway *sharedOfflineGateway = nil;

+ (OfflineGateway *)sharedOfflineGateway:(AppDelegate *)appDelegate{
    if(sharedOfflineGateway == nil)
        sharedOfflineGateway = [[super alloc] initWithAppDelegate:appDelegate];
    
    return sharedOfflineGateway;
}


-(instancetype) initWithAppDelegate:(AppDelegate *)appDelegate{
    if(self = [super init]){
        _prefs = [NSUserDefaults standardUserDefaults];
        _appDelegate = appDelegate;
    }
    return self;
}

- (void)saveUserDataWithID:(NSString *)userID{
    [_prefs setObject:userID forKey:SESSION];
}

- (BOOL)isLoggedIn{
    return ([_prefs objectForKey:SESSION] != nil)?YES:NO;
}

- (void)logout{
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]];
}

- (NSString *)getUserID{
    return [NSString stringWithFormat:@"%@",[_prefs objectForKey:SESSION]];
}

@end
