//
//  JobDetail.h
//  Jobs
//
//  Created by Rick Royd Aban on 9/30/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

@interface Job : NSObject

+ (NSArray *)getJobDetailLabels;

- (Job *)initWithDictionary:(NSDictionary *)dictionary;
//fields shown in the details page
- (NSString *)getTypeDescription;
- (NSString *)getDuration;
- (NSString *)getStartDate;
- (NSString *)getLocation;
- (NSString *)getSalary;
- (NSString *)getContactName;
- (NSString *)getDetails;
//other fields needed for saving applications
- (int)getJobID;
- (int)getClientID;
- (int)getCLientGroupID;
- (int)getOfficeID;
- (NSString *)getReference;
- (NSString *)getTitle;
- (NSString *)getClientName;
- (NSString *)getDateFrom;
- (NSString *)getDateTo;

@end
