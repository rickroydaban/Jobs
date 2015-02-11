//
//  Job.h
//  Jobs
//
//  Created by Rick Royd Aban on 9/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

@interface JobSummary : NSObject

- (JobSummary *)initWithId:(int)jobId title:(NSString *)title reference:(NSString *)reference country:(NSString *)country dateAdded:(NSString *)dateAdded details:(NSString *)details;

- (int)getJobID;
- (NSString *)getTitle;
- (NSString *)getReference;
- (NSString *)getCountry;
- (NSString *)getDateAdded;
- (NSString *) getDetails;

@end
