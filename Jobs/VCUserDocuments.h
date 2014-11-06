//
//  VCUserDocuments.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"

@interface VCUserDocuments : VCPage<UIActionSheetDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *propLv;
@property (strong, nonatomic) NSArray *propListDocuments;

@end
