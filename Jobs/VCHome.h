//
//  VCHome.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/27/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"

@interface VCHome : VCPage<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *propLV;
@property (strong, nonatomic) NSMutableArray *propListVacancies;

@end
