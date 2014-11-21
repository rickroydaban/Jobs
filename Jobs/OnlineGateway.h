//
//  OnlineGateway.h
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AppDelegate;

@interface OnlineGateway : NSObject<NSURLConnectionDataDelegate>

+ (OnlineGateway *)sharedOnlineGateway:(AppDelegate *)appDelegate;

- (NSString *)deserializeJsonDateString: (NSString *)jsonDateString;
- (NSString *)resetPasswordWithEmail:(NSString *)email;
- (id)getJobDetailById:(int)jobId;
- (NSMutableArray *)getLocationSuggestions: (NSString *)searched;
- (NSMutableArray *)getAdvanceSearchResults:(NSString *)searched in:(NSString *)searchIn location:(NSString *)location radius:(NSString *)radius jobType:(NSString *)jobType country:(NSString *)country postedWithin:(NSString *)postedWithin;
- (id)authenticateUserName:(NSString *)username password:(NSString *)password;
- (NSArray *)getReferrerList;
- (id)getDocuments;
- (id)getEmployments;
- (NSString *)deleteEmploymentWithID:(NSString *)employmentID;
- (id)getApplications;
- (id)getSavedSearches;
- (id)changeAllSavedSearchSubscriptionForCandidateID:(NSString *)cID status:(BOOL)willSubscribe;
- (NSString *)deleteSavedSearchesWithJBEID:(NSString *)jbeID;
- (NSString *)changePassword:(NSString *)oldPassword to:(NSString *)newPassword;

- (id)saveCandidateDetailsWitJSONContents:(NSString *)jsonContents;
- (id)saveEmploymentWithJSONContents:(NSString *)jsonContents;
- (id)saveSavedSearchesWithJSONContents:(NSString *)jsonContents;

@end
