//
//  Job.m
//  Jobs
//
//  Created by Rick Royd Aban on 9/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "JobSummary.h"

@interface JobSummary(){
    int _jobID;
    NSString *_title, *_reference, *_country, *_dateAdded, *_details;
}
@end

@implementation JobSummary

- (JobSummary *)initWithId:(int)jobId title:(NSString *)title reference:(NSString *)reference country:(NSString *)country dateAdded:(NSString *)dateAdded details:(NSString *)details{

    self = [super init];
    if(self){
        _jobID = jobId;
        _title = title;
        _reference = reference;
        _country = country;
        _dateAdded = dateAdded;
        _details = details;
    }
    
    return self;
}

- (int)getJobID{
    return _jobID;
}

- (NSString *)getTitle{
    return _title;
}

- (NSString *)getReference{
    return _reference;
}

- (NSString *)getCountry{
    return _country;
}

- (NSString *)getDateAdded{
    return _dateAdded;
}

- (NSString *) getDetails{
    return _details;
}


@end
