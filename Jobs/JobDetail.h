//
//  JobDetail.h
//  Jobs
//
//  Created by Rick Royd Aban on 9/30/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JobDetail : NSObject

@property (strong, nonatomic) NSString *propJobType;
@property (strong, nonatomic) NSString *propDuration;
@property (strong, nonatomic) NSString *propRotation;
@property (strong, nonatomic) NSString *propLocation;
@property (strong, nonatomic) NSString *propSalary;
@property (strong, nonatomic) NSString *propContact;
@property (strong, nonatomic) NSString *propDetails;

- (JobDetail *)initWithType: (NSString *)type duration:(NSString *)duration rotation:(NSString *)rotation location:(NSString *)location salary:(NSString *)salary contacts:(NSString *)contact details:(NSString *)details;
- (NSArray *)getJobDetailList;

@end
