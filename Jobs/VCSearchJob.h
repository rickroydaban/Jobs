//
//  VCSearchJob.h
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCDetail.h"
#import "VelosiPickerRowSelectionDelegate.h"

@interface VCSearchJob : VCDetail<VelosiPickerRowSelectionDelegate>

@property (strong, nonatomic) IBOutlet UITextField *propFieldSearchFor;
@property (strong, nonatomic) IBOutlet UITextField *propFieldSearchIn;
@property (strong, nonatomic) IBOutlet UITableViewCell *propCellLocation;
@property (strong, nonatomic) IBOutlet UITableViewCell *propCellCountry;
@property (strong, nonatomic) IBOutlet UITextField *propFieldDistance;
@property (strong, nonatomic) IBOutlet UITextField *propFieldJobType;
@property (strong, nonatomic) IBOutlet UITextField *propFieldPostedWithin;

@end
