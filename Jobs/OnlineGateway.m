//
//  OnlineGateway.m
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "OnlineGateway.h"
#import "JobSummary.h"
#import "Job.h"
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
        _jsonLocation = @"https://arcapi.velosi.com/Geolocation.svc/json/";
        _rootVacancy = @"https://arcapi.velosi.com/VacancySvc.svc/json/";
        _rootCandidates = @"https://arcapi.velosi.com/CandidateSvc.svc/json/";
        _rootReferences = @"https://arcapi.velosi.com/Reference.svc/json/";
        _rootDocuments = @"https://arcapi.velosi.com/DocumentSvc.svc/json/";
        _rootEmployments = @"https://arcapi.velosi.com/CandidateJobSvc.svc/json/";
        _rootApplications = @"https://arcapi.velosi.com/ApplicationSvc.svc/json/";
        _rootSavedSearches = @"https://arcapi.velosi.com/JobsByEmailSvc.svc/json/";
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
    NSLog(@"%@",url);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    [request setValue:@"3/iQGvD5]cmTu85H(syvsg" forHTTPHeaderField:@"AuthKey"];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    if(responseCode.statusCode != 200)
        return [self responseErrorDescriptionFromStatusCode:(int)responseCode.statusCode];

    return responseData;
}

//returns nsdata if posted successfully otherwise returns a string message
- (id)httpPostFrom:(NSString *)url withBody:(NSString *)jsonString{
    NSLog(@"%@",url);
    NSLog(@"%@",jsonString);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    [request setValue:[NSString stringWithFormat:@"%d",(int)jsonString.length] forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"3/iQGvD5]cmTu85H(syvsg" forHTTPHeaderField:@"AuthKey"];
    request.HTTPBody = [NSData dataWithBytes:[jsonString UTF8String] length:[jsonString length]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    if(responseCode.statusCode != 200)
        return [self responseErrorDescriptionFromStatusCode:(int)responseCode.statusCode];
    
    return responseData;
}

- (NSString *)responseErrorDescriptionFromStatusCode:(int)statusCode{
    switch (statusCode) {
        case 0: return @"Server Connection Failed";
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

- (NSString *)fixQueryParam:(NSString *)param{
    return [param stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
}

- (NSString *)deserializeJsonDateString: (NSString *)jsonDateString{
    @try{
        NSInteger offset = [[NSTimeZone defaultTimeZone] secondsFromGMT]; //get number of seconds to add or subtract according to the client default time zone
        NSInteger startPosition = [jsonDateString rangeOfString:@"("].location + 1; //start of the date value
        NSTimeInterval unixTime = [[jsonDateString substringWithRange:NSMakeRange(startPosition, 13)] doubleValue] / 1000; //WCF will send 13 digit-long value for the time interval since 1970 (millisecond precision) whereas iOS works with 10 digit-long values (second precision), hence the divide by 1000
        
        return [_appDelegate.propDateFormatVelosi stringFromDate:[[NSDate dateWithTimeIntervalSince1970:unixTime] dateByAddingTimeInterval:offset]];
    }@catch(NSException *e){
        return e.reason;
    }
}

#pragma mark GET
- (NSString *)resetPasswordWithEmail:(NSString *)email{
    NSError *error;
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@ResetPassword?e=%@",_rootCandidates,email]];
    return [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"ResetPasswordResult"];
}

- (id)getAdvanceSearchResults:(NSString *)searched in:(NSString *)searchIn location:(NSString *)location radius:(NSString *)radius jobType:(NSString *)jobType country:(NSString *)country postedWithin:(NSString *)postedWithin{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@%@",_rootVacancy,[NSString stringWithFormat:@"Search?search=%@&loc=%@&searchIn=%@&radius=%@&vacType=%@&countryID=%@&days=%@&top=0",[self fixQueryParam:searched],location,searchIn,radius,jobType,country,postedWithin]]];
    
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
                    int jobID = [[jsonResult objectForKey:@"VacancyID"] intValue];
                    NSString *title = [jsonResult objectForKey:@"Title"];
                    NSString *ref = [jsonResult objectForKey:@"VacancyRef"];
                    NSDictionary *country = [jsonResult objectForKey:@"Country"];
                    NSString *countryName = [country objectForKey:@"CountryName"];
                    NSString *dateAdded = [self deserializeJsonDateString:[jsonResult objectForKey:@"DateCreated"]];
                    NSString *details = [jsonResult objectForKey:@"Description"];
                    [results addObject:[[JobSummary alloc] initWithId:jobID title:title reference:ref country:countryName dateAdded:dateAdded details:details]];
                }
                
                return results;
            }else
                return error.localizedFailureReason;
        }@catch(NSException *exception){
            return @"Server Connection Failed";
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
                return [[Job alloc] initWithDictionary:[jsonResults objectForKey:@"GetByID_JSONResult"]];
            }else
                return error.localizedFailureReason;
        }@catch (NSException *exception) {
            return @"Server Connection Failed";
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
        id result = [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"CheckAuthenticationResult"];
        if([result isKindOfClass:[NSNull class]])
            return @"Invalid username or password";
        else
            return result;
    }
}

- (id)getCandidateData{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@GetByID?id=%@",_rootCandidates,[_appDelegate.propGatewayOffline getUserID]]];
    if([data isKindOfClass:[NSString class]])
        return data;
    else{
        NSError *error = [[NSError alloc] init];
        id result = [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"GetByIDResult"];
        if([result isKindOfClass:[NSNull class]])
            return @"Invalid Candidate ID";
        else
            return result;
    }
}

- (id)getReferrerList{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@ReferrerGetList",_rootReferences]];
    
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
//    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@GetByCandidateID?id=71549",_rootDocuments]];
    
    if([data isKindOfClass:[NSString class]])
        return data;
    else{
        NSError *error = [[NSError alloc] init];

        @try{
            NSMutableArray *documents = [NSMutableArray array];
            NSArray *jsonDocuments = [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"GetByCandidateIDResult"];
            
            if(jsonDocuments){
                for(id jsonDocument in jsonDocuments)
                    [documents addObject:[[Document alloc] initWithDictionary:jsonDocument]];
                return documents;
            }else
                return error.localizedFailureReason;
        }@catch(NSException *exception){
            return @"Server Connection Failed";
        }
    }
}

- (NSString *)deleteDocumentsWithID:(NSString *)documentID{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@Delete=id?%@",_rootDocuments,documentID]];
    NSError *error;
    
    @try{
        return [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"DeleteResult"];
    }@catch(NSException *e){
        return e.reason;
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
            return @"Server Connection Failed";
        }
    }
}

- (NSString *)deleteEmploymentWithID:(NSString *)employmentID{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@Delete?id=%@",_rootEmployments,employmentID]];
    NSError *error;
    
    @try{
        return [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"DeleteResult"];
    }@catch(NSException *exception){
        return @"Server Connection Failed";
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
                    [applications addObject:[[Application alloc] initWithDictionary:jsonApplication]];
            }
            
            return applications;
        }@catch(NSException *exception){
            return @"Server Connection Failed";
        }
    }
}

- (id)getSavedSearches{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@GetByCandidateID?id=%@",_rootSavedSearches,[_appDelegate.propGatewayOffline getUserID]]];
//    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@GetByCandidateID?id=71549",_rootSavedSearches]];
    
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
            return @"Server Connection Failed";
        }
    }
}

- (id)changeAllSavedSearchSubscriptionForCandidateID:(NSString *)cID status:(BOOL)willSubscribe{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@ChangeStatusByCandidateID?id=%@&enabled=%@",_rootSavedSearches,cID, (willSubscribe)?@"true":@"false"]];
    NSError *error;
    
    @try{
        return [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"ChangeStatusByCandidateIDResult"];
    }@catch(NSException *exception){
        return @"Server Connection Failed";
    }
}


- (NSString *)deleteSavedSearchesWithJBEID:(NSString *)jbeID{
    id data = [self httpsGetFrom:[NSString stringWithFormat:@"%@Delete?id=%@",_rootSavedSearches,jbeID]];
    NSError *error;
    
    @try{
        return [[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] objectForKey:@"DeleteResult"];
    }@catch(NSException *exception){
        return @"Server Connection Failed";
    }
}

- (NSString *)changePassword:(NSString *)oldPassword to:(NSString *)newPassword{
    NSError *error = [[NSError alloc] init];
    @try{
        return [[NSJSONSerialization JSONObjectWithData:[self httpsGetFrom:[NSString stringWithFormat:@"%@ChangePassword?id=%@&o=%@&p=%@",_rootCandidates ,[_appDelegate.propGatewayOffline getUserID],oldPassword,newPassword]] options:0 error:&error] objectForKey:@"ChangePasswordResult"];
    }@catch(NSException *exception){
        return @"Server Connection Failed";
    }
    
    return error.localizedFailureReason;
}

- (NSString *)closeAccount{
    NSError *error = [[NSError alloc] init];
    @try{
        return [[NSJSONSerialization JSONObjectWithData:[self httpsGetFrom:[NSString stringWithFormat:@"%@CloseByID?id=%@",_rootCandidates ,[_appDelegate.propGatewayOffline getUserID]]] options:0 error:&error] objectForKey:@"CloseByIDResult"];
    }@catch(NSException *exception){
        return @"Server Connection Failed";
    }
    
    return error.localizedFailureReason;
}

#pragma mark POSTS

- (id)saveCandidateDetailsWitJSONContents:(NSString *)jsonContents{
    NSString *body = [NSString stringWithFormat:@"{\"c\":%@}",jsonContents];
    @try{
        id result = [self httpPostFrom:@"https://arcapi.velosi.com/CandidateSvc.svc/json/Save" withBody:body];
        NSLog(@"savecandidateresult: %@",[NSJSONSerialization JSONObjectWithData:result options:0 error:nil]);
        return ([result isKindOfClass:[NSString class]])?result:nil;
    }@catch(NSException *exception){
        return _appDelegate.messageErrorGeneral;
    }
}

- (id)saveDocumentWithJSONContents:(NSString *)jsonContents{
    NSString *body = [NSString stringWithFormat:@"{\"j\":%@}",jsonContents];
    @try{
        id result = [self httpPostFrom:@"https://arcapi.velosi.com/DocumentSvc.svc/json/Save" withBody:body];
        return ([result isKindOfClass:[NSString class]])?result:nil;
    }@catch(NSException *exception){
        return _appDelegate.messageErrorGeneral;
    }
}

- (id)saveEmploymentWithJSONContents:(NSString *)jsonContents{
    NSString *body = [NSString stringWithFormat:@"{\"j\":%@}",jsonContents];
    @try{
        id result = [self httpPostFrom:@"https://arcapi.velosi.com/CandidateJobSvc.svc/json/Save" withBody:body];
        return ([result isKindOfClass:[NSString class]])?result:nil;
    }@catch(NSException *exception){
        return _appDelegate.messageErrorGeneral;
    }
}

- (id)saveSavedSearchesWithJSONContents:(NSString *)jsonContents{
    NSString *body = [NSString stringWithFormat:@"{\"j\":%@}",jsonContents];
    @try{
        id result = [self httpPostFrom:@"https://arcapi.velosi.com/JobsByEmailSvc.svc/json/Save" withBody:body];
        return ([result isKindOfClass:[NSString class]])?result:nil;
    }@catch(NSException *exception){
        return _appDelegate.messageErrorGeneral;
    }
}

- (id)applyJobWithJSONContents:(NSString *)jsonContents{
    NSString *body = [NSString stringWithFormat:@"{\"d\":%@}",jsonContents];
    @try{
        return [[NSJSONSerialization JSONObjectWithData:[self httpPostFrom:@"https://arcapi.velosi.com/ApplicationSvc.svc/json/Save" withBody:body] options:0 error:nil] objectForKey:@"SaveResult"];
    }@catch(NSException *exception) {
        return _appDelegate.messageErrorGeneral;
    }
    

}

@end
