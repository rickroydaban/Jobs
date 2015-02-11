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

//utility methods
- (NSString *)deserializeJsonDateString: (NSString *)jsonDateString;

//methods with string or null result
- (NSString *)resetPasswordWithEmail:(NSString *)email;
- (NSString *)deleteEmploymentWithID:(NSString *)employmentID;
- (NSString *)deleteSavedSearchesWithJBEID:(NSString *)jbeID;
- (NSString *)changePassword:(NSString *)oldPassword to:(NSString *)newPassword;
- (NSString *)closeAccount;

//get methods with object result
- (id)getJobDetailById:(int)jobId;
- (id)getLocationSuggestions: (NSString *)searched;
- (id)getAdvanceSearchResults:(NSString *)searched in:(NSString *)searchIn location:(NSString *)location radius:(NSString *)radius jobType:(NSString *)jobType country:(NSString *)country postedWithin:(NSString *)postedWithin;
- (id)authenticateUserName:(NSString *)username password:(NSString *)password;
- (id)getCandidateData;
- (id)getReferrerList;
- (id)getDocuments;
- (id)deleteDocumentsWithID:(NSString *)documentID;
- (id)getEmployments;
- (id)getApplications;
- (id)getSavedSearches;
- (id)changeAllSavedSearchSubscriptionForCandidateID:(NSString *)cID status:(BOOL)willSubscribe;

//post methods with object result
- (id)saveCandidateDetailsWitJSONContents:(NSString *)jsonContents;
- (id)saveDocumentWithJSONContents:(NSString *)jsonContents;
- (id)saveEmploymentWithJSONContents:(NSString *)jsonContents;
- (id)saveSavedSearchesWithJSONContents:(NSString *)jsonContents;
- (id)applyJobWithJSONContents:(NSString *)jsonContents;

@end
