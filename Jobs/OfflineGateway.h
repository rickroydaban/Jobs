//
//  OfflineGateway.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/1/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@class AppDelegate;

@interface OfflineGateway : NSObject

+ (OfflineGateway *)sharedOfflineGateway:(AppDelegate *)appDelegate;

- (void)saveUserDataWithFname:(NSString *)fname lname:(NSString *)lname completion:(NSString *)completion email:(NSString *)email altEmail:(NSString *)altEmail gender:(NSString *)gender phone:(NSString *)phone altPhone:(NSString *)altPhone mobile:(NSString *)mobile birthday:(NSString *) bday address:(NSString *)address city:(NSString *)city countryState:(NSString *)countryState postCode:(NSString *)postCode country:(NSString *)country linkedIn:(NSString *)linkedIn twitter:(NSString *)twitter skype:(NSString *)skype isEUAuthorised:(BOOL)isEUAuthorized university:(NSString *)university subject:(NSString *)subject yearGraduated:(NSString *)yearGraduated hea:(NSString *)hea driverLicense:(NSString *)driverLicense nationality:(NSString *)nationality ethnicity:(NSString *)ethnicity referrer:(NSString *)referrer maritalStatus:(NSString *)maritalStatus isPermanent:(BOOL)isPermanent isContract:(BOOL)isContract isTemporary:(BOOL)isTemporary isPartTime:(BOOL)isPartTime jobTitlePrefs:(NSString *)jobTitlePrefs currency:(NSString *)currency salaryFrom:(NSString *)salaryFrom salaryTo:(NSString *)salaryTo salaryType:(NSString *)salaryTpe mainSkills:(NSString *)mainSkills locationPrefs:(NSArray *)locationPrefs relocationWillingness:(NSString *)relocationWillingness noticePeriod:(NSString *)noticePeriod availableFrom: (NSString *)availableFrom languages:(NSArray *)languages allowAlerts:(BOOL)allowAlerts;
- (BOOL)isLoggedIn;
- (void)logout;
- (NSString *)getFirstName;
- (NSString *)getLastName;
- (NSString *)getCompletionPercentage;
- (NSString *)getEmail;
- (NSString *)getAlternateEmail;
- (NSString *)getGender;
- (NSString *)getPhone;
- (NSString *)getAlternatePhone;
- (NSString *)getMobile;
- (NSString *)getBirthdate;
- (NSString *)getAddress;
- (NSString *)getCity;
- (NSString *)getCountryState;
- (NSString *)getPostcode;
- (NSString *)getCountry;
- (NSString *)getLinkedin;
- (NSString *)getTwitter;
- (NSString *)getSkype;
- (BOOL) isEUAuthorized;
- (NSString *)getUniversity;
- (NSString *)getSubject;
- (NSString *)getYearGraduated;
- (NSString *)getEducation;
- (NSString *)getDrivingLicense;
- (NSString *)getNationality;
- (NSString *)getEthnicity;
- (NSString *)getReferrer;
- (NSString *)getMaritalStatus;
- (BOOL)isPermanent;
- (BOOL)isContract;
- (BOOL)isTemporary;
- (BOOL)isPartTime;
- (NSString *)getPreferredJobTitles;
- (NSString *)getCurrency;
- (NSString *)getSalaryFrom;
- (NSString *)getSalaryTo;
- (NSString *)getSalaryType;
- (NSString *)getMainSkills;
- (NSMutableArray *)getPreferredLocations;
- (NSString *)getWillRelocate;
- (NSString *)getNoticePeriod;
- (NSString *)getAvailableFrom;
- (NSArray *)getLanguages;
- (BOOL)isAlertsAllowed;

@end
