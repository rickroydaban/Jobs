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
#import "Document.h"
#import "AppDelegate.h"

@interface OnlineGateway(){
    const NSString *_jsonRoot, *_rootVacancy, *_rootCandidates, *_rootReferences, *_rootDocuments;
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
        _rootDocuments = @"https://arctestapi.velosi.com/DocumentSvc.svc/json/";
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

- (id)httpsGetFrom:(NSString *)url{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    if(responseCode.statusCode != 200)
        return error.localizedFailureReason;
    
    return responseData;
}

- (id)httpPostFrom:(NSString *)url withValues:(NSDictionary *)dict{
    NSMutableString *tempPairsString = [NSMutableString string];
    NSArray *keys = [dict allKeys];
    
    for(NSString *key in keys){
        [tempPairsString appendFormat:@"%@=%@&",key, [dict objectForKey:key]];
    }
    
    NSString *pairsString = [tempPairsString substringWithRange:NSMakeRange(0, tempPairsString.length-1)];
    NSData *postData = [pairsString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",(int)postData.length];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    request.URL = [NSURL URLWithString:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = postData;
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    if(responseCode.statusCode != 200)
        return error.localizedFailureReason;
 
    return responseData;
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
    
    return [_appDelegate.propDateFormatVelosi stringFromDate:[[NSDate dateWithTimeIntervalSince1970:unixTime] dateByAddingTimeInterval:offset]];
}

#pragma mark GET
- (NSMutableArray *)getAdvanceSearchResults:(NSString *)searched in:(NSString *)searchIn location:(NSString *)location radius:(NSString *)radius jobType:(NSString *)jobType country:(NSString *)country postedWithin:(NSString *)postedWithin{
    NSString *errorMessage;
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_rootVacancy,[NSString stringWithFormat:@"Search?search=%@&loc=%@&searchIn=%@&radius=%@&vacType=%@&countryID=%@&days=%@&top=50",searched,location,searchIn,radius,jobType,country,postedWithin]]];
    
    if([data isKindOfClass:[NSString class]])
        errorMessage = data;
    else{
        NSError *error = [[NSError alloc] init];

        @try{
            NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:(NSData *)data options:0 error:&error];
            NSMutableArray *results = [NSMutableArray array];
            
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
            }else
                errorMessage = error.localizedFailureReason;
        }@catch(NSException *exception){
            errorMessage = exception.reason;
        }
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Error" message:errorMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    return nil;
}

- (JobDetail *)getJobDetailById:(int)jobId{
    NSString *errorMessage;
    
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_rootVacancy,[NSString stringWithFormat:@"GetByID?id=%d",jobId]]];
    
    if([data isKindOfClass:[NSString class]])
        errorMessage = (NSString *)data;
    else{
        NSError *error = [[NSError alloc] init];

        @try {
            NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:(NSData *)data options:0 error:&error];
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
                
                return [[JobDetail alloc] initWithType:jobType duration:duration rotation:rotation location:location salary:salary contacts:contact details:details];
            }else
                errorMessage = error.localizedFailureReason;
        }@catch (NSException *exception) {
            errorMessage = exception.reason;
        }
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Error" message:errorMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    return nil;
}

- (NSMutableArray *)getLocationSuggestions: (NSString *)searched{
    NSString *errorMessage;
    NSObject *data = [self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_jsonRoot,[NSString stringWithFormat:@"location-search.ashx?s=%@&n=%d",searched,50]]];
    
    if([data isKindOfClass:[NSString class]])
        errorMessage = (NSString *)data;
    else{
        NSMutableArray *jsonLocationSuggestions;
        NSMutableArray *locationSuggestions = [NSMutableArray array];
        NSError *error = [[NSError alloc] init];
        
        @try{
            jsonLocationSuggestions = [NSJSONSerialization JSONObjectWithData:(NSData *)data options:0 error:&error];
            
            if(jsonLocationSuggestions){
                for(id jsonLocationSuggestion in jsonLocationSuggestions)
                    [locationSuggestions addObject:jsonLocationSuggestion];
                
                return locationSuggestions;
            }else
                errorMessage = error.localizedFailureReason;
        }@catch(NSException *exception){
            errorMessage = exception.reason;
        }
    }
    
//    [[[UIAlertView alloc] initWithTitle:@"Error" message:errorMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    return nil;
}

#pragma mark Profile
- (NSString *)authenticateUserName:(NSString *)username password:(NSString *)password{
    NSString *errorMessage;
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_rootCandidates,[NSString stringWithFormat:@"CheckAuthentication?e=%@&k=%@",username,password]]];

    if([data isKindOfClass:[NSString class]])
        errorMessage = data;
    else{
        NSError *error = [[NSError alloc] init];

        @try {
            NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:(NSData *)data options:0 error:&error];
            if(jsonResults){
                NSMutableDictionary *results = [jsonResults objectForKey:@"CheckAuthenticationResult"];
                NSDictionary *salary = [results objectForKey:@"Salary"];
                BOOL canSendEmails = [[results objectForKey:@"SendEmails"] boolValue];
                
                NSString *nationality = [_appDelegate.propUserDetails.propDictNationality objectForKey:[NSString stringWithFormat:@"%@",[results objectForKey:@"NationalityID"]]];
                NSString *education = [_appDelegate.propUserDetails.propDictEducation objectForKey:[NSString stringWithFormat:@"%@",[[results objectForKey:@"Education"] objectForKey:@"EducationID"]]];
                NSString *salaryType = [_appDelegate.propUserDetails.propDictSalaryType objectForKey:[NSString stringWithFormat:@"%@",[[salary objectForKey:@"SalaryType"] objectForKey:@"SalaryTypeID"]]];
                NSString *startDate = [self deserializeJsonDateString:[results objectForKey:@"AvailableFrom"]];
                NSString *bday =[self deserializeJsonDateString:[results objectForKey:@"DOB"]];
                NSArray *locationPrefs = ([[results objectForKey:@"PreferredLocation"] isEqualToString:@""])?[NSArray array]:[NSArray arrayWithArray:[results objectForKey:@"PreferredLocation"]];
                NSArray *languages = ([[results objectForKey:@"Languages"] isEqualToString:@""])?[NSArray array]:[NSArray arrayWithArray:[results objectForKey:@"Languages"]];
                
                [_appDelegate.propGatewayOffline saveUserDataWithID:[results objectForKey:@"CandidateID"] fname:[results objectForKey:@"FirstName"] lname:[results objectForKey:@"LastName"] completion:[[results objectForKey:@"PercentComplete"] stringValue] email:[results objectForKey:@"Email"] altEmail:[results objectForKey:@"Email2"] gender:[[results objectForKey:@"GenderSex"] objectForKey:@"GenderName"] phone:[results objectForKey:@"Phone"] altPhone:[results objectForKey:@"Phone2"] mobile:[results objectForKey:@"Mobile"] birthday:bday address:[results objectForKey:@"Address"] city:[results objectForKey:@"TownCity"] countryState:[results objectForKey:@"CountyState"] postCode:[results objectForKey:@"Postcode"] country:[[results objectForKey:@"Country"] objectForKey:@"CountryName"] linkedIn:[results objectForKey:@"LinkedIn"] twitter:[results objectForKey:@"Twitter"] skype:[results objectForKey:@"Skype"] isEUAuthorised:[[results objectForKey:@"EUAuthorised"] boolValue] university:[results objectForKey:@"UniversityAttended"] subject:[results objectForKey:@"AcademicSubject"] yearGraduated:[results objectForKey:@"GraduationYear"] hea:education driverLicense:[[results objectForKey:@"DrivingLicense"] objectForKey:@"StatusName"] nationality:nationality ethnicity:[[results objectForKey:@"Ethnicity"] objectForKey:@"EthnicityName"] referrer:[results objectForKey:@"ReferrerID"] maritalStatus:[[results objectForKey:@"MaritalStatus"] objectForKey:@"StatusName"] isPermanent:[[results objectForKey:@"Permanent"] boolValue]  isContract:[[results objectForKey:@"Contract"] boolValue] isTemporary:[[results objectForKey:@"Temporary"] boolValue] isPartTime:[[results objectForKey:@"PartTime"] boolValue] jobTitlePrefs:[results objectForKey:@"PreferredJobTitles"] currency:[salary objectForKey:@"SalaryCurrency"] salaryFrom:[salary objectForKey:@"SalaryFrom"] salaryTo:[salary objectForKey:@"SalaryTo"] salaryType:salaryType mainSkills:[results objectForKey:@"MainSkills"] locationPrefs:locationPrefs relocationWillingness:[[results objectForKey:@"Relocate"] objectForKey:@"StatusName"] noticePeriod:[[results objectForKey:@"Availability"] objectForKey:@"AvailabilityName"] availableFrom:startDate languages:languages allowAlerts:canSendEmails];
                
                return nil;
            }else
                errorMessage = error.localizedFailureReason;
        }@catch (NSException *exception) {
            errorMessage = exception.reason;
        }
    }
    
    return errorMessage;
}

- (NSArray *)getReferrerList{
    NSString *errorMessage;
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_rootReferences,[NSString stringWithFormat:@"ReferrerGetList"]]];
    
    if([data isKindOfClass:[NSString class]])
        errorMessage = data;
    else{
        NSError *error = [[NSError alloc] init];
        
        @try{
            NSMutableArray *referrers = [NSMutableArray array];
            NSArray *jsonReferrers = [[NSJSONSerialization JSONObjectWithData:(NSData *)data options:0 error:&error] objectForKey:@"ReferrerGetListResult"];
            
            if(jsonReferrers){
                NSMutableDictionary *refDicts = [NSMutableDictionary dictionary];
                for(int i=0; i<jsonReferrers.count; i++){
                    [referrers addObject:[[jsonReferrers objectAtIndex:i] objectForKey:@"Description"]];
                    [refDicts setObject:[[jsonReferrers objectAtIndex:i] objectForKey:@"Description"] forKey:[[jsonReferrers objectAtIndex:i] objectForKey:@"ReferrerID"]];
                }
                
                [_appDelegate updateReferrerDictionary:refDicts fromOnlineGateway:self];
                return referrers;
            }else
                errorMessage = error.localizedFailureReason;
        }@catch(NSException *exception){
            errorMessage = exception.reason;
        }
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Error" message:errorMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    return nil;
}

- (NSArray *)getDocuments{
    NSString *errorMessage;
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_rootDocuments,[NSString stringWithFormat:@"GetByCandidateID?id=%@",[_appDelegate.propGatewayOffline getUserID]]]];
    
    if([data isKindOfClass:[NSString class]])
        errorMessage = data;
    else{
        NSError *error = [[NSError alloc] init];

        @try{
            NSMutableArray *documents = [NSMutableArray array];
            NSArray *jsonDocuments = [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"GetByCandidateIDResult"];
            
            if(jsonDocuments){
                for(id jsonDocument in jsonDocuments)
                    [documents addObject:[[Document alloc] initWithID:[jsonDocument objectForKey:@"DocID"] name:[jsonDocument objectForKey:@"DocName"] extension:[jsonDocument objectForKey:@"Ext"] fileSize:[jsonDocument objectForKey:@"FileSize"] dateExpire:[self deserializeJsonDateString:[jsonDocument objectForKey:@"DateExpiry"]] type:[[jsonDocument objectForKey:@"DocType"] intValue]]];
                return [NSArray arrayWithArray:documents];
            }else
                errorMessage = error.localizedFailureReason;
        }@catch(NSException *exception){
            errorMessage = exception.reason;
        }
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Error" message:errorMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    return [NSArray array];
}

#pragma mark POSTS

- (NSString *)saveCandidateDetailsWithUser:(User *)user{
    NSError *error = [[NSError alloc] init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                           
    [dict setObject: user.propID forKey:@"CandidateID"];
    [dict setObject: user.propFname forKey:@"FirstName"];
    [dict setObject: user.propLname forKey:@"LastName"];
    [dict setObject: user.propEmail forKey:@"Email"];
    [dict setObject: user.propPhone forKey:@"Phone"];
    [dict setObject: user.propMobile forKey:@"Mobile"];
    [dict setObject: user.propGender forKey:@"GenderSexID"];
    [dict setObject: user.propBday forKey:@"DOB"];
    [dict setObject: user.propAddress forKey:@"Address"];
    [dict setObject: user.propCity forKey:@"TownCity"];
    [dict setObject: user.propCountryState forKey:@"CountyState"];
    [dict setObject: user.propPostCode forKey:@"Postcode"];
    [dict setObject: user.propCountry forKey:@"CountryID"];
    [dict setObject: user.propLocationPrefs forKey:@"PreferredLocation"];
    [dict setObject: (user.propIsEUAuthorised)?@"true":@"false" forKey:@"EUAuthorised"];
    [dict setObject: user.propMainSkills forKey:@"MainSkills"];
    [dict setObject: user.propJobTitlePrefs forKey:@"PreferredJobTitles"];
    [dict setObject: (user.propIsPermanent)?@"true":@"false" forKey:@"Permanent"];
    [dict setObject: (user.propIsContract)?@"true":@"false" forKey:@"Contract"];
    [dict setObject: (user.propIsTemporary)?@"true":@"false" forKey:@"Temporary"];
    [dict setObject: (user.propIsPartTime)?@"true":@"false" forKey:@"PartTime"];
    [dict setObject: user.propDiverLicense forKey:@"DrivingLicenseID"];
    [dict setObject: user.propLinkedIn forKey:@"LinkedIn"];
    [dict setObject: user.propTwitter forKey:@"Twitter"];
    [dict setObject: user.propRelocationWillingness forKey:@"RelocateID"];
    [dict setObject: user.propUniversity forKey:@"UniversityAttended"];
    [dict setObject: user.propSubject forKey:@"AcademicSubject"];
    [dict setObject: user.propYearGraduated forKey:@"GraduationYear"];
    [dict setObject: user.propNoticePeriod forKey:@"AvailabilityID"];
    [dict setObject: user.propAvailableFrom forKey:@"AvailableFrom"];
    [dict setObject: user.propEthnicity forKey:@"EthnicityID"];
    [dict setObject: user.propNationality forKey:@"NationalityID"];
    [dict setObject: user.propLanguages forKey:@"Languages"];
    [dict setObject: user.propSalaryFrom forKey:@"SalaryFrom"];
    [dict setObject: user.propSalaryTo forKey:@"SalaryTo"];
    [dict setObject: user.propSalaryType forKey:@"SalaryTypeID"];
    [dict setObject: user.propCurrency forKey:@"SalaryCurrency"];
    [dict setObject: user.propHEA forKey:@"EducationID"];
    [dict setObject: user.propReferrer forKey:@"ReferrerID"];
    [dict setObject: user.propSkype forKey:@"Skype"];
    [dict setObject: user.propMaritalStatus forKey:@"MaritalStatus"];
    [dict setObject: user.propAltEmail forKey:@"Email2"];
    [dict setObject: user.propAltPhone forKey:@"Phone2"];
    [dict setObject: (user.propAllowAlerts)?@"true":@"false" forKey:@"SendEmails"];
    [dict setObject: (user.propAllowAlerts)?@"true":@"false" forKey:@"SendSMS"];
    id data = [self httpPostFrom:[NSString stringWithFormat:@"%@Save",_rootCandidates] withValues:dict];

    NSString *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    return result;
}


@end
