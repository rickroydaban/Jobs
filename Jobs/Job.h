//
//  Job.h
//  Jobs
//
//  Created by Rick Royd Aban on 9/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

@interface Job : NSObject

@property (assign, nonatomic) int propJobID;
@property (strong, nonatomic) NSString *propTitle;
@property (strong, nonatomic) NSString *propReference;
@property (strong, nonatomic) NSString *propCountry;
@property (strong, nonatomic) NSString *propDateAdded;
@property (strong, nonatomic) NSString *propDetails;

- (Job *)initWithId: (int)jobId title:(NSString *)title reference:(NSString *)reference country:(NSString *)country dateAdded:(NSString *)dateAdded details:(NSString *)details;

@end
