//
//  VCLocationSelection.h
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/24/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"
#import "VCSearchJob.h"
#import "CellSelector.h"

@interface VCLocationSelection : VCPage<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, CellSelector>

@property (strong, nonatomic) IBOutlet UITableView *propLv;
@property (strong, nonatomic) IBOutlet UISearchBar *propFieldSearch;

@end
