//
//  VCUserEmployments.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"

@interface VCUserEmployments : VCPage<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *propLV;
@property (strong, nonatomic) NSMutableArray *propListEmployments;

@end
