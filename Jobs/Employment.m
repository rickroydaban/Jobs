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
    [_propEmploymentDictionary setValue:description forKey:@"Decription"];
    
    //convert dictionary to json
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:_propEmploymentDictionary options:0 error:nil] encoding:NSUTF8StringEncoding];
}

@end
