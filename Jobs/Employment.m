//
//  Employment.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "Employment.h"

@implementation Employment

- (Employment *)initWithID:(int)jobID jobTitle:(NSString *)jobTitle startDate:(NSString *)startDate endDate:(NSString *)endDate employer:(NSString *)employer description:(NSString *)description{

    self = [super init];
    if(self){
        _propJobID = jobID;
        _propJobTitle = jobTitle;
        _propDateStart = startDate;
        _propDateEnd = endDate;
        _propEmployer = employer;
        _propDescription = description;
    }
    
    return self;
}

@end
