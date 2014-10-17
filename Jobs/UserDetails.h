//
//  UserDetails.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/13/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDetails : NSObject

@property (strong, nonatomic, readonly) NSArray *propListSalaryType;
@property (strong, nonatomic, readonly) NSArray *propListAvailability;
@property (strong, nonatomic, readonly) NSArray *propListEducation;
@property (strong, nonatomic, readonly) NSArray *propListGender;
@property (strong, nonatomic, readonly) NSArray *propListMaritalStatus;
@property (strong, nonatomic, readonly) NSArray *propListYearGraduated;
@property (strong, nonatomic, readonly) NSArray *propListNationality;
@property (strong, nonatomic, readonly) NSArray *propListLicense;
@property (strong, nonatomic, readonly) NSArray *propListRelocate;
@property (strong, nonatomic, readonly) NSArray *propListEthnicity;

@property (strong, nonatomic, readonly) NSDictionary *propDictSalaryType;
@property (strong, nonatomic, readonly) NSDictionary *propDictAvailability;
@property (strong, nonatomic, readonly) NSDictionary *propDictEducation;
@property (strong, nonatomic, readonly) NSDictionary *propDictGender;
@property (strong, nonatomic, readonly) NSDictionary *propDictMaritalStatus;
@property (strong, nonatomic, readonly) NSDictionary *propDictNationality;
@property (strong, nonatomic, readonly) NSDictionary *propDictLicense;
@property (strong, nonatomic, readonly) NSDictionary *propDictRelocate;
@property (strong, nonatomic, readonly) NSDictionary *propDictEtchnicity;

@end
