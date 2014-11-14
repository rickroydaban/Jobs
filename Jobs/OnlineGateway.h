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
@class Employment;
@class SavedSearch;

@interface OnlineGateway : NSObject<NSURLConnectionDataDelegate>

+ (OnlineGateway *)sharedOnlineGateway:(AppDelegate *)appDelegate;

- (NSString *)resetPasswordWithEmail:(NSString *)email;
- (JobDetail *)getJobDetailById:(int)jobId;
- (NSMutableArray *)getLocationSuggestions: (NSString *)searched;
- (NSMutableArray *)getAdvanceSearchResults:(NSString *)searched in:(NSString *)searchIn location:(NSString *)location radius:(NSString *)radius jobType:(NSString *)jobType country:(NSString *)country postedWithin:(NSString *)postedWithin;
- (id)authenticateUserName:(NSString *)username password:(NSString *)password;
- (NSArray *)getReferrerList;
- (NSArray *)getDocuments;
- (id)getEmployments;
- (NSString *)deleteEmploymentWithID:(NSString *)employmentID;
- (id)getApplications;
- (id)getSavedSearches;
- (NSString *)deleteSavedSearchesWithJBEID:(NSString *)jbeID;
- (NSString *)changePassword:(NSString *)oldPassword to:(NSString *)newPassword;
- (NSString *)saveCandidateDetailsWithUser:(User *)user;

- (id)saveEmploymentWithJSONContents:(NSString *)jsonContents;
- (id)saveSavedSearchesWithJSONContents:(NSString *)jsonContents;

@end
