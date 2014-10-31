//
//  User.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/1/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *propID;

@property (strong, nonatomic) NSString *propFname;
@property (strong, nonatomic) NSString *propLname;
@property (strong, nonatomic) NSString *propEmail;
@property (strong, nonatomic) NSString *propAltEmail;
@property (strong, nonatomic) NSString *propGender;
@property (strong, nonatomic) NSString *propPhone;
@property (strong, nonatomic) NSString *propAltPhone;
@property (strong, nonatomic) NSString *propMobile;
@property (strong, nonatomic) NSString *propBday;

@property (strong, nonatomic) NSString *propAddress;
@property (strong, nonatomic) NSString *propCity;
@property (strong, nonatomic) NSString *propCountryState;
@property (strong, nonatomic) NSString *propPostCode;
@property (strong, nonatomic) NSString *propCountry;
@property (strong, nonatomic) NSString *propLinkedIn;
@property (strong, nonatomic) NSString *propTwitter;
@property (strong, nonatomic) NSString *propSkype;
@property (assign, nonatomic) BOOL propIsEUAuthorised;

@property (strong, nonatomic) NSString *propUniversity;
@property (strong, nonatomic) NSString *propSubject;
@property (strong, nonatomic) NSString *propYearGraduated;
@property (strong, nonatomic) NSString *propHEA;

@property (strong, nonatomic) NSString *propDiverLicense;
@property (strong, nonatomic) NSString *propNationality;
@property (strong, nonatomic) NSString *propEthnicity;
@property (strong, nonatomic) NSString *propReferrer;
@property (strong, nonatomic) NSString *propMaritalStatus;

@property (assign, nonatomic) BOOL propIsPermanent;
@property (assign, nonatomic) BOOL propIsContract;
@property (assign, nonatomic) BOOL propIsTemporary;
@property (assign, nonatomic) BOOL propIsPartTime;
@property (strong, nonatomic) NSString *propJobTitlePrefs;
@property (strong, nonatomic) NSString *propCurrency;
@property (strong, nonatomic) NSString *propSalaryFrom;
@property (strong, nonatomic) NSString *propSalaryTo;
@property (strong, nonatomic) NSString *propSalaryType;
@property (strong, nonatomic) NSString *propMainSkills;
@property (strong, nonatomic) NSMutableArray *propLocationPrefs;
@property (strong, nonatomic) NSString *propRelocationWillingness;
@property (strong, nonatomic) NSString *propNoticePeriod;
@property (strong, nonatomic) NSString *propAvailableFrom;
@property (strong, nonatomic) NSMutableArray *propLanguages;
@property (assign, nonatomic) BOOL propAllowAlerts;

- (User *)initWithID:(NSString *)userId fname:(NSString *)fname lname:(NSString *)lname email:(NSString *)email altEmail:(NSString *)altEmail gender:(NSString *)gender phone:(NSString *)phone altPhone:(NSString *)altPhone mobile:(NSString *)mobile birthday:(NSString *) bday address:(NSString *)address city:(NSString *)city countryState:(NSString *)countryState postCode:(NSString *)postCode country:(NSString *)country linkedIn:(NSString *)linkedIn twitter:(NSString *)twitter skype:(NSString *)skype isEUAuthorised:(BOOL)isEUAuthorized university:(NSString *)university subject:(NSString *)subject yearGraduated:(NSString *)yearGraduated hea:(NSString *)hea driverLicense:(NSString *)driverLicense nationality:(NSString *)nationality ethnicity:(NSString *)ethnicity referrer:(NSString *)referrer maritalStatus:(NSString *)maritalStatus isPermanent:(BOOL)isPermanent isContract:(BOOL)isContract isTemporary:(BOOL)isTemporary isPartTime:(BOOL)isPartTime jobTitlePrefs:(NSString *)jobTitlePrefs currency:(NSString *)currency salaryFrom:(NSString *)salaryFrom salaryTo:(NSString *)salaryTo salaryType:(NSString *)salaryTpe mainSkills:(NSString *)mainSkills locationPrefs:(NSMutableArray *)locationPrefs relocationWillingness:(NSString *)relocationWillingness noticePeriod:(NSString *)noticePeriod availableFrom: (NSString *)availableFrom languages:(NSMutableArray *)languages allowAlerts:(BOOL)allowAlerts;


@end
