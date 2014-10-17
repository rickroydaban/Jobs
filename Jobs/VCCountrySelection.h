//
//  VCCountrySelection.h
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/24/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"
#import "CellSelector.h"

@interface VCCountrySelection : VCPage<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, CellSelector>

@property (strong, nonatomic) IBOutlet UITableView *lv;
@property (strong, nonatomic) IBOutlet UITextField *fieldSearch;

@property (strong, nonatomic) NSMutableArray *selectedFields;

@end
