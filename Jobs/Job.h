//
//  Job.h
//  Jobs
//
//  Created by Rick Royd Aban on 9/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Job : NSObject

@property (assign, nonatomic) int jobId;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *reference;
@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSString *dateAdded;
@property (strong, nonatomic) NSString *details;

- (Job *)initWithId: (int)jobId title:(NSString *)title reference:(NSString *)reference country:(NSString *)country dateAdded:(NSString *)dateAdded details:(NSString *)details;

@end
