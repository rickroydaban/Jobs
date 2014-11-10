//
//  SavedSearch.h
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavedSearch : NSObject

@property (assign, nonatomic) int propID, propJobTypeID, propSearchIn, propCountryID, propPostedWithin, propDistance;
@property (assign, nonatomic) BOOL propEmailAlert;
@property (strong, nonatomic) NSString *propTitle;
@property (strong, nonatomic) NSString *propDateAdded;
@property (strong, nonatomic) NSString *propSearchFor;
@property (strong, nonatomic) NSString *propLocation;

- (SavedSearch *)initWithID:(int)savedSearchID title:(NSString *)title dateAdded:(NSString *)dateAdded status:(BOOL)emailAlert searchFor:(NSString *)searchFor searchInID:(int)searchIn location:(NSString *)location distance:(int)distance countryID:(int)country jobTypeID:(int)jobType postedWithin:(int)postedWithin;

@end
