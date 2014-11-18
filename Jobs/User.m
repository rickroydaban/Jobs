//  User.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/1/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "User.h"

@implementation User

- (User *)initWithDictionary:(NSDictionary *)dictionary{
    
    self = [super init];
    
    if(self){
        _dictionary = [dictionary mutableCopy];
    }
    
    return self;
}

- (NSString *)propID{
    return [NSString stringWithFormat:@"%@",[_dictionary objectForKey:@"CandidateID"]];
}

- (NSString *)propPercentComplete{
    return [NSString stringWithFormat:@"%@",[_dictionary objectForKey:@"PercentComplete"]];
}

- (NSString *)propFirstName{
    return [_dictionary objectForKey:@"FirstName"];
}

- (NSString *)propLastName{
    return [_dictionary objectForKey:@"LastName"];
}

- (NSString *)propEmail{
    return [_dictionary objectForKey:@"Email"];
}

- (NSString *)propAltEmail{
    return [_dictionary objectForKey:@"Email2"];
}

- (NSString *)propGenderID{
    return [[_dictionary objectForKey:@"GenderSex"] objectForKey:@"GenderID"];
}

- (NSString *)propPhone{
    return [_dictionary objectForKey:@"Phone"];
}

- (NSString *)propAltPhone{
    return [_dictionary objectForKey:@"Phone2"];
}

- (NSString *)propMobile{
    return [NSString stringWithFormat:@"%@",[_dictionary objectForKey:@"Mobile"]];
}

- (NSString *)propBirthdate{
    return [_dictionary objectForKey:@"DOB"];
}

- (NSString *)propAddress{
    return [_dictionary objectForKey:@"Address"];
}

- (NSString *)propCity{
    return [_dictionary objectForKey:@"TownCity"];
}

- (NSString *)propCountryState{
    return [_dictionary objectForKey:@"CountyState"];
}

- (NSString *)propPostCode{
    return [_dictionary objectForKey:@"Postcode"];
}

- (NSString *)propCountryID{
    return [[_dictionary objectForKey:@"Country"] objectForKey:@"CountryID"];
}

- (NSString *)propLinkedIn{
    return [_dictionary objectForKey:@"LinkedIn"];
}

- (NSString *)propTwitter{
    return [_dictionary objectForKey:@"Twitter"];
}

- (NSString *)propSkype{
    return [_dictionary objectForKey:@"Skype"];
}

- (BOOL)propIsEUAuthorized{
    return [[_dictionary objectForKey:@"EUAuthorised"] boolValue];
}

- (NSString *)propUniversity{
    return [_dictionary objectForKey:@"UniversityAttended"];
}

- (NSString *)propSubject{
    return [_dictionary objectForKey:@"AcademicSubject"];
}

- (NSString *)propYearGraduated{
    return [NSString stringWithFormat:@"%@",[_dictionary objectForKey:@"GraduationYear"]];
}

- (NSString *)propEducationID{
    return [[_dictionary objectForKey:@"Education"] objectForKey:@"EducationID"];
}

- (NSString *)propDrivingLicenseID{
    return [[_dictionary objectForKey:@"DrivingLicense"] objectForKey:@"StatusID"];
}

- (NSString *)propNationalityID{
    return [_dictionary objectForKey:@"NationalityID"];
}

- (NSString *)propEthnicityID{
    return [[_dictionary objectForKey:@"Ethnicity"] objectForKey:@"EthnicityID"];
}

- (NSString *)propReferrerID{
    return [NSString stringWithFormat:@"%@",[_dictionary objectForKey:@"ReferrerID"]];
}

- (NSString *)propMaritalStatusID{
    return [[_dictionary objectForKey:@"MaritalStatus"] objectForKey:@"StatusID"];
}

- (NSString *)propPreferredLocations{
    return [_dictionary objectForKey:@"PreferredLocation"];
}

- (NSString *)propWillingToRelocateID{
    return [[_dictionary objectForKey:@"Relocate"] objectForKey:@"StatusID"];
}

- (NSString *)propNoticePeriodID{
    return [[_dictionary objectForKey:@"Availability"] objectForKey:@"AvailabilityID"];
}

- (NSString *)propAvailableFrom{
    return [_dictionary objectForKey:@"AvailableFrom"];
}

- (NSString *)propLanguages{
    return [_dictionary objectForKey:@"Languages"];
}

- (BOOL)propIsAlertsAllowed{
    return [[_dictionary objectForKey:@"SendEmails"] boolValue];
}

- (BOOL)propIsPermanent{
    return [[_dictionary objectForKey:@"Permanent"] boolValue];
}

- (BOOL)propIsTemporary{
    return [[_dictionary objectForKey:@"Temporary"] boolValue];
}

- (BOOL)propIsContract{
    return [[_dictionary objectForKey:@"Contract"] boolValue];
}

- (BOOL)propIsPartTime{
    return [[_dictionary objectForKey:@"PartTime"] boolValue];
}

- (NSString *)propJobTitles{
    NSLog(@"%@",[_dictionary objectForKey:@"PreferredJobTitles"]);
    return [_dictionary objectForKey:@"PreferredJobTitles"];
}

- (NSString *)propCurrency{
    return [[_dictionary objectForKey:@"Salary"] objectForKey:@"SalaryCurrency"];
}

- (NSString *)propSalaryFrom{
    return [NSString stringWithFormat:@"%@",[[_dictionary objectForKey:@"Salary"] objectForKey:@"SalaryFrom"]];
}

- (NSString *)propSalaryTo{
    return [NSString stringWithFormat:@"%@",[[_dictionary objectForKey:@"Salary"] objectForKey:@"SalaryTo"]];
}

- (NSString *)propSalaryTypeID{
    return [[[_dictionary objectForKey:@"Salary"] objectForKey:@"SalaryType"] objectForKey:@"SalaryTypeID"];
}

- (NSString *)propMainSkills{
    return [_dictionary objectForKey:@"MainSkills"];
}

- (NSString *)jsonFromUserWithFirstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email altEmail:(NSString *)altEmail genderID:(NSString *)genderID gender:(NSString *)gender phone:(NSString *)phone altPhone:(NSString *)altPhone mobile:(NSString *)mobile bday:(NSString *)bday address:(NSString *)address city:(NSString *)city countryState:(NSString *)countryState postcode:(NSString *)postcode countryDictionary:(NSDictionary *)country linkedIn:(NSString *)linkedIn twitter:(NSString *)twitter skype:(NSString *)skype isEUAuthorized:(BOOL)isEUAuthorized university:(NSString *)university subject:(NSString *)subject yearGraduated:(NSString *)yearGraduated educationID:(NSString *)educationID education:(NSString *)education drivingLicenseID:(NSString *)drivingLicenseID drivingLicense:(NSString *)drivingLicense nationalityID:(NSString *)nationalityID nationality:(NSString *)nationality ethnicityID:(NSString *)ethnicityID ethnicity:(NSString *)etchnicity referrerID:(NSString *)referrerID referrer:(NSString *)referrer maritalStatusID:(NSString *)maritalStatusID maritalStatus:(NSString *)maritalStatus preferredLocations:(NSString *)preferredLocations willingToRelocateID:(NSString *)willingToRelocateID willingToRelocate:(NSString *)willingToRelocate noticePeriodID:(NSString *)noticePeriodID noticePeriod:(NSString *)noticePeriod availableFrom:(NSString *)availableFrom languages:(NSString *)languages isAlertsAllowed:(BOOL)isAlertsAllowed isPermanent:(BOOL)isPermanent isTemporary:(BOOL)isTemporary isContract:(BOOL)isContract isPartTime:(BOOL)isPartTime jobTitles:(NSString *)jobTitles currencyID:(NSString *)currencyID currency:(NSString *)currency salaryFrom:(NSString *)salaryFrom salaryTo:(NSString *)salaryTo salaryTypeID:(NSString *)salaryTypeID salaryType:(NSString *)salaryType mainSkills:(NSString *)mainSkills{

    [_dictionary setValue:firstName forKey:@"FirstName"];
    [_dictionary setValue:lastName forKey:@"LastName"];
    [_dictionary setValue:email forKey:@"Email"];
    [_dictionary setValue:altEmail forKey:@"Email2"];
    [_dictionary setValue:phone forKey:@"Phone"];
    [_dictionary setValue:altPhone forKey:@"Phone2"];
    [_dictionary setValue:mobile forKey:@"Mobile"];
    [_dictionary setValue:bday forKey:@"DOB"];
    [_dictionary setValue:address forKey:@"Address"];
    [_dictionary setValue:city forKey:@"TownCity"];
    [_dictionary setValue:countryState forKey:@"CountyState"];
    [_dictionary setValue:postcode forKey:@"Postcode"];
    [_dictionary setValue:linkedIn forKey:@"LinkedIn"];
    [_dictionary setValue:twitter forKey:@"Twitter"];
    [_dictionary setValue:skype forKey:@"Skype"];
    [_dictionary setValue:university forKey:@"UniversityAttended"];
    [_dictionary setValue:subject forKey:@"AcademicSubject"];
    [_dictionary setValue:yearGraduated forKey:@"GraduationYear"];
    [_dictionary setValue:preferredLocations forKey:@"PreferredLocation"];
    [_dictionary setValue:availableFrom forKey:@"AvailableFrom"];
    [_dictionary setValue:languages forKey:@"Languages"];
    [_dictionary setValue:jobTitles forKey:@"PreferredJobTitles"];
    [_dictionary setValue:mainSkills forKey:@"MainSkills"];
    //booleans
    [_dictionary setValue:(isEUAuthorized)?@"true":@"false" forKey:@"EUAuthorised"];
    [_dictionary setValue:(isAlertsAllowed)?@"true":@"false" forKey:@"SendEmails"];
    [_dictionary setValue:(isAlertsAllowed)?@"true":@"false" forKey:@"SendSMS"];
    [_dictionary setValue:(isPermanent)?@"true":@"false" forKey:@"Permanent"];
    [_dictionary setValue:(isTemporary)?@"true":@"false" forKey:@"Temporary"];
    [_dictionary setValue:(isContract)?@"true":@"false" forKey:@"Contract"];
    [_dictionary setValue:(isPartTime)?@"true":@"false" forKey:@"PartTime"];
    //dictionaries
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[genderID,genderID,genderID] forKeys:@[@"Gender",@"GenderID",@"GenderName"]] forKey:@"GenderSex"];
    [_dictionary setValue:genderID forKey:@"GenderSexID"];
    [_dictionary setValue:country forKey:@"Country"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[education,educationID] forKeys:@[@"Description",@"EducationID"]] forKey:@"Education"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[drivingLicenseID,drivingLicenseID,drivingLicense] forKeys:@[@"Status",@"StatusID",@"StatusName"]] forKey:@"DrivingLicense"];
    [_dictionary setValue:drivingLicenseID forKey:@"DrivingLicenseID"];
    [_dictionary setValue:nationalityID forKey:@"NationalityID"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[ethnicityID,etchnicity] forKeys:@[@"EthnicityID",@"EthnicityName"]] forKey:@"Ethnicity"];
    [_dictionary setValue:referrerID forKey:@"ReferrerID"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[maritalStatusID,maritalStatusID,maritalStatusID] forKeys:@[@"Status",@"StatusID",@"StatusName"]] forKey:@"MaritalStatus"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[willingToRelocateID,willingToRelocateID,willingToRelocate] forKeys:@[@"Status",@"StatusID",@"StatusName"]] forKey:@"Relocate"];
    [_dictionary setValue:willingToRelocateID forKey:@"RelocateID"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[noticePeriodID,noticePeriodID,noticePeriod] forKeys:@[@"Availability",@"AvailabilityID",@"AvailabilityName"]] forKey:@"Availability"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[currencyID,salaryFrom,salaryTo,[NSDictionary dictionaryWithObjects:@[salaryTypeID,salaryTypeID] forKeys:@[@"SalaryType",@"SalaryTypeID"]]] forKeys:@[@"SalaryCurrency",@"SalaryFrom",@"SalaryTo",@"SalaryType"]] forKey:@"Salary"];

    NSLog(@"%@",[[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:_dictionary options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding]);
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:_dictionary options:0 error:nil] encoding:NSUTF8StringEncoding];
}

@end
