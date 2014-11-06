//
//  OnlineGateway.h
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AppDelegate;
@class JobDetail;
@class User;

@interface OnlineGateway : NSObject

+ (OnlineGateway *)sharedOnlineGateway:(AppDelegate *)appDelegate;

- (JobDetail *)getJobDetailById:(int)jobId;
- (NSMutableArray *)getLocationSuggestions: (NSString *)searched;
- (NSMutableArray *)getAdvanceSearchResults:(NSString *)searched in:(NSString *)searchIn location:(NSString *)location radius:(NSString *)radius jobType:(NSString *)jobType country:(NSString *)country postedWithin:(NSString *)postedWithin;
- (id)authenticateUserName:(NSString *)username password:(NSString *)password;
- (NSArray *)getReferrerList;
- (NSArray *)getDocuments;
- (NSString *)saveCandidateDetailsWithUser:(User *)user;


@end
