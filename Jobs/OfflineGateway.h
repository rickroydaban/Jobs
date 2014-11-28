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
- (BOOL)isLoggedIn;
- (void)logout;
- (NSString *)getUserID;

@end
