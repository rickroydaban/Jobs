//
//  VCCountrySelection.h
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/24/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"

@interface VCCountrySelection : VCPage<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITableView *lv;

@property (strong, nonatomic) IBOutlet UITextField *fieldSearch;

@end
