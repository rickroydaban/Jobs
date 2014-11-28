//
//  OnlineGateway.m
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "OnlineGateway.h"
#import "Job.h"
#import "JobDetail.h"
#import "User.h"
#import "Document.h"
#import "Employment.h"
#import "Application.h"
#import "SavedSearch.h"

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
//
//        NSLog(@"init");
//        NSError *error = [[NSError alloc] init];
//        @try{
//            NSMutableArray *jsonLocationSuggestions = [[NSJSONSerialization JSONObjectWithData:[self httpsGetFrom:[NSString stringWithFormat:@"https://arctestapi.velosi.com/Reference.svc/json/CountryGetList"]] options:0 error:&error] objectForKey:@"CountryGetListResult"];
//            
//            if(jsonLocationSuggestions){
//                for(id jsonLocationSuggestion in jsonLocationSuggestions){
//                    printf("        [_propDictCountryIds setValue:%s forKey:@\"%d\"];\n",[[[[jsonLocationSuggestion objectForKey:@"CountryName"] uppercaseString] stringByReplacingOccurrencesOfString:@" " withString:@"_"] UTF8String],[[jsonLocationSuggestion objectForKey:@"CountryID"] intValue]);
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
        return [self responseErrorDescriptionFromStatusCode:(int)responseCode.statusCode];
    }

    return responseData;
}

- (id)httpPostFrom:(NSString *)url withBody:(NSString *)jsonString{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    [request setValue:[NSString stringWithFormat:@"%d",(int)jsonString.length] forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    request.HTTPBody = [NSData dataWithBytes:[jsonString UTF8String] length:[jsonString length]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    if(responseCode.statusCode != 200){
        return [self responseErrorDescriptionFromStatusCode:(int)responseCode.statusCode];
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

- (id)getAdvanceSearchResults:(NSString *)searched in:(NSString *)searchIn location:(NSString *)location radius:(NSString *)radius jobType:(NSString *)jobType country:(NSString *)country postedWithin:(NSString *)postedWithin{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_rootVacancy,[NSString stringWithFormat:@"Search?search=%@&loc=%@&searchIn=%@&radius=%@&vacType=%@&countryID=%@&days=%@&top=50",searched,location,searchIn,radius,jobType,country,postedWithin]]];
    
    if([data isKindOfClass:[NSString class]])
        return data;
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
                return error.localizedFailureReason;
        }@catch(NSException *exception){
            return exception.reason;
        }
    }    
}

- (id)getJobDetailById:(int)jobId{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_rootVacancy,[NSString stringWithFormat:@"GetByID?id=%d",jobId]]];
    
    if([data isKindOfClass:[NSString class]])
        return data;
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
                return error.localizedFailureReason;
        }@catch (NSException *exception) {
            return exception.reason;
        }
    }
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
- (id)authenticateUserName:(NSString *)username password:(NSString *)password{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_rootCandidates,[NSString stringWithFormat:@"CheckAuthentication?e=%@&k=%@",username,password]]];

    if([data isKindOfClass:[NSString class]])
        return data;
    else{
        NSError *error = [[NSError alloc] init];

        @try {
            NSDictionary *result = [[NSJSONSerialization JSONObjectWithData:(NSData *)data options:0 error:&error] objectForKey:@"CheckAuthenticationResult"];
            if(result){
                _appDelegate.propUser = [[User alloc] initWithDictionary:result];
                [_appDelegate.propGatewayOffline saveUserDataWithID:[_appDelegate.propUser propID]];
                return nil;
            }else
                return error.localizedFailureReason;
        }@catch (NSException *exception) {
            return exception.reason;
        }
    }
}

- (NSArray *)getReferrerList{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_rootReferences,[NSString stringWithFormat:@"ReferrerGetList"]]];
    
    if([data isKindOfClass:[NSString class]])
        return nil;
    else{
        NSError *error = [[NSError alloc] init];
        
        @try{
            NSMutableArray *referrers = [NSMutableArray array];
            NSArray *jsonReferrers = [[NSJSONSerialization JSONObjectWithData:(NSData *)data options:0 error:&error] objectForKey:@"ReferrerGetListResult"];
            
            if(jsonReferrers){
                NSMutableDictionary *refDicts = [NSMutableDictionary dictionary];
                for(id jsonReferrer in jsonReferrers){
                    [referrers addObject:[jsonReferrer objectForKey:@"Description"]];
                    [refDicts setObject:[jsonReferrer objectForKey:@"Description"] forKey:[NSString stringWithFormat:@"%@",[jsonReferrer objectForKey:@"ReferrerID"]]];
                }
                
                [_appDelegate setupOnApplicationLaunchReferrerDictionary:refDicts fromOnlineGateway:self];
                return referrers;
            }else
                return nil;
        }@catch(NSException *exception){
            return nil;
        }
    }    
}

- (id)getDocuments{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@GetByCandidateID?id=%@",_rootDocuments,[_appDelegate.propGatewayOffline getUserID]]];
    
    if([data isKindOfClass:[NSString class]])
        return data;
    else{
        NSError *error = [[NSError alloc] init];

        @try{
            NSMutableArray *documents = [NSMutableArray array];
            NSArray *jsonDocuments = [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"GetByCandidateIDResult"];
            
            if(jsonDocuments){
                for(id jsonDocument in jsonDocuments)
                    [documents addObject:[[Document alloc] initWithID:[jsonDocument objectForKey:@"DocID"] name:[jsonDocument objectForKey:@"DocName"] extension:[jsonDocument objectForKey:@"Ext"] fileSize:[jsonDocument objectForKey:@"FileSize"] dateExpire:[self deserializeJsonDateString:[jsonDocument objectForKey:@"DateExpiry"]] type:[[jsonDocument objectForKey:@"DocType"] intValue]]];
                return documents;
            }else
                return error.localizedFailureReason;
        }@catch(NSException *exception){
            return exception.reason;
        }
    }
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
                    [applications addObject:[[Application alloc] initWithID:[[jsonApplication objectForKey:@"ApplicationID"] intValue] title:[jsonApplication objectForKey:@"VacancyTitle"] jobID:[jsonApplication objectForKey:@"VacancyID"] jobRef:[jsonApplication objectForKey:@"VacancyRef"] status:[[jsonApplication objectForKey:@"AppStatus"] objectForKey:@"StatusName"] dateAdded:[self deserializeJsonDateString:[jsonApplication objectForKey:@"DateCreated"]]]];
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

- (id)changeAllSavedSearchSubscriptionForCandidateID:(NSString *)cID status:(BOOL)willSubscribe{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@ChangeStatusByCandidateID?id=%@&enabled=%@",_rootSavedSearches,cID, (willSubscribe)?@"true":@"false"]];
    NSError *error;
    
    @try{
        return [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"ChangeStatusByCandidateIDResult"];
    }@catch(NSException *exception){
        return exception.reason;
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

- (id)saveCandidateDetailsWitJSONContents:(NSString *)jsonContents{
    NSString *body = [NSString stringWithFormat:@"{\"c\":%@}",jsonContents];
    NSLog(@"%@",body);

    id result = [self httpPostFrom:@"https://arctestapi.velosi.com/CandidateSvc.svc/json/Save" withBody:body];
    NSLog(@"result :%@",[NSJSONSerialization JSONObjectWithData:result options:NSJSONWritingPrettyPrinted error:nil]);
    return ([result isKindOfClass:[NSString class]])?result:@"Saved Successfullly!";
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
