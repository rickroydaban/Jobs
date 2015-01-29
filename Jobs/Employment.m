//
//  Employment.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "Employment.h"

@implementation Employment

- (Employment *)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        _propEmploymentDictionary = [dictionary mutableCopy];
    }
    
    return self;
}

- (NSString *)getJobID{
    return [_propEmploymentDictionary objectForKey:@"JobID"];
}

- (NSString *)getEmployer{
    return [_propEmploymentDictionary objectForKey:@"Employer"];
}

- (NSString *)getJobTitle{
    return [_propEmploymentDictionary objectForKey:@"Title"];
}

- (NSString *)getDateStart{
    return [_propEmploymentDictionary objectForKey:@"StartDate"];
}

- (NSString *)getDateEnd{
    return [_propEmploymentDictionary objectForKey:@"EndDate"];
}

- (NSString *)getDescription{
    return [_propEmploymentDictionary objectForKey:@"Description"];
}

- (NSString *)jsonFromEmployer:(NSString *)employer jobTitle:(NSString *)jobTitle startDate:(NSString *)dateStart endDate:(NSString *)dateEnd description:(NSString *)description{
    
    //update data of the editable fields
    [_propEmploymentDictionary setValue:employer forKey:@"Employer"];
    [_propEmploymentDictionary setValue:jobTitle forKey:@"Title"];
    [_propEmploymentDictionary setValue:dateStart forKey:@"StartDate"];
    [_propEmploymentDictionary setValue:dateEnd forKey:@"EndDate"];
    [_propEmploymentDictionary setValue:description forKey:@"Description"];
    
    //convert dictionary to json
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:_propEmploymentDictionary options:0 error:nil] encoding:NSUTF8StringEncoding];
}

+ (NSString *)jsonFromNewEmployerName:(NSString *)employer jobTitle:(NSString *)jobTitle startDate:(NSString *)dateStart endDate:(NSString *)dateEnd description:(NSString *)description dateToday:(NSString *)dateToday userID:(int)userID{
    
    NSMutableDictionary *propEmploymentDictionary = [NSMutableDictionary dictionary];
    [propEmploymentDictionary setValue:@0 forKey:@"JobID"];
    [propEmploymentDictionary setValue:@(userID) forKey:@"CandidateID"];
    [propEmploymentDictionary setValue:[NSString stringWithFormat:@"\/Date(%@-0100)\/",dateToday] forKey:@"DateCreated"];
    [propEmploymentDictionary setValue:@1 forKey:@"OrderID"];
    [propEmploymentDictionary setValue:employer forKey:@"Employer"];
    [propEmploymentDictionary setValue:jobTitle forKey:@"Title"];
    [propEmploymentDictionary setValue:dateStart forKey:@"StartDate"];
    [propEmploymentDictionary setValue:dateEnd forKey:@"EndDate"];
    [propEmploymentDictionary setValue:description forKey:@"Description"];

    //convert dictionary to json
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:propEmploymentDictionary options:0 error:nil] encoding:NSUTF8StringEncoding];
}

@end
