//
//  Application.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "Application.h"

@interface Application(){
    NSMutableDictionary *_dictionary;
}
@end

@implementation Application

- (id)initWithDictionary:(NSDictionary *)d{
    self = [super init];
    
    if(self){
        _dictionary = [d mutableCopy];
    }
    
    return self;
}

- (NSString *)getJobApplicationID{
    return [_dictionary objectForKey:@"ApplicationID"];
}

- (NSString *)getVacancyTitle{
    return [_dictionary objectForKey:@"VacancyTitle"];
}

- (NSString *)getVacancyID{
    return [_dictionary objectForKey:@"VacancyID"];
}

- (NSString *)getVacancyRef{
    return [_dictionary objectForKey:@"VacancyRef"];
}

- (NSString *)getAppStatus{
    return [_dictionary objectForKey:@"AppStatus"];
}

- (NSString *)getStatusName{
    return [[_dictionary objectForKey:@"AppStatus"] objectForKey:@"StatusName"];
}

- (NSString *)getDateCreated{
    return [((AppDelegate *)[[UIApplication sharedApplication] delegate]).propGatewayOnline deserializeJsonDateString:[_dictionary objectForKey:@"DateCreated"]];
}


@end
