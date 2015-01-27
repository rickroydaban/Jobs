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
    return [self NSStringFromObject:[_dictionary objectForKey:@"CandidateID"]];
}

- (NSString *)propPercentComplete{
    return [self NSStringFromObject:[_dictionary objectForKey:@"PercentComplete"]];
}

- (NSString *)propFirstName{
    return [self NSStringFromObject:[_dictionary objectForKey:@"FirstName"]];
}

- (NSString *)propLastName{
    return [self NSStringFromObject:[_dictionary objectForKey:@"LastName"]];
}

- (NSString *)propEmail{
    return [self NSStringFromObject:[_dictionary objectForKey:@"Email"]];
}

- (NSString *)propAltEmail{
    return [self NSStringFromObject:[_dictionary objectForKey:@"Email2"]];
}

- (NSString *)propGenderID{
    return [self NSStringFromObject:[[_dictionary objectForKey:@"GenderSex"] objectForKey:@"GenderID"]];
}

- (NSString *)propGenderName{
    return [self NSStringFromObject:[[_dictionary objectForKey:@"GenderSex"] objectForKey:@"GenderName"]];
}


- (NSString *)propPhone{
    return [self NSStringFromObject:[_dictionary objectForKey:@"Phone"]];
}

- (NSString *)propAltPhone{
    return [self NSStringFromObject:[_dictionary objectForKey:@"Phone2"]];
}

- (NSString *)propMobile{
    return [self NSStringFromObject:[_dictionary objectForKey:@"Mobile"]];
}

- (NSString *)propBirthdate{
    return [self NSStringFromObject:[_dictionary objectForKey:@"DOB"]];
}

- (NSString *)propAddress{
    return [self NSStringFromObject:[_dictionary objectForKey:@"Address"]];
}

- (NSString *)propCity{
    return [self NSStringFromObject:[_dictionary objectForKey:@"TownCity"]];
}

- (NSString *)propCountryState{
    return [self NSStringFromObject:[_dictionary objectForKey:@"CountyState"]];
}

- (NSString *)propPostCode{
    return [self NSStringFromObject:[_dictionary objectForKey:@"Postcode"]];
}

- (NSString *)propCountryID{
    return [self NSStringFromObject:[[_dictionary objectForKey:@"Country"] objectForKey:@"CountryID"]];
}

- (NSString *)propLinkedIn{
    return [self NSStringFromObject:[_dictionary objectForKey:@"LinkedIn"]];
}

- (NSString *)propTwitter{
    return [self NSStringFromObject:[_dictionary objectForKey:@"Twitter"]];
}

- (NSString *)propSkype{
    return [self NSStringFromObject:[_dictionary objectForKey:@"Skype"]];
}

- (BOOL)propIsEUAuthorized{
    return [[_dictionary objectForKey:@"EUAuthorised"] boolValue];
}

- (NSString *)propUniversity{
    return [self NSStringFromObject:[_dictionary objectForKey:@"UniversityAttended"]];
}

- (NSString *)propSubject{
    return [self NSStringFromObject:[_dictionary objectForKey:@"AcademicSubject"]];
}

- (NSString *)propYearGraduated{
    return [self NSStringFromObject:[_dictionary objectForKey:@"GraduationYear"]];
}

- (NSString *)propEducationID{
    return [self NSStringFromObject:[[_dictionary objectForKey:@"Education"] objectForKey:@"EducationID"]];
}

- (NSString *)propDrivingLicenseID{
    return [self NSStringFromObject:[[_dictionary objectForKey:@"DrivingLicense"] objectForKey:@"StatusID"]];
}

- (NSString *)propNationalityID{
    return [self NSStringFromObject:[_dictionary objectForKey:@"NationalityID"]];
}

- (NSString *)propEthnicityID{
    return [self NSStringFromObject:[[_dictionary objectForKey:@"Ethnicity"] objectForKey:@"EthnicityID"]];
}

- (NSString *)propReferrerID{
    return [self NSStringFromObject:[_dictionary objectForKey:@"ReferrerID"]];
}

- (NSString *)propMaritalStatusID{
    return [self NSStringFromObject:[[_dictionary objectForKey:@"MaritalStatus"] objectForKey:@"StatusID"]];
}

- (NSString *)propPreferredLocations{
    return [self NSStringFromObject:[_dictionary objectForKey:@"PreferredLocation"]];
}

- (NSString *)propWillingToRelocateID{
    return [self NSStringFromObject:[[_dictionary objectForKey:@"Relocate"] objectForKey:@"StatusID"]];
}

- (NSString *)propNoticePeriodID{
    return [self NSStringFromObject:[[_dictionary objectForKey:@"Availability"] objectForKey:@"AvailabilityID"]];
}

- (NSString *)propAvailableFrom{
    return [self NSStringFromObject:[_dictionary objectForKey:@"AvailableFrom"]];
}

- (NSString *)propLanguages{
    return [self NSStringFromObject:[_dictionary objectForKey:@"Languages"]];
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
    return [self NSStringFromObject:[_dictionary objectForKey:@"PreferredJobTitles"]];
}

- (NSString *)propCurrency{
    return [self NSStringFromObject:[[_dictionary objectForKey:@"Salary"] objectForKey:@"SalaryCurrency"]];
}

- (NSString *)propSalaryFrom{
    return [self NSStringFromObject:[[_dictionary objectForKey:@"Salary"] objectForKey:@"SalaryFrom"]];
}

- (NSString *)propSalaryTo{
    return [self NSStringFromObject:[[_dictionary objectForKey:@"Salary"] objectForKey:@"SalaryTo"]];
}

- (NSString *)propSalaryTypeID{
    return [self NSStringFromObject:[[[_dictionary objectForKey:@"Salary"] objectForKey:@"SalaryType"] objectForKey:@"SalaryTypeID"]];
}

- (NSString *)propMainSkills{
    return [self NSStringFromObject:[_dictionary objectForKey:@"MainSkills"]];
}

//all objects that will be used as a value for uitextfields must first call this value to prevent the application from force stop
- (NSString *)NSStringFromObject:(id)object{
    return [NSString stringWithFormat:@"%@",object];
}

- (NSString *)jsonFromUserWithFirstName:(NSString *)firstName lastName:(NSString *)lastName email:(NSString *)email altEmail:(NSString *)altEmail genderID:(NSNumber *)genderID gender:(NSString *)gender phone:(NSString *)phone altPhone:(NSString *)altPhone mobile:(NSString *)mobile bday:(NSString *)bday address:(NSString *)address city:(NSString *)city countryState:(NSString *)countryState postcode:(NSString *)postcode countryID:(NSNumber *)countryID country:(NSString *)country linkedIn:(NSString *)linkedIn twitter:(NSString *)twitter skype:(NSString *)skype isEUAuthorized:(NSNumber *)isEUAuthorized university:(NSString *)university subject:(NSString *)subject yearGraduated:(NSNumber *)yearGraduated educationID:(NSNumber *)educationID education:(NSString *)education drivingLicenseID:(NSNumber *)drivingLicenseID drivingLicense:(NSString *)drivingLicense nationalityID:(NSNumber *)nationalityID nationality:(NSString *)nationality ethnicityID:(NSNumber *)ethnicityID ethnicity:(NSString *)etchnicity referrerID:(NSNumber *)referrerID referrer:(NSString *)referrer maritalStatusID:(NSNumber *)maritalStatusID maritalStatus:(NSString *)maritalStatus preferredLocations:(NSString *)preferredLocations willingToRelocateID:(NSNumber *)willingToRelocateID willingToRelocate:(NSString *)willingToRelocate noticePeriodID:(NSNumber *)noticePeriodID noticePeriod:(NSString *)noticePeriod availableFrom:(NSString *)availableFrom languages:(NSString *)languages isAlertsAllowed:(NSNumber *)isAlertsAllowed isPermanent:(NSNumber *)isPermanent isTemporary:(NSNumber *)isTemporary isContract:(NSNumber *)isContract isPartTime:(NSNumber *)isPartTime jobTitles:(NSString *)jobTitles currencyThree:(NSString *)currencyThree salaryFrom:(NSNumber *)salaryFrom salaryTo:(NSNumber *)salaryTo salaryTypeID:(NSNumber *)salaryTypeID salaryType:(NSString *)salaryType mainSkills:(NSString *)mainSkills{

    [_dictionary setValue:firstName forKey:@"FirstName"];
    [_dictionary setValue:lastName forKey:@"LastName"];
    [_dictionary setValue:email forKey:@"Email"];
    [_dictionary setValue:altEmail forKey:@"Email2"];
    [_dictionary setValue:phone forKey:@"Phone"];
    [_dictionary setValue:altPhone forKey:@"Phone2"];
    [_dictionary setValue:mobile forKey:@"Mobile"];
    [_dictionary setValue:@"\/Date(1413882540000+0100)\/" forKey:@"DOB"];
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
    [_dictionary setValue:@"\/Date(1413882540000+0100)\/" forKey:@"AvailableFrom"];
    [_dictionary setValue:languages forKey:@"Languages"];
    [_dictionary setValue:jobTitles forKey:@"PreferredJobTitles"];
    [_dictionary setValue:mainSkills forKey:@"MainSkills"];
    //booleans
    [_dictionary setValue:isEUAuthorized forKey:@"EUAuthorised"];
    [_dictionary setValue:isAlertsAllowed forKey:@"SendEmails"];
    [_dictionary setValue:isAlertsAllowed forKey:@"SendSMS"];
    [_dictionary setValue:isPermanent forKey:@"Permanent"];
    [_dictionary setValue:isTemporary forKey:@"Temporary"];
    [_dictionary setValue:isContract forKey:@"Contract"];
    [_dictionary setValue:isPartTime forKey:@"PartTime"];
    //dictionaries
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[genderID,genderID,gender] forKeys:@[@"Gender",@"GenderID",@"GenderName"]] forKey:@"GenderSex"];
    [_dictionary setValue:genderID forKey:@"GenderSexID"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[@"XX",@"XXX",countryID,country,@"",[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],@""] forKeys:@[@"Country2",@"Country3",@"CountryID",@"CountryName",@"DialCode",@"GMT",@"RegionID",@"RegionName"]] forKey:@"Country"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[education,educationID] forKeys:@[@"Description",@"EducationID"]] forKey:@"Education"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[drivingLicenseID,drivingLicenseID,drivingLicense] forKeys:@[@"Status",@"StatusID",@"StatusName"]] forKey:@"DrivingLicense"];
    [_dictionary setValue:drivingLicenseID forKey:@"DrivingLicenseID"];
    [_dictionary setValue:nationalityID forKey:@"NationalityID"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[ethnicityID,etchnicity] forKeys:@[@"EthnicityID",@"EthnicityName"]] forKey:@"Ethnicity"];
    [_dictionary setValue:referrerID forKey:@"ReferrerID"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[maritalStatusID,maritalStatusID,maritalStatus] forKeys:@[@"Status",@"StatusID",@"StatusName"]] forKey:@"MaritalStatus"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[willingToRelocateID,willingToRelocateID,willingToRelocate] forKeys:@[@"Status",@"StatusID",@"StatusName"]] forKey:@"Relocate"];
    [_dictionary setValue:willingToRelocateID forKey:@"RelocateID"];
    [_dictionary setValue:noticePeriodID forKey:@"AvailabilityID"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[noticePeriodID,noticePeriodID,noticePeriod] forKeys:@[@"Availability",@"AvailabilityID",@"AvailabilityName"]] forKey:@"Availability"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[currencyThree,salaryFrom,salaryTo,[NSDictionary dictionaryWithObjects:@[salaryTypeID,salaryTypeID] forKeys:@[@"SalaryType",@"SalaryTypeID"]]] forKeys:@[@"SalaryCurrency",@"SalaryFrom",@"SalaryTo",@"SalaryType"]] forKey:@"Salary"];

    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:_dictionary options:0 error:nil] encoding:NSUTF8StringEncoding];
}

@end
