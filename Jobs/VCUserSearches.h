//
//  VCUserSearches.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"
#import "CellSavedSearches.h"

@interface VCUserSearches : VCPage<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, CellSavedSearchDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *propLv;
@property (strong, nonatomic) NSMutableArray *propListSavedSearches;
@end
