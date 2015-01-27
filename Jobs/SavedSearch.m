//
//  SavedSearch.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "SavedSearch.h"

@interface SavedSearch(){
    NSMutableDictionary *_dictionary;
}
@end

@implementation SavedSearch

- (SavedSearch *)initWithDictionary:(NSDictionary *)d{
    self = [super init];
    
    if(self){
        _dictionary = [d mutableCopy];
    }
    
    return self;
}

- (NSString *)getJBEID{
    return [_dictionary objectForKey:@"JBEID"];
}

- (NSString *)getName{
    return [_dictionary objectForKey:@"Name"];
}

- (NSString *)getDateAdded{
    return [_dictionary objectForKey:@"DateCreated"];
}

- (NSString *)getSearchFor{
    return [_dictionary objectForKey:@"SearchText"];
}

- (NSString *)getSearchIn{
    return [[_dictionary objectForKey:@"VacancySearchIn"] objectForKey:@"VacancySearchInName"];
}

- (NSString *)getLocation{
    NSString *location = [[_dictionary objectForKey:@"Location"] objectForKey:@"LocationFull"];
    return ([location isEqualToString:@""])?@"Any":location;
}

- (NSString *)getCountryID{
    return [NSString stringWithFormat:@"%@",[_dictionary objectForKey:@"CountryID"]];
}

- (NSString *)getDistance{
    return [NSString stringWithFormat:@"%@",[_dictionary objectForKey:@"Radius"]];
}

- (NSString *)getJobType{
    return [[_dictionary objectForKey:@"VacancyType"] objectForKey:@"Description"];
}

- (NSString *)getPostedWithin{
    return [NSString stringWithFormat:@"%@",[_dictionary objectForKey:@"LastXDays"]];
}

- (BOOL)willAlert{
    return [[_dictionary objectForKey:@"EmailAlert"] boolValue];
}

- (void)changeSubscriptionWillAlert:(BOOL)willAlert{
    [_dictionary setValue:(willAlert)?@"true":@"false" forKey:@"EmailAlert"];
}

-(NSString *)jsonFromName:(NSString *)name searchFor:(NSString *)searchFor searchInID:(NSString *)searchInID searchIn:(NSString *)searchIn location:(NSString *)location lat:(NSString *)lattitude lng:(NSString *)longitude countryID:(NSString *)countryID distance:(NSString *)distance jobTypeID:(NSString *)jobTypeID jobType:(NSString *)jobType postedWithin:(NSString *)postedWithin{

    [_dictionary setValue:name forKey:@"Name"];
    [_dictionary setValue:searchFor forKey:@"SearchText"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[searchInID,searchInID,searchIn] forKeys:@[@"VacancySearchIn",@"VacancySearchInID",@"VacancySearchInName"]] forKey:@"VacancySearchIn"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[@"",@"",@"0",@"",@"",lattitude,location,longitude,@"0",@"",@""] forKeys:@[@"AccentCity",@"City",@"CodeInt",@"Country2",@"CountryName",@"Latitude",@"LocationFull",@"Longitude",@"Population",@"Region",@"Region2"]] forKey:@"Location"];
    [_dictionary setValue:countryID forKey:@"CountryID"];
    [_dictionary setValue:distance forKey:@"Radius"];
    [_dictionary setValue:[NSDictionary dictionaryWithObjects:@[jobType,jobTypeID,jobTypeID] forKeys:@[@"Description",@"Type",@"TypeID"]] forKey:@"VacancyType"];
    [_dictionary setValue:postedWithin forKey:@"LastXDays"];

    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:_dictionary options:0 error:nil] encoding:NSUTF8StringEncoding];
}

+ (NSString *)jsonFromNewSaveSearchWithName:(NSString *)name candidateID:(int)candidatID dateToday:(NSString *)dateToday searchFor:(NSString *)searchFor searchInID:(NSString *)searchInID searchIn:(NSString *)searchIn location:(NSString *)location lat:(NSString *)lattitude lng:(NSString *)longitude countryID:(NSString *)countryID distance:(NSString *)distance jobTypeID:(NSString *)jobTypeID jobType:(NSString *)jobType postedWithin:(NSString *)postedWithin{
    
    NSMutableDictionary *propNewSaveSearchDictionary = [NSMutableDictionary dictionary];
    [propNewSaveSearchDictionary setValue:name forKey:@"Name"];
    [propNewSaveSearchDictionary setValue:distance forKey:@"Radius"];
    [propNewSaveSearchDictionary setValue:[NSDictionary dictionaryWithObjects:@[searchInID,searchInID,searchIn] forKeys:@[@"VacancySearchIn",@"VacancySearchInID",@"VacancySearchInName"]] forKey:@"VacancySearchIn"];
    [propNewSaveSearchDictionary setValue:@0 forKey:@"JBEID"];
    [propNewSaveSearchDictionary setValue:[NSDictionary dictionaryWithObjects:@[@"Unknown",@0,@0] forKeys:@[@"IndustryName",@"Industry",@"IndustryID"]] forKey:@"Industry"];
    [propNewSaveSearchDictionary setValue:@(candidatID) forKey:@"CandidateID"];
    [propNewSaveSearchDictionary setValue:[NSNumber numberWithBool:YES] forKey:@"EmailAlert"];
    [propNewSaveSearchDictionary setValue:searchFor forKey:@"SearchText"];
    [propNewSaveSearchDictionary setValue:[NSString stringWithFormat:@"\/Date(%@-0100)\/",dateToday] forKey:@"DateCreated"];
    [propNewSaveSearchDictionary setValue:[NSDictionary dictionaryWithObjects:@[@"",@"",@"0",@"",@"",lattitude,location,longitude,@"0",@"",@""] forKeys:@[@"AccentCity",@"City",@"CodeInt",@"Country2",@"CountryName",@"Latitude",@"LocationFull",@"Longitude",@"Population",@"Region",@"Region2"]] forKey:@"Location"];
    [propNewSaveSearchDictionary setValue:[NSDictionary dictionaryWithObjects:@[jobType,jobTypeID,jobTypeID] forKeys:@[@"Description",@"Type",@"TypeID"]] forKey:@"VacancyType"];
    [propNewSaveSearchDictionary setValue:countryID forKey:@"CountryID"];
    [propNewSaveSearchDictionary setValue:postedWithin forKey:@"LastXDays"];
    
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:propNewSaveSearchDictionary options:0 error:nil] encoding:NSUTF8StringEncoding];
}


- (NSString *)jsonFromChangingStatus:(BOOL)willAlert{
    [_dictionary setValue:(willAlert)?@"true":@"false" forKey:@"EmailAlert"];
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:_dictionary options:0 error:nil] encoding:NSUTF8StringEncoding];
}

@end
