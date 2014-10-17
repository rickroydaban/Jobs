//
//  JobDetail.h
//  Jobs
//
//  Created by Rick Royd Aban on 9/30/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JobDetail : NSObject

@property (strong, nonatomic) NSString *jobType;
@property (strong, nonatomic) NSString *duration;
@property (strong, nonatomic) NSString *rotation;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *salary;
@property (strong, nonatomic) NSString *contact;
@property (strong, nonatomic) NSString *details;

- (JobDetail *)initWithType: (NSString *)type duration:(NSString *)duration rotation:(NSString *)rotation location:(NSString *)location salary:(NSString *)salary contacts:(NSString *)contact details:(NSString *)details;
- (NSArray *)getJobDetailList;

@end
