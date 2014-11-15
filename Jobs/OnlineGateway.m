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
#import "Employment.h"
#import "Application.h"
#import "SavedSearch.h"
#import "AppDelegate.h"

@interface OnlineGateway(){
    const NSString *_jsonLocation, *_rootVacancy, *_rootCandidates, *_rootReferences, *_rootDocuments, *_rootEmployments, *_rootApplications, *_rootSavedSearches;
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
        _jsonLocation = @"https://arctestapi.velosi.com/Geolocation.svc/json/";
        _rootVacancy = @"https://arctestapi.velosi.com/VacancySvc.svc/json/";
        _rootCandidates = @"https://arctestapi.velosi.com/CandidateSvc.svc/json/";
        _rootReferences = @"https://arctestapi.velosi.com/Reference.svc/json/";
        _rootDocuments = @"https://arctestapi.velosi.com/DocumentSvc.svc/json/";
        _rootEmployments = @"https://arctestapi.velosi.com/CandidateJobSvc.svc/json/";
        _rootApplications = @"https://arctestapi.velosi.com/ApplicationSvc.svc/json/";
        _rootSavedSearches = @"https://arctestapi.velosi.com/JobsByEmailSvc.svc/json/";
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
    if(responseCode.statusCode != 200){
        return [self responseErrorDescriptionFromStatusCode:responseCode.statusCode];
    }

    return responseData;
}

- (id)httpPostFrom:(NSString *)url withBody:(NSString *)jsonString{
//    NSMutableArray *tempPairsString = [NSMutableArray array];
//    
//    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//        [tempPairsString addObject:[NSString stringWithFormat:@"%@=%@",key,CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)obj, NULL, (CFStringRef)@":/?@!$&'()*+,;= ",kCFStringEncodingUTF8))]];
//    }];
//    
//    NSString *pairsString = [tempPairsString componentsJoinedByString:@"&"];
//    NSLog(@"str: %@",pairsString);

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    [request setValue:[NSString stringWithFormat:@"%d",(int)jsonString.length] forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    request.HTTPBody = [NSData dataWithBytes:[jsonString UTF8String] length:[jsonString length]];
//    [[NSURLConnection connectionWithRequest:request delegate:delegate] start];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    if(responseCode.statusCode != 200){
        return [self responseErrorDescriptionFromStatusCode:responseCode.statusCode];
    }
    
    return responseData;
}

- (NSString *)responseErrorDescriptionFromStatusCode:(int)statusCode{
    switch (statusCode) {
        case 204: return @"No Response";
        case 400: return @"Bad Request";
        case 401: return @"Unauthorized";
        case 402: return @"Payment Required";
        case 403: return @"Forbidden";
        case 404: return @"Not Found";
        case 405: return @"Method Not Allowed";
        case 406: return @"Not Acceptable";
        case 407: return @"Proxy Authentication Required";
        case 408: return @"Request Timeout";
        case 409: return @"Conflict";
        case 410: return @"Gone";
        case 411: return @"Length Required";
        case 412: return @"Precondition Failed";
        case 413: return @"Request Entity Too Large";
        case 414: return @"Request-URI Too Long";
        case 415: return @"Unsupported Media Type";
        case 416: return @"Request Range Not Satisfiable";
        case 417: return @"Expectation Failed";
        case 500: return @"Internal Server Error";
        case 501: return @"Not Implemented";
        case 502: return @"Service temporarily overloaded";
        case 503: return @"Gateway Timeout";
        default:  return [NSString stringWithFormat:@"%d",statusCode];
    }
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
- (NSString *)resetPasswordWithEmail:(NSString *)email{
    NSError *error;
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@ResetPassword?e=%@",_rootCandidates,email]];
    NSString *result = [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"ResetPasswordResult"];

    if(error == nil)
        return result;
    
    return error.localizedFailureReason;
}

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
                
                return results;
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

- (id)getLocationSuggestions: (NSString *)searched{
    NSString *errorMessage;
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@Search?s=%@&n=%d",_jsonLocation, [searched lowercaseString],50]];

    if([data isKindOfClass:[NSString class]])
        errorMessage = (NSString *)data;
    else{
        NSMutableArray *jsonLocationSuggestions;
        NSMutableArray *locationSuggestions = [NSMutableArray array];
        NSError *error = [[NSError alloc] init];
        
        @try{
            jsonLocationSuggestions = [[NSJSONSerialization JSONObjectWithData:(NSData *)data options:0 error:&error] objectForKey:@"SearchJSONResult"];
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
    
    return errorMessage;
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
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@GetByCandidateID?id=%@",_rootDocuments,[_appDelegate.propGatewayOffline getUserID]]];
    
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

- (id)getEmployments{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@GetByCandidateID?id=%@",_rootEmployments,[_appDelegate.propGatewayOffline getUserID]]];
    
    if([data isKindOfClass:[NSString class]])
        return data;
    else{
        NSError *error = [[NSError alloc] init];
        
        @try {
            NSMutableArray *employments = [NSMutableArray array];
            NSArray *jsonEmployments = [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"GetByCandidateIDResult"];
            
            if(jsonEmployments){
                for (id jsonEmployment in jsonEmployments)
                    [employments addObject:[[Employment alloc] initWithDictionary:jsonEmployment]];
            }
            
            return employments;
        }@catch (NSException *exception) {
            return exception.reason;
        }
    }
}

- (NSString *)deleteEmploymentWithID:(NSString *)employmentID{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@Delete?id=%@",_rootEmployments,employmentID]];
    NSError *error;
    
    @try{
        return [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"DeleteResult"];
    }@catch(NSException *exception){
        return exception.reason;
    }
}

- (id)getApplications{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@GetByCandidateID?id=%@",_rootApplications,[_appDelegate.propGatewayOffline getUserID]]];
    
    if([data isKindOfClass:[NSString class]])
        return data;
    else{
        NSError *error = [[NSError alloc] init];
        
        @try{
            NSMutableArray *applications = [NSMutableArray array];
            NSArray *jsonApplications = [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"GetByCandidateIDResult"];
            
            if(jsonApplications){
                for(id jsonApplication in jsonApplications)
                    [applications addObject:[[Application alloc] initWithID:[[jsonApplication objectForKey:@"ApplicationID"] intValue] title:[jsonApplication objectForKey:@"VacancyTitle"] reference:[jsonApplication objectForKey:@"VacancyRef"] status:[[jsonApplication objectForKey:@"AppStatus"] objectForKey:@"StatusName"] dateAdded:[self deserializeJsonDateString:[jsonApplication objectForKey:@"DateCreated"]]]];
            }
            
            return applications;
        }@catch(NSException *exception){
            return exception.reason;
        }
    }
}

- (id)getSavedSearches{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@GetByCandidateID?id=%@",_rootSavedSearches,[_appDelegate.propGatewayOffline getUserID]]];
    
    if([data isKindOfClass:[NSString class]])
        return data;
    else{
        NSError *error = [[NSError alloc] init];
        
        @try{
            NSMutableArray *savedSearches = [NSMutableArray array];
            NSArray *jsonSavedSearches = [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"GetByCandidateIDResult"];
            
            if(jsonSavedSearches){
                for(id jsonSavedSearch in jsonSavedSearches)
                    [savedSearches addObject:[[SavedSearch alloc] initWithDictionary:jsonSavedSearch]];
            }
            
            return savedSearches;
        }@catch(NSException *exception){
            return exception.reason;
        }
    }
}

- (NSString *)deleteSavedSearchesWithJBEID:(NSString *)jbeID{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@Delete?id=%@",_rootSavedSearches,jbeID]];
    NSError *error;
    
    @try{
        return [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"DeleteResult"];
    }@catch(NSException *exception){
        return exception.reason;
    }
}

- (NSString *)changePassword:(NSString *)oldPassword to:(NSString *)newPassword{
    NSError *error = [[NSError alloc] init];
    @try{
        return [[NSJSONSerialization JSONObjectWithData:[self httpsGetFrom:[NSString stringWithFormat:@"%@ChangePassword?id=%@&o=%@&p=%@",_rootCandidates ,[_appDelegate.propGatewayOffline getUserID],oldPassword,newPassword]] options:0 error:&error] objectForKey:@"ChangePasswordResult"];
    }@catch(NSException *exception){
        return exception.reason;
    }
    
    return error.localizedFailureReason;
}

#pragma mark POSTS

- (NSString *)saveCandidateDetailsWithUser:(User *)user{
    NSError *error = [[NSError alloc] init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                           
    [dict setObject: user.propID forKey:@"CandidateID"];
    [dict setObject: [NSString stringWithFormat:@"%@",user.propFname] forKey:@"FirstName"];
    [dict setObject: [NSString stringWithFormat:@"%@",user.propLname] forKey:@"LastName"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propEmail] forKey:@"Email"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propPhone] forKey:@"Phone"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propMobile] forKey:@"Mobile"];
//    [dict setObject: user.propGender forKey:@"GenderSexID"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propBday] forKey:@"DOB"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propAddress] forKey:@"Address"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propCity] forKey:@"TownCity"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propCountryState] forKey:@"CountyState"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propPostCode] forKey:@"Postcode"];
//    [dict setObject: user.propCountry forKey:@"CountryID"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propLocationPrefs] forKey:@"PreferredLocation"];
//    [dict setObject: (user.propIsEUAuthorised)?@"true":@"false" forKey:@"EUAuthorised"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propMainSkills] forKey:@"MainSkills"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propJobTitlePrefs] forKey:@"PreferredJobTitles"];
//    [dict setObject: (user.propIsPermanent)?@"true":@"false" forKey:@"Permanent"];
//    [dict setObject: (user.propIsContract)?@"true":@"false" forKey:@"Contract"];
//    [dict setObject: (user.propIsTemporary)?@"true":@"false" forKey:@"Temporary"];
//    [dict setObject: (user.propIsPartTime)?@"true":@"false" forKey:@"PartTime"];
//    [dict setObject: user.propDiverLicense forKey:@"DrivingLicenseID"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propLinkedIn] forKey:@"LinkedIn"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propTwitter] forKey:@"Twitter"];
//    [dict setObject: user.propRelocationWillingness forKey:@"RelocateID"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propUniversity] forKey:@"UniversityAttended"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propSubject] forKey:@"AcademicSubject"];
//    [dict setObject: user.propYearGraduated forKey:@"GraduationYear"];
//    [dict setObject: user.propNoticePeriod forKey:@"AvailabilityID"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propAvailableFrom] forKey:@"AvailableFrom"];
//    [dict setObject: user.propEthnicity forKey:@"EthnicityID"];
//    [dict setObject: user.propNationality forKey:@"NationalityID"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propLanguages] forKey:@"Languages"];
//    [dict setObject: user.propSalaryFrom forKey:@"SalaryFrom"];
//    [dict setObject: user.propSalaryTo forKey:@"SalaryTo"];
//    [dict setObject: user.propSalaryType forKey:@"SalaryTypeID"];
//    [dict setObject: user.propCurrency forKey:@"SalaryCurrency"];
//    [dict setObject: user.propHEA forKey:@"EducationID"];
//    [dict setObject: user.propReferrer forKey:@"ReferrerID"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propSkype] forKey:@"Skype"];
//    [dict setObject: user.propMaritalStatus forKey:@"MaritalStatus"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propAltEmail] forKey:@"Email2"];
//    [dict setObject: [NSString stringWithFormat:@"%@",user.propAltPhone] forKey:@"Phone2"];
//    [dict setObject: (user.propAllowAlerts)?@"true":@"false" forKey:@"SendEmails"];
//    [dict setObject: (user.propAllowAlerts)?@"true":@"false" forKey:@"SendSMS"];
//    id data = [self httpPostFrom:[NSString stringWithFormat:@"%@Save",_rootCandidates] withValues:dict];

//    NSString *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
//    return result;
    return @"";
}

- (id)saveEmploymentWithJSONContents:(NSString *)jsonContents{
    NSString *body = [NSString stringWithFormat:@"{\"j\":%@}",jsonContents];
    id result = [self httpPostFrom:@"https://arctestapi.velosi.com/CandidateJobSvc.svc/json/Save" withBody:body];
    return ([result isKindOfClass:[NSString class]])?result:@"Saved Successfullly!";
}

- (NSString *)saveSavedSearchesWithJSONContents:(NSString *)jsonContents{
    NSString *body = [NSString stringWithFormat:@"{\"j\":%@}",jsonContents];
    id result = [self httpPostFrom:@"https://arctestapi.velosi.com/JobsByEmailSvc.svc/json/Save" withBody:body];
    return ([result isKindOfClass:[NSString class]])?result:nil;
}


@end
