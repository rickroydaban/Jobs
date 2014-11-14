//
//  Employment.h
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Employment : NSObject

@property (strong, nonatomic) NSMutableDictionary *propEmploymentDictionary;

- (Employment *)initWithDictionary:(NSDictionary *)dictionary;

//fields in the edit detail view controller
- (NSString *)getEmployer;
- (NSString *)getJobTitle;
- (NSString *)getDateStart;
- (NSString *)getDateEnd;
- (NSString *)getDescription;

- (NSString *)jsonFromEmployer:(NSString *)employer jobTitle:(NSString *)jobTitle startDate:(NSString *)dateStart endDate:(NSString *)dateEnd description:(NSString *)description;

@end
