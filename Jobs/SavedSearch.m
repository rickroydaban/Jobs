//
//  SavedSearch.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "SavedSearch.h"

@implementation SavedSearch

- (SavedSearch *)initWithID:(int)savedSearchID title:(NSString *)title dateAdded:(NSString *)dateAdded status:(BOOL)emailAlert searchFor:(NSString *)searchFor searchInID:(int)searchIn location:(NSString *)location distance:(int)distance countryID:(int)country jobTypeID:(int)jobType postedWithin:(int)postedWithin{
    self = [super init];
    
    if(self){
        _propID = savedSearchID;
        _propTitle = title;
        _propDateAdded = dateAdded;
        _propEmailAlert = emailAlert;
        _propSearchFor = searchFor;
        _propSearchIn = searchIn;
        _propLocation = location;
        _propDistance = distance;
        _propCountryID = country;
        _propJobTypeID = jobType;
        _propPostedWithin = postedWithin;
    }
    
    return self;
}


@end
