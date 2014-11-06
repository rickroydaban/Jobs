//
//  VCJobSummary.h
//  Jobs
//
//  Created by Rick Royd Aban on 9/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"

@interface VCJobSummary : VCPage<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *propLv;
@property (strong, nonatomic) NSMutableArray *propListJobs;

@end
