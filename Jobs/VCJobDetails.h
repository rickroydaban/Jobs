//
//  VCJobDetails.h
//  Jobs
//
//  Created by Rick Royd Aban on 9/30/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"
#import "Job.h"

@interface VCJobDetails : VCPage<UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *propLv;
@property (strong, nonatomic) Job *propJob;

@end
