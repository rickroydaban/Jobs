//
//  SavedSearch.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "SavedSearch.h"

@implementation SavedSearch

- (SavedSearch *)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    
    if(self){
        _propSavedSearchDictionary = [dictionary mutableCopy];
    }
    
    return self;
}

- (NSString *)getName{
    return [_propSavedSearchDictionary objectForKey:@"Name"];
}

- (NSString *)getDateAdded{
    return [_propSavedSearchDictionary objectForKey:@"DateCreated"];
}

- (NSString *)getSearchFor{
    return [_propSavedSearchDictionary objectForKey:@"SearchText"];
}

- (NSString *)getSearchIn{
    return [[_propSavedSearchDictionary objectForKey:@"VacancySearchIn"] objectForKey:@"VacancySearchInName"];
}

- (NSString *)getLocation{
    NSString *location = [[_propSavedSearchDictionary objectForKey:@"Location"] objectForKey:@"LocationFull"];
    return ([location isEqualToString:@""])?@"Any":location;
}

- (NSString *)getCountryID{
    return [NSString stringWithFormat:@"%@",[_propSavedSearchDictionary objectForKey:@"CountryID"]];
}

- (NSString *)getDistance{
    return [NSString stringWithFormat:@"%@",[_propSavedSearchDictionary objectForKey:@"Radius"]];
}

- (NSString *)getJobType{
    return [[_propSavedSearchDictionary objectForKey:@"VacancyType"] objectForKey:@"Description"];
}

- (NSString *)getPostedWithin{
    return [NSString stringWithFormat:@"%@",[_propSavedSearchDictionary objectForKey:@"LastXDays"]];
}

- (BOOL)willAlert{
    return [[_propSavedSearchDictionary objectForKey:@"EmailAlert"] boolValue];
}

- (void)changeSubscriptionWillAlert:(BOOL)willAlert{
    [_propSavedSearchDictionary setValue:(willAlert)?@"true":@"false" forKey:@"EmailAlert"];
}

-(NSString *)jsonFromName:(NSString *)name searchFor:(NSString *)searchFor searchInID:(NSString *)searchInID searchIn:(NSString *)searchIn location:(NSString *)location lat:(NSString *)lattitude lng:(NSString *)longitude countryID:(NSString *)countryID distance:(NSString *)distance jobTypeID:(NSString *)jobTypeID jobType:(NSString *)jobType postedWithin:(NSString *)postedWithin{

    [_propSavedSearchDictionary setValue:name forKey:@"Name"];
    [_propSavedSearchDictionary setValue:searchFor forKey:@"SearchText"];
    [_propSavedSearchDictionary setValue:[NSDictionary dictionaryWithObjects:@[searchInID,searchInID,searchIn] forKeys:@[@"VacancySearchIn",@"VacancySearchInID",@"VacancySearchInName"]] forKey:@"VacancySearchIn"];
    [_propSavedSearchDictionary setValue:[NSDictionary dictionaryWithObjects:@[@"",@"",@"0",@"",@"",lattitude,location,longitude,@"0",@"",@""] forKeys:@[@"AccentCity",@"City",@"CodeInt",@"Country2",@"CountryName",@"Latitude",@"LocationFull",@"Longitude",@"Population",@"Region",@"Region2"]] forKey:@"Location"];
    [_propSavedSearchDictionary setValue:countryID forKey:@"CountryID"];
    [_propSavedSearchDictionary setValue:distance forKey:@"Radius"];
    [_propSavedSearchDictionary setValue:[NSDictionary dictionaryWithObjects:@[jobType,jobTypeID,jobTypeID] forKeys:@[@"Description",@"Type",@"TypeID"]] forKey:@"VacancyType"];
    [_propSavedSearchDictionary setValue:postedWithin forKey:@"LastXDays"];

    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:_propSavedSearchDictionary options:0 error:nil] encoding:NSUTF8StringEncoding];
}

- (NSString *)jsonFromChangingStatus:(BOOL)willAlert{
    [_propSavedSearchDictionary setValue:(willAlert)?@"true":@"false" forKey:@"EmailAlert"];
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:_propSavedSearchDictionary options:0 error:nil] encoding:NSUTF8StringEncoding];
}

@end
