//
//  OfflineGateway.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/1/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#define SESSION @"sessionkey"
#define USERCOMPLETENESS @"completionPercentage"
#define USERFIRSTNAME @"userFname"
#define USERLASTNAME @"userLname"
#define USEREMAIL @"userEmail"
#define USERALTEMAIL @"userAltemail"
#define USERGENDER @"userGender"
#define USERPHONE @"userPhone"
#define USERALTPHONE @"userAltphone"
#define USERMOBILE @"userMobile"
#define USERBIRTHDAY @"userBday"

#define USERADDRESS @"userAddress"
#define USERCITY @"userCity"
#define USERCOUNTRYSTATE @"cuserCountrystate"
#define USERPOSTCODE @"userPostcode"
#define USERCOUNTRY @"userCountry"
#define USERLINKEDIN @"userLinkedin"
#define USERTWITTER @"userTwitter"
#define USERSKYPE @"userSkype"
#define USEREUAUTHORIZED @"userIsauthorized"

#define USERUNIVERSITY @"userUniversity"
#define USERSUBJECT @"userSubject"
#define USERYEARGRADUATED @"userYearGraduated"
#define USEREDUCATION @"userEducation"

#define USERLICENSE @"userLicense"
#define USERNATIONALITY @"userNationality"
#define USERETHNICITY @"userEthnicity"
#define USERREFERER @"userReferrer"
#define USERSTATUS @"userStatus"

#define USERISPERMANENT @"userIspermanent"
#define USERISCONTRACT @"userIscontact"
#define USERISTEMPORARY @"userIstemporary"
#define USERISPARTTIME @"userIsparttime"
#define USERJOBPREFS @"userJobprefs"
#define USERCURRENCY @"userCurrency"
#define USERSALARYFROM @"userSalaryfrom"
#define USERSALARYTO @"userSalaryto"
#define USERSALARYTYPE @"userSalarytype"
#define USERMAINSKILLS @"userMainskills"
#define USERLOCATIONPREFS @"userLocationprefs"
#define USERRELOCATE @"userRelocate"
#define USERNOTICE @"userNotice"
#define USERAVAILABILITY @"userAvailability"
#define USERLANGUAGES @"userLanguages"
#define USERALERTS @"userAlerts"


#import "OfflineGateway.h"
#import "User.h"
#import "AppDelegate.h"

@interface OfflineGateway(){
    NSUserDefaults *_prefs;
    AppDelegate *_appDelegate;
}
@end

@implementation OfflineGateway

static OfflineGateway *sharedOfflineGateway = nil;

+ (OfflineGateway *)sharedOfflineGateway:(AppDelegate *)appDelegate{
    if(sharedOfflineGateway == nil)
        sharedOfflineGateway = [[super alloc] initWithAppDelegate:appDelegate];
    
    return sharedOfflineGateway;
}


-(instancetype) initWithAppDelegate:(AppDelegate *)appDelegate{
    if(self = [super init]){
        _prefs = [NSUserDefaults standardUserDefaults];
        _appDelegate = appDelegate;
    }
    return self;
}

- (void)saveUserDataWithID:(NSString *)userID fname:(NSString *)fname lname:(NSString *)lname completion:(NSString *)completion email:(NSString *)email altEmail:(NSString *)altEmail gender:(NSString *)gender phone:(NSString *)phone altPhone:(NSString *)altPhone mobile:(NSString *)mobile birthday:(NSString *) bday address:(NSString *)address city:(NSString *)city countryState:(NSString *)countryState postCode:(NSString *)postCode country:(NSString *)country linkedIn:(NSString *)linkedIn twitter:(NSString *)twitter skype:(NSString *)skype isEUAuthorised:(BOOL)isEUAuthorized university:(NSString *)university subject:(NSString *)subject yearGraduated:(NSNumber *)yearGraduated hea:(NSString *)hea driverLicense:(NSString *)driverLicense nationality:(NSString *)nationality ethnicity:(NSString *)ethnicity referrer:(NSNumber *)referrer maritalStatus:(NSString *)maritalStatus isPermanent:(BOOL)isPermanent isContract:(BOOL)isContract isTemporary:(BOOL)isTemporary isPartTime:(BOOL)isPartTime jobTitlePrefs:(NSString *)jobTitlePrefs currency:(NSString *)currency salaryFrom:(NSNumber *)salaryFrom salaryTo:(NSNumber *)salaryTo salaryType:(NSString *)salaryTpe mainSkills:(NSString *)mainSkills locationPrefs:(NSArray *)locationPrefs relocationWillingness:(NSString *)relocationWillingness noticePeriod:(NSString *)noticePeriod availableFrom: (NSString *)availableFrom languages:(NSArray *)languages allowAlerts:(BOOL)allowAlerts{
    
    [_prefs setObject:userID forKey:SESSION];
    [_prefs setObject:completion forKey:USERCOMPLETENESS];
    [_prefs setObject:fname forKey:USERFIRSTNAME];
    [_prefs setObject:lname forKey:USERLASTNAME];
    [_prefs setObject:email forKey:USEREMAIL];
    [_prefs setObject:altEmail forKey:USERALTEMAIL];
    [_prefs setObject:gender forKey:USERGENDER];
    [_prefs setObject:phone forKey:USERPHONE];
    [_prefs setObject:altPhone forKey:USERALTPHONE];
    [_prefs setObject:mobile forKey:USERMOBILE];
    [_prefs setObject:bday forKey:USERBIRTHDAY];
    [_prefs setObject:address forKey:USERADDRESS];
    [_prefs setObject:city forKey:USERCITY];
    [_prefs setObject:countryState forKey:USERCOUNTRYSTATE];
    [_prefs setObject:postCode forKey:USERPOSTCODE];
    [_prefs setObject:country forKey:USERCOUNTRY];
    [_prefs setObject:linkedIn forKey:USERLINKEDIN];
    [_prefs setObject:twitter forKey:USERTWITTER];
    [_prefs setObject:skype forKey:USERSKYPE];
    [_prefs setBool:isEUAuthorized forKey:USEREUAUTHORIZED];
    [_prefs setObject:university forKey:USERUNIVERSITY];
    [_prefs setObject:subject forKey:USERSUBJECT];
    [_prefs setObject:[yearGraduated stringValue] forKey:USERYEARGRADUATED];
    [_prefs setObject:hea forKey:USEREDUCATION];
    [_prefs setObject:driverLicense forKey:USERLICENSE];
    [_prefs setObject:nationality forKey:USERNATIONALITY];
    [_prefs setObject:ethnicity forKey:USERETHNICITY];
    [_prefs setObject:[_appDelegate.propDictReferrers objectForKey:referrer] forKey:USERREFERER];
    [_prefs setObject:maritalStatus forKey:USERSTATUS];
    [_prefs setBool:isPermanent forKey:USERISPERMANENT];
    [_prefs setBool:isContract forKey:USERISCONTRACT];
    [_prefs setBool:isTemporary forKey:USERISTEMPORARY];
    [_prefs setBool:isPartTime forKey:USERISPARTTIME];
    [_prefs setObject:jobTitlePrefs forKey:USERJOBPREFS];
    [_prefs setObject:currency forKey:USERCURRENCY];
    [_prefs setObject:[salaryFrom stringValue] forKey:USERSALARYFROM];
    [_prefs setObject:[salaryTo stringValue] forKey:USERSALARYTO];
    [_prefs setObject:salaryTpe forKey:USERSALARYTYPE];
    [_prefs setObject:mainSkills forKey:USERMAINSKILLS];
    [_prefs setObject:locationPrefs forKey:USERLOCATIONPREFS];
    [_prefs setObject:relocationWillingness forKey:USERRELOCATE];
    [_prefs setObject:noticePeriod forKey:USERNOTICE];
    [_prefs setObject:availableFrom forKey:USERAVAILABILITY];
    [_prefs setObject:languages forKey:USERLANGUAGES];
    [_prefs setBool:allowAlerts forKey:USERALERTS];
}

- (BOOL)isLoggedIn{
    return ([_prefs objectForKey:SESSION] != nil)?YES:NO;
}

- (void)logout{
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]];
}

- (NSString *)getUserID{
    return [_prefs objectForKey:SESSION];
}

- (NSString *)getFirstName{
    return [_prefs objectForKey:USERFIRSTNAME];
}

- (NSString *)getLastName{
    return [_prefs objectForKey:USERLASTNAME];
}

- (NSString *)getCompletionPercentage{
    return [_prefs objectForKey:USERCOMPLETENESS];
}

- (NSString *)getEmail{
    return [_prefs objectForKey:USEREMAIL];
}

- (NSString *)getAlternateEmail{
    return [_prefs objectForKey:USERALTEMAIL];
}

- (NSString *)getGender{
    return [_prefs objectForKey:USERGENDER];
}

- (NSString *)getPhone{
    return [_prefs objectForKey:USERPHONE];
}

- (NSString *)getAlternatePhone{
    return [_prefs objectForKey:USERALTPHONE];
}

- (NSString *)getMobile{
    return [_prefs objectForKey:USERMOBILE];
}

- (NSString *)getBirthdate{
    return [_prefs objectForKey:USERBIRTHDAY];
}

- (NSString *)getAddress{
    return [_prefs objectForKey:USERADDRESS];
}

- (NSString *)getCity{
    return [_prefs objectForKey:USERCITY];
}

- (NSString *)getCountryState{
     return [_prefs objectForKey:USERCOUNTRYSTATE];
}

- (NSString *)getPostcode{
    return [_prefs objectForKey:USERPOSTCODE];
}

- (NSString *)getCountry{
    return [_prefs objectForKey:USERCOUNTRY];
}

- (NSString *)getLinkedin{
    return [_prefs objectForKey:USERLINKEDIN];
}

- (NSString *)getTwitter{
    return [_prefs objectForKey:USERTWITTER];
}

- (NSString *)getSkype{
    return [_prefs objectForKey:USERSKYPE];
}

- (BOOL) isEUAuthorized{
    return [_prefs boolForKey:USEREUAUTHORIZED];
}

- (NSString *)getUniversity{
    return [_prefs objectForKey:USERUNIVERSITY];
}

- (NSString *)getSubject{
    return [_prefs objectForKey:USERSUBJECT];
}

- (NSString *)getYearGraduated{
    return [_prefs objectForKey:USERYEARGRADUATED];
}

- (NSString *)getEducation{
    return [_prefs objectForKey:USEREDUCATION];
}

- (NSString *)getDrivingLicense{
    return [_prefs objectForKey:USERLICENSE];
}

- (NSString *)getNationality{
    return [_prefs objectForKey:USERNATIONALITY];
}

- (NSString *)getEthnicity{
    return [_prefs objectForKey:USERETHNICITY];
}

- (NSString *)getReferrer{
    return [_prefs objectForKey:USERREFERER];
}

- (NSString *)getMaritalStatus{
    return [_prefs objectForKey:USERSTATUS];
}

- (BOOL)isPermanent{
    return [_prefs boolForKey:USERISPERMANENT];
}

- (BOOL)isContract{
    return [_prefs boolForKey:USERISCONTRACT];
}

- (BOOL)isTemporary{
    return [_prefs boolForKey:USERISTEMPORARY];
}

- (BOOL)isPartTime{
    return [_prefs boolForKey:USERISPARTTIME];
}

- (NSString *)getPreferredJobTitles{
    return [_prefs objectForKey:USERJOBPREFS];
}

- (NSString *)getCurrency{
    return [_prefs objectForKey:USERCURRENCY];
}

- (NSString *)getSalaryFrom{
    return [_prefs objectForKey:USERSALARYFROM];
}

- (NSString *)getSalaryTo{
    return [_prefs objectForKey:USERSALARYTO];
}

- (NSString *)getSalaryType{
    return [_prefs objectForKey:USERSALARYTYPE];
}

- (NSString *)getMainSkills{
    return [_prefs objectForKey:USERMAINSKILLS];
}

- (NSMutableArray *)getPreferredLocations{
    return [_prefs objectForKey:USERLOCATIONPREFS];
}

- (NSString *)getWillRelocate{
    return [_prefs objectForKey:USERRELOCATE];
}

- (NSString *)getNoticePeriod{
    return [_prefs objectForKey:USERNOTICE];
}

- (NSString *)getAvailableFrom{
    return [_prefs objectForKey:USERAVAILABILITY];
}

- (NSArray *)getLanguages{
    return [_prefs objectForKey:USERLANGUAGES];
}

- (BOOL)isAlertsAllowed{
    return [_prefs boolForKey:USERALERTS];
}

@end
