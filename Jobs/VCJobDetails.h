//
//  VCJobDetails.h
//  Jobs
//
//  Created by Rick Royd Aban on 9/30/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCDetail.h"
#import "JobSummary.h"

//@interface VCJobDetails : VCPage<UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate, UIAlertViewDelegate>
@interface VCJobDetails :VCDetail<UIAlertViewDelegate, UIWebViewDelegate>

@property (strong, nonatomic) JobSummary *propJob;
@property (assign, nonatomic) BOOL shouldShowApplyButton;

@end
