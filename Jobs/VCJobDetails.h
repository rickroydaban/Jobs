//
//  VCJobDetails.h
//  Jobs
//
//  Created by Rick Royd Aban on 9/30/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"
#import "JobSummary.h"

@interface VCJobDetails : VCPage<UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *propLv;
@property (strong, nonatomic) JobSummary *propJob;
@property (assign, nonatomic) BOOL shouldShowApplyButton;

@end
