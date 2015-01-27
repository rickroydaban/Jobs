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
//fields that will be passed by the search job segue
@property (strong, nonatomic) NSString *propSearchFor, *propSearchIn, *propSearchLocationID, *propSearchLocation, *propSearchCountryID, *propSearchDistance, *propSearchJobType, *propSearchPostedWithin;

@end
