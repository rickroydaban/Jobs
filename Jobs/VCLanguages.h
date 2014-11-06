//
//  VCLanguages.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/20/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"
#import "CellSelector.h"

@interface VCLanguages : VCPage<UITableViewDataSource, UITableViewDelegate, CellSelector>

@property (strong, nonatomic) IBOutlet UITableView *propLv;
@property (strong, nonatomic) NSMutableArray *propListLanguages;
@end
