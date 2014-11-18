//
//  User.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/1/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ObjectPair;

@interface User : NSObject

@property (strong, nonatomic) NSMutableDictionary *dictionary;

- (User *)initWithDictionary:(NSDictionary *)dictionary;

- (NSString *)propID;
- (NSString *)propPercentComplete;
- (NSString *)propFirstName;
- (NSString *)propLastName;
- (NSString *)propEmail;
- (NSString *)propAltEmail;
- (NSString *)propGenderID;
- (NSString *)propPhone;
- (NSString *)propAltPhone;
- (NSString *)propMobile;
- (NSString *)propBirthdate;
- (NSString *)propAddress;
- (NSString *)propCity;
- (NSString *)propCountryState;
- (NSString *)propPostCode;
- (NSString *)propCountryID;
- (NSString *)propLinkedIn;
- (NSString *)propTwitter;
- (NSString *)propSkype;
- (BOOL)propIsEUAuthorized;
- (NSString *)propUniversity;
- (NSString *)propSubject;
- (NSString *)propYearGraduated;
- (NSString *)propEducationID;
- (NSString *)propDrivingLicenseID;
- (NSString *)propNationalityID;
- (NSString *)propEthnicityID;
- (NSString *)propReferrerID;
- (NSString *)propMaritalStatusID;
- (NSString *)propPreferredLocations;
- (NSString *)propWillingToRelocateID;
- (NSString *)propNoticePeriodID;
- (NSString *)propAvailableFrom;
- (NSString *)propLanguages;
- (BOOL)propIsAlertsAllowed;
- (BOOL)propIsPermanent;
- (BOOL)propIsTemporary;
- (BOOL)propIsContract;
- (BOOL)propIsPartTime;
- (NSString *)propJobTitles;
- (NSString *)propCurrency;
- (NSString *)propSalaryFrom;
- (NSString *)propSalaryTo;
- (NSString *)propSalaryTypeID;
- (NSString *)propMainSkills;

- (NSString *)jsonFromUserWithFirstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email altEmail:(NSString *)altEmail genderID:(NSString *)genderID gender:(NSString *)gender phone:(NSString *)phone altPhone:(NSString *)altPhone mobile:(NSString *)mobile bday:(NSString *)bday address:(NSString *)address city:(NSString *)city countryState:(NSString *)countryState postcode:(NSString *)postcode countryDictionary:(NSDictionary *)country linkedIn:(NSString *)linkedIn twitter:(NSString *)twitter skype:(NSString *)skype isEUAuthorized:(BOOL)isEUAuthorized university:(NSString *)university subject:(NSString *)subject yearGraduated:(NSString *)yearGraduated educationID:(NSString *)educationID education:(NSString *)education drivingLicenseID:(NSString *)drivingLicenseID drivingLicense:(NSString *)drivingLicense nationalityID:(NSString *)nationalityID nationality:(NSString *)nationality ethnicityID:(NSString *)ethnicityID ethnicity:(NSString *)etchnicity referrerID:(NSString *)referrerID referrer:(NSString *)referrer maritalStatusID:(NSString *)maritalStatusID maritalStatus:(NSString *)maritalStatus preferredLocations:(NSString *)preferredLocations willingToRelocateID:(NSString *)willingToRelocateID willingToRelocate:(NSString *)willingToRelocate noticePeriodID:(NSString *)noticePeriodID noticePeriod:(NSString *)noticePeriod availableFrom:(NSString *)availableFrom languages:(NSString *)languages isAlertsAllowed:(BOOL)isAlertsAllowed isPermanent:(BOOL)isPermanent isTemporary:(BOOL)isTemporary isContract:(BOOL)isContract isPartTime:(BOOL)isPartTime jobTitles:(NSString *)jobTitles currencyID:(NSString *)currencyID currency:(NSString *)currency salaryFrom:(NSString *)salaryFrom salaryTo:(NSString *)salaryTo salaryTypeID:(NSString *)salaryTypeID salaryType:(NSString *)salaryType mainSkills:(NSString *)mainSkills;

@end
