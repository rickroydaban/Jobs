//
//  Application.h
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

@interface Application : NSObject

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (NSString *)getJobApplicationID;
- (NSString *)getVacancyTitle;
- (NSString *)getVacancyID;
- (NSString *)getVacancyRef;
- (NSString *)getAppStatus;
- (NSString *)getStatusName;
- (NSString *)getDateCreated;

@end
