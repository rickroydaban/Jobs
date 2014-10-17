//
//  Job.m
//  Jobs
//
//  Created by Rick Royd Aban on 9/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "Job.h"

@implementation Job

- (Job *)initWithId: (int)jobId title:(NSString *)title reference:(NSString *)reference country:(NSString *)country dateAdded:(NSString *)dateAdded details:(NSString *)details{
    
    self = [super init];
    if(self){
        self.jobId = jobId;
        self.title = title;
        self.reference = reference;
        self.country = country;
        self.dateAdded = dateAdded;
        self.details = details;
    }
    
    return self;
}

@end
