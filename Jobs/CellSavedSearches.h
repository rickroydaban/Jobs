//
//  CellSavedSearches.h
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavedSearch.h"
#import "CellSavedSearchesDelegate.h"

@interface CellSavedSearches : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *propLabelTitle;
@property (strong, nonatomic) IBOutlet UILabel *propLabelDateAdded;
@property (strong, nonatomic) IBOutlet UISwitch *propSwitchStatus;
@property (strong, nonatomic) NSObject<CellSavedSearchDelegate> *delegate;

@end
