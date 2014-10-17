//
//  VCJobSummary.h
//  Jobs
//
//  Created by Rick Royd Aban on 9/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"

@interface VCJobSummary : VCPage<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *lv;
@property (strong, nonatomic) NSMutableArray *jobs;

@end
