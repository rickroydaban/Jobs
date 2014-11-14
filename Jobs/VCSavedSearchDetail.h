//
//  VCSavedSearchDetail.h
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCTableViewDetail.h"
#import "SavedSearch.h"
#import "VelosiPickerRowSelectionDelegate.h"

@interface VCSavedSearchDetail : VCTableViewDetail<VelosiPickerRowSelectionDelegate>

@property (strong, nonatomic) IBOutlet UITextField *propFieldName;
@property (strong, nonatomic) IBOutlet UITextField *propFieldSearchFor;
@property (strong, nonatomic) IBOutlet UITextField *propFieldSearchIn;
@property (strong, nonatomic) IBOutlet UITableViewCell *propCellLocation;
@property (strong, nonatomic) IBOutlet UITableViewCell *propCellCountry;
@property (strong, nonatomic) IBOutlet UITextField *propFieldDistance;
@property (strong, nonatomic) IBOutlet UITextField *propFieldJobType;
@property (strong, nonatomic) IBOutlet UITextField *propFieldPostedWithin;

@property (strong, nonatomic) SavedSearch *propSavedSearch;

@end
