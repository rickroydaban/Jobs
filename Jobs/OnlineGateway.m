//
//  OnlineGateway.m
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OnlineGateway.h"
#import "Job.h"
#import "JobDetail.h"
#import "User.h"
#import "AppDelegate.h"

@interface OnlineGateway(){
    const NSString *_jsonRoot, *_rootVacancy, *_rootCandidates, *_rootReferences;
    const AppDelegate *_appDelegate;
}

@end

@implementation OnlineGateway

static OnlineGateway *sharedOnlineGateway = nil;

+ (OnlineGateway *)sharedOnlineGateway:(AppDelegate *)appDelegate{
    if(sharedOnlineGateway == nil)
        sharedOnlineGateway = [[super alloc] initWithAppDelegate:appDelegate];
    
    return sharedOnlineGateway;
}

- (OnlineGateway *)initWithAppDelegate: (AppDelegate *)appDelegate{
    self = [super init];
    if(self){
        _jsonRoot = @"https://arctest.velosi.com/handlers/";
        _rootVacancy = @"https://arctestapi.velosi.com/VacancySvc.svc/json/";
        _rootCandidates = @"https://arctestapi.velosi.com/CandidateSvc.svc/json/";
        _rootReferences = @"https://arctestapi.velosi.com/Reference.svc/json/";
        _appDelegate = appDelegate;

//        NSError *error = [[NSError alloc] init];
//        @try{
//            NSMutableArray *jsonLocationSuggestions = [[NSJSONSerialization JSONObjectWithData:[self httpsGetFrom:[NSString stringWithFormat:@"https://arctestapi.velosi.com/Reference.svc/json/CurrencyGetList"]] options:0 error:&error] objectForKey:@"CurrencyGetListResult"];
//            
//            if(jsonLocationSuggestions){
//                for(id jsonLocationSuggestion in jsonLocationSuggestions){
//                    printf("CURRENCY_%s, ",[[[[jsonLocationSuggestion objectForKey:@"CurrencyName"] uppercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""] UTF8String]);
//                }
//            }
//        }@catch(NSException *exception){
//            NSLog(@"error %@",error);
//        }
    }
    
    return self;
}

- (NSData *)httpsGetFrom: (NSString *)url{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li",url,(long)[responseCode statusCode]);
        return nil;
    }
    
    return responseData;
}

#pragma mark Job Search
- (JobDetail *)getJobDetailById:(int)jobId{
    JobDetail *jobDetail;
    NSError *error = [[NSError alloc] init];
    NSString *query = [NSString stringWithFormat:@"GetByID?id=%d",jobId];
    NSDictionary *jsonResults;
    
    @try {
        jsonResults = [NSJSONSerialization JSONObjectWithData:[self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_rootVacancy,query]] options:0 error:&error];
        if(jsonResults){
            NSMutableDictionary *results = [jsonResults objectForKey:@"GetByID_JSONResult"];
            NSMutableDictionary *jobTypes = [results objectForKey:@"VacancyType"];
            NSString *jobType = [jobTypes objectForKey:@"Description"];
            NSString *duration = [results objectForKey:@"Duration"];
            NSString *rotation = [results objectForKey:@"StartDate"];
            NSString *location = [results objectForKey:@"Location"];
            NSString *salary = [results objectForKey:@"SalaryOther"];
            NSString *contact = [results objectForKey:@"ContactName"];
            NSString *details = [results objectForKey:@"Description"];
            
            jobDetail = [[JobDetail alloc] initWithType:jobType duration:duration rotation:rotation location:location salary:salary contacts:contact details:details];
        }
    }@catch (NSException *exception) {
        [[[UIAlertView alloc] initWithTitle:nil message:@"Cannot connect to internet" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    }
    
    return jobDetail;
}

- (NSMutableArray *)getLocationSuggestions: (NSString *)searched{
    const int maxResults = 50;
    NSMutableArray *jsonLocationSuggestions;
    NSMutableArray *locationSuggestions = [NSMutableArray array];
    NSError *error = [[NSError alloc] init];
    
    NSString *query = [NSString stringWithFormat:@"location-search.ashx?s=%@&n=%d",searched,maxResults];
    @try{
        jsonLocationSuggestions = [NSJSONSerialization JSONObjectWithData:[self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_jsonRoot,query]] options:0 error:&error];
        
        if(jsonLocationSuggestions){
            for(id jsonLocationSuggestion in jsonLocationSuggestions){
                [locationSuggestions addObject:jsonLocationSuggestion];
            }
        }
    }@catch(NSException *exception){
        [[[UIAlertView alloc] initWithTitle:nil message:@"Cannot connect to internet" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    }
    
    return locationSuggestions;
}

- (NSMutableArray *)getAdvanceSearchResults:(NSString *)searched in:(NSString *)searchIn location:(NSString *)location radius:(NSString *)radius jobType:(NSString *)jobType country:(NSString *)country postedWithin:(NSString *)postedWithin{
    const NSString *maxResults = @"50";
    NSDictionary *jsonResults;
    NSMutableArray *results = [NSMutableArray array];
    NSError *error = [[NSError alloc] init];
    
    NSString *query = [NSString stringWithFormat:@"Search?search=%@&loc=%@&searchIn=%@&radius=%@&vacType=%@&countryID=%@&days=%@&top=%@",searched,location,searchIn,radius,jobType,country,postedWithin,maxResults];
    
    @try{
        jsonResults = [NSJSONSerialization JSONObjectWithData:[self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_rootVacancy,query]] options:0 error:&error];
        
        if(jsonResults){
            NSMutableArray *resultsArray = [jsonResults objectForKey:@"SearchJSONResult"];

            for(id jsonResult in resultsArray){
                int id = [[jsonResult objectForKey:@"VacancyID"] intValue];
                NSString *title = [jsonResult objectForKey:@"Title"];
                NSString *ref = [jsonResult objectForKey:@"VacancyRef"];
                NSDictionary *country = [jsonResult objectForKey:@"Country"];
                NSString *countryName = [country objectForKey:@"CountryName"];
                NSString *dateAdded = [self deserializeJsonDateString:[jsonResult objectForKey:@"DateCreated"]];
                NSString *details = [jsonResult objectForKey:@"Description"];
                [results addObject:[[Job alloc] initWithId:id title:title reference:ref country:countryName dateAdded:dateAdded details:details]];
            }
        }
    }@catch(NSException *exception){
        [[[UIAlertView alloc] initWithTitle:nil message:@"Cannot connect to server" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    }
    
    return results;
}

- (NSString *)fixKey:(NSString *)key{
    if([key length] < 1)
        key = @"-";
    
    return key;
}

- (NSString *)deserializeJsonDateString: (NSString *)jsonDateString{
    NSInteger offset = [[NSTimeZone defaultTimeZone] secondsFromGMT]; //get number of seconds to add or subtract according to the client default time zone
    NSInteger startPosition = [jsonDateString rangeOfString:@"("].location + 1; //start of the date value
    NSTimeInterval unixTime = [[jsonDateString substringWithRange:NSMakeRange(startPosition, 13)] doubleValue] / 1000; //WCF will send 13 digit-long value for the time interval since 1970 (millisecond precision) whereas iOS works with 10 digit-long values (second precision), hence the divide by 1000
    
    return [_appDelegate.velosiDateFormat stringFromDate:[[NSDate dateWithTimeIntervalSince1970:unixTime] dateByAddingTimeInterval:offset]];
}

#pragma mark Profile
- (User *)authenticateUserName:(NSString *)username password:(NSString *)password{
    User *user;
    NSError *error = [[NSError alloc] init];
    NSString *query = [NSString stringWithFormat:@"CheckAuthentication?e=%@&k=%@",username,password];
    NSDictionary *jsonResults;
    @try {
        jsonResults = [NSJSONSerialization JSONObjectWithData:[self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_rootCandidates,query]] options:0 error:&error];
        if(jsonResults){
            NSMutableDictionary *results = [jsonResults objectForKey:@"CheckAuthenticationResult"];
            NSDictionary *salary = [results objectForKey:@"Salary"];
            BOOL canSendEmails = [[results objectForKey:@"sendEmails"] boolValue];
            
            NSString *nationality = [_appDelegate.userDetails.propDictNationality objectForKey:[results objectForKey:@"NationalityID"]];
            NSString *education = [_appDelegate.userDetails.propDictEducation objectForKey:[[results objectForKey:@"Education"] objectForKey:@"EducationID"]];
            NSString *salaryType = [_appDelegate.userDetails.propDictSalaryType objectForKey:[[salary objectForKey:@"SalaryType"] objectForKey:@"SalaryTypeID"]];
            NSString *startDate = [self deserializeJsonDateString:[results objectForKey:@"AvailableFrom"]];
            NSString *bday =[self deserializeJsonDateString:[results objectForKey:@"DOB"]];

            //referrer ========== candidateID, zero (0) for other
            //jobtype ======== permanent contract temporary  part time
            //notice period ====== not yet placed
            
            
            [_appDelegate.offlineGateway saveUserDataWithFname:[results objectForKey:@"FirstName"] lname:[results objectForKey:@"LastName"] completion:[[results objectForKey:@"PercentComplete"] stringValue] email:[results objectForKey:@"Email"] altEmail:[results objectForKey:@"Email2"] gender:[[results objectForKey:@"GenderSex"] objectForKey:@"GenderName"] phone:[results objectForKey:@"Phone"] altPhone:[results objectForKey:@"Phone2"] mobile:[results objectForKey:@"Mobile"] birthday:bday address:[results objectForKey:@"Address"] city:[results objectForKey:@"TownCity"] countryState:[results objectForKey:@"CountyState"] postCode:[results objectForKey:@"Postcode"] country:[[results objectForKey:@"Country"] objectForKey:@"CountryName"] linkedIn:[results objectForKey:@"LinkedIn"] twitter:[results objectForKey:@"Twitter"] skype:[results objectForKey:@"Skype"] isEUAuthorised:[[results objectForKey:@"EUAuthorised"] boolValue] university:[results objectForKey:@"UniversityAttended"] subject:[results objectForKey:@"AcademicSubject"] yearGraduated:[results objectForKey:@"GraduationYear"] hea:education driverLicense:[[results objectForKey:@"DrivingLicense"] objectForKey:@"StatusName"] nationality:nationality ethnicity:[[results objectForKey:@"Ethnicity"] objectForKey:@"EthnicityName"] referrer:[results objectForKey:@"ReferrerID"] maritalStatus:[[results objectForKey:@"MaritalStatus"] objectForKey:@"StatusName"] isPermanent:[[results objectForKey:@"Permanent"] boolValue]  isContract:[[results objectForKey:@"Contract"] boolValue] isTemporary:[[results objectForKey:@"Temporary"] boolValue] isPartTime:[[results objectForKey:@"PartTime"] boolValue] jobTitlePrefs:[results objectForKey:@"PreferredJobTitles"] currency:[salary objectForKey:@"SalaryCurrency"] salaryFrom:[salary objectForKey:@"SalaryFrom"] salaryTo:[salary objectForKey:@"SalaryTo"] salaryType:salaryType mainSkills:[results objectForKey:@"MainSkills"] locationPrefs:[results objectForKey:@"PreferredLocation"] relocationWillingness:[[results objectForKey:@"Relocate"] objectForKey:@"StatusName"] noticePeriod:[[results objectForKey:@"Availability"] objectForKey:@"AvailabilityName"] availableFrom:startDate languages:[results objectForKey:@"Languages"] allowAlerts:canSendEmails];
        }
    }@catch (NSException *exception) {
        [[[UIAlertView alloc] initWithTitle:nil message:@"Cannot connect to internet" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    }
    
    return user;
}

- (NSArray *)getReferrerList{
    NSMutableArray *referrers = [NSMutableArray array];
    NSMutableDictionary *refDicts;
    NSError *error = [[NSError alloc] init];
    NSString *query = [NSString stringWithFormat:@"ReferrerGetList"];
    
    @try{
        NSArray *jsonReferrers = [[NSJSONSerialization JSONObjectWithData:[self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_rootReferences,query]] options:0 error:&error] objectForKey:@"ReferrerGetListResult"];
        refDicts = [NSMutableDictionary dictionary];
        
        for(int i=0; i<jsonReferrers.count; i++){
            [referrers addObject:[[jsonReferrers objectAtIndex:i] objectForKey:@"Description"]];
            [refDicts setObject:[[jsonReferrers objectAtIndex:i] objectForKey:@"ReferrerID"] forKey:[[jsonReferrers objectAtIndex:i] objectForKey:@"Description"]];
        }
        
        [_appDelegate updateReferrerDictionaryFromOnlineGateway:self dictionary:refDicts];
        
        return referrers;
    }@catch(NSException *e){
        return nil;
    }
}


@end
