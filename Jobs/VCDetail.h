//
//  VCTableViewDetail.h
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//
// Designed parent class for table view controller classes of static cells

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface VCDetail : UITableViewController<UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) AppDelegate *propAppDelegate;

@end
