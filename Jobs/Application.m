//
//  Application.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "Application.h"

@implementation Application

- (Application *)initWithID:(int)applicationId title:(NSString *)title reference:(NSString *)reference status:(NSString *)status dateAdded:(NSString *)dateAdded{
    self = [super init];
    
    if(self){
        _propID = applicationId;
        _propTitle = title;
        _propReference = reference;
        _propStatus = status;
        _propDateAdded = dateAdded;
    }
    
    return self;
}

@end
