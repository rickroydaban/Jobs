//
//  SavedSearch.h
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavedSearch : NSObject

@property (strong, nonatomic) NSMutableDictionary *propSavedSearchDictionary;

- (SavedSearch *)initWithDictionary:(NSDictionary *)dictionary;

- (NSString *)getName;
- (NSString *)getDateAdded;
- (NSString *)getSearchFor;
- (NSString *)getSearchIn;
- (NSString *)getLocation;
- (NSString *)getCountryID; //the viewcontroller will handle to get the corresponding value of  this id impose simplicity of this class (avoid using for countrylist)
- (NSString *)getDistance;
- (NSString *)getJobType;
- (NSString *)getPostedWithin;
- (BOOL) willAlert;
- (void)changeSubscriptionWillAlert:(BOOL)willAlert;

-(NSString *)jsonFromName:(NSString *)name searchFor:(NSString *)searchFor searchInID:(NSString *)searchInID searchIn:(NSString *)searchIn location:(NSString *)location lat:(NSString *)lattitude lng:(NSString *)longitude countryID:(NSString *)countryID distance:(NSString *)distance jobTypeID:(NSString *)jobTypeID jobType:(NSString *)jobType postedWithin:(NSString *)postedWithin;
- (NSString *)jsonFromChangingStatus:(BOOL)willAlert;

@end
