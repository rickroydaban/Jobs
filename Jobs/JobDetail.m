//
//  JobDetail.m
//  Jobs
//
//  Created by Rick Royd Aban on 9/30/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "JobDetail.h"

@interface JobDetail(){
    NSArray *_jobDetailList;
}
@end

@implementation JobDetail

- (JobDetail *)initWithType: (NSString *)type duration:(NSString *)duration rotation:(NSString *)rotation location:(NSString *)location salary:(NSString *)salary contacts:(NSString *)contact details:(NSString *)details{
    
    self = [super init];
    if(self){
        self.jobType = type;
        self.duration = duration;
        self.rotation = rotation;
        self.location = location;
        self.salary = salary;
        self.contact = contact;
        self.details = details;
        
        _jobDetailList = @[@"Job Type", @"Duration", @"Start Date", @"Location", @"Salary", @"Contact"];
    }
    return self;
}

- (NSArray *)getJobDetailList{
    return _jobDetailList;
}

@end
