//
//  VCSearchJob.h
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCPage.h"
#import "VelosiPickerRowSelectionDelegate.h"

@interface VCSearchJob : VCPage<UITextFieldDelegate, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate, VelosiPickerRowSelectionDelegate>

@property (strong, nonatomic) IBOutlet UITableView *lv;
@property (strong, nonatomic) UITextField *fieldSearchFor;
@property (strong, nonatomic) UITextField *fieldSearchIn;
@property (strong, nonatomic) UITextField *fieldCountry;
@property (strong, nonatomic) UITextField *fieldDistance;
@property (strong, nonatomic) UITextField *fieldJobType;
@property (strong, nonatomic) UITextField *fieldPostedWithin;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *profileButton;

+ (VCSearchJob *)getInstance;

@end
