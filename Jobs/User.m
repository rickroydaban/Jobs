//  User.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/1/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "User.h"

@implementation User

- (User *)initWithID:(NSString *)userId fname:(NSString *)fname lname:(NSString *)lname email:(NSString *)email altEmail:(NSString *)altEmail gender:(NSString *)gender phone:(NSString *)phone altPhone:(NSString *)altPhone mobile:(NSString *)mobile birthday:(NSString *) bday address:(NSString *)address city:(NSString *)city countryState:(NSString *)countryState postCode:(NSString *)postCode country:(NSString *)country linkedIn:(NSString *)linkedIn twitter:(NSString *)twitter skype:(NSString *)skype isEUAuthorised:(BOOL)isEUAuthorized university:(NSString *)university subject:(NSString *)subject yearGraduated:(NSString *)yearGraduated hea:(NSString *)hea driverLicense:(NSString *)driverLicense nationality:(NSString *)nationality ethnicity:(NSString *)ethnicity referrer:(NSString *)referrer maritalStatus:(NSString *)maritalStatus isPermanent:(BOOL)isPermanent isContract:(BOOL)isContract isTemporary:(BOOL)isTemporary isPartTime:(BOOL)isPartTime jobTitlePrefs:(NSString *)jobTitlePrefs currency:(NSString *)currency salaryFrom:(NSString *)salaryFrom salaryTo:(NSString *)salaryTo salaryType:(NSString *)salaryTpe mainSkills:(NSString *)mainSkills locationPrefs:(NSMutableArray *)locationPrefs relocationWillingness:(NSString *)relocationWillingness noticePeriod:(NSString *)noticePeriod availableFrom: (NSString *)availableFrom languages:(NSMutableArray *)languages allowAlerts:(BOOL)allowAlerts{
    
    self = [super init];
    
    if(self){
        self.propID = userId;
        self.propFname = fname;
        self.propLname = lname;
        self.propEmail = email;
        self.propAltEmail = altEmail;
        self.propGender = gender;
        self.propPhone = phone;
        self.propAltPhone = altPhone;
        self.propMobile = mobile;
        self.propBday = bday;
        
        self.propAddress = address;
        self.propCity = city;
        self.propCountryState = countryState;
        self.propPostCode = postCode;
        self.propCountry = country;
        self.propLinkedIn = linkedIn;
        self.propTwitter = twitter;
        self.propSkype = skype;
        self.propIsEUAuthorised = (isEUAuthorized)?YES:NO;
        
        self.propUniversity = university;
        self.propSubject = subject;
        self.propYearGraduated = yearGraduated;
        self.propHEA = hea;
        
        self.propDiverLicense = driverLicense;
        self.propNationality = nationality;
        self.propEthnicity = ethnicity;
        self.propReferrer = referrer;
        self.propMaritalStatus = maritalStatus;
        
        self.propIsPermanent = isPermanent;
        self.propIsContract = isContract;
        self.propIsTemporary = isTemporary;
        self.propIsPartTime = isPartTime;
        self.propJobTitlePrefs = jobTitlePrefs;
        self.propCurrency = currency;
        self.propSalaryFrom = salaryFrom;
        self.propSalaryTo = salaryTo;
        self.propSalaryType = salaryTpe;
        self.propMainSkills = mainSkills;
        self.propLocationPrefs = locationPrefs;
        self.propRelocationWillingness = relocationWillingness;
        self.propNoticePeriod = noticePeriod;
        self.propAvailableFrom = availableFrom;
        self.propLanguages = languages;
        self.propAllowAlerts = allowAlerts;
    }
    
    return self;
}

@end
