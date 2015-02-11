//
//  JobDetail.m
//  Jobs
//
//  Created by Rick Royd Aban on 9/30/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "Job.h"

@interface Job(){
    NSDictionary *_dictionary;
}
@end

@implementation Job

+ (NSArray *)getJobDetailLabels{
    return @[@"Job Type", @"Duration", @"Start Date", @"Location", @"Salary", @"Contact"];
}

- (Job *)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self)
        _dictionary = dictionary;
    
    return self;

}

- (NSString *)getTypeDescription{
    return [[_dictionary objectForKey:@"VacancyType"] objectForKey:@"Description"];
}

- (NSString *)getDuration{
    return [_dictionary objectForKey:@"Duration"];
}

- (NSString *)getStartDate{
    return [_dictionary objectForKey:@"StartDate"];
}
- (NSString *)getLocation{
    return [_dictionary objectForKey:@"Location"];
}
- (NSString *)getSalary{
    return [_dictionary objectForKey:@"SalaryOther"];
}
- (NSString *)getContactName{
    return [_dictionary objectForKey:@"ContactName"];
}
- (NSString *)getDetails{
    return [_dictionary objectForKey:@"Description"];
}

- (int)getJobID{
    return [[_dictionary objectForKey:@"VacancyID"] intValue];
}

- (int)getClientID{
    return [[_dictionary objectForKey:@"ClientID"] intValue];
}

- (int)getCLientGroupID{
    return [[_dictionary objectForKey:@"GroupID"] intValue];
}

- (int)getOfficeID{
    return [[_dictionary objectForKey:@"OfficeID"] intValue];
}

- (NSString *)getReference{
    return [_dictionary objectForKey:@"VacancyRef"];
}

- (NSString *)getTitle{
    return [_dictionary objectForKey:@"Title"];
}

- (NSString *)getClientName{
    return [_dictionary objectForKey:@"ClientName"];
}

- (NSString *)getDateFrom{
    return  [_dictionary objectForKey:@"DateFrom"];
}

- (NSString *)getDateTo{
    return [_dictionary objectForKey:@"DateTo"];
}


@end
