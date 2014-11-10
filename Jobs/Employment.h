//
//  Employment.h
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Employment : NSObject

@property (assign, nonatomic) int propJobID;
@property (strong, nonatomic) NSString *propJobTitle;
@property (strong, nonatomic) NSString *propDateStart;
@property (strong, nonatomic) NSString *propDateEnd;
@property (strong, nonatomic) NSString *propEmployer;
@property (strong, nonatomic) NSString *propDescription;

- (Employment *)initWithID:(int)jobID jobTitle:(NSString *)jobTitle startDate:(NSString *)startDate endDate:(NSString *)endDate employer:(NSString *)employer description:(NSString *)description;

@end
