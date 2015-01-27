//
//  VCSaveSearch.h
//  Jobs
//
//  Created by Rick Royd Aban on 11/25/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCDetail.h"

@interface VCSaveSearch : VCDetail<UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *propFieldTitle;
@property (strong, nonatomic) IBOutlet UISwitch *propSwitchAlerts;

@property (strong, nonatomic) NSString *propSearchInID, *propCountryID, *propJobTypeID, *propPostedWithin, *propSearchFor, *propSearchIn, *propLocation, *propLocationID, *propLat, *propLng, *propDistance, *propJobType;

@end
