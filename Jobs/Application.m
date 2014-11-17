//
//  Application.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "Application.h"

@implementation Application

- (Application *)initWithID:(int)applicationID title:(NSString *)title jobID:(NSString *)jobID jobRef:(NSString *)jobRef status:(NSString *)status dateAdded:(NSString *)dateAdded{
    self = [super init];
    
    if(self){
        _propID = applicationID;
        _propTitle = title;
        _propJobID = jobID;
        _propJobRef = jobRef;
        _propStatus = status;
        _propDateAdded = dateAdded;
    }
    
    return self;
}

@end
