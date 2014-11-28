//
//  Language.h
//  Jobs
//
//  Created by Rick Royd Aban on 11/28/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

@protocol Language <NSObject>

- (NSString *)name;

@required
//sidebar items
- (NSString *)home;
- (NSString *)advanceSearch;
- (NSString *)profile;
- (NSString *)login;
- (NSString *)myDetails;
- (NSString *)myDocuments;
- (NSString *)myEmployments;
- (NSString *)myApplications;
- (NSString *)mySavedSearches;
- (NSString *)changePassword;
- (NSString *)deleteAccount;
- (NSString *)logout;
- (NSString *)links;
- (NSString *)aboutUs;
- (NSString *)cvHelp;
- (NSString *)news;
- (NSString *)terms;
- (NSString *)privacy;
- (NSString *)copyright;
- (NSString *)disclaimer;
- (NSString *)securityPolicy;

@end
