//
//  OfflineGateway.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/1/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "User.h"

@interface OfflineGateway : NSObject

+ (OfflineGateway *)sharedOfflineGateway:(AppDelegate *)appDelegate;

- (void)saveUserDataWithID:(NSString *)userID;
- (void)updatePreviouslyUsedUsername:(NSString *)username;
- (BOOL)isLoggedIn;
- (void)logout;
- (NSString *)getUserID;
- (NSString *)getPrevUsername;

@end
