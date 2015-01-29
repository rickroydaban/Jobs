//
//  VCSaveSearch.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/25/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCSaveSearch.h"
#import "SavedSearch.h"

@implementation VCSaveSearch

- (IBAction)done:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *dateToday = [NSString stringWithFormat:@"\/Date(%.0f)\/",[[NSDate date] timeIntervalSince1970]*1000];
        NSString *result = [self.propAppDelegate.propGatewayOnline saveSavedSearchesWithJSONContents:[SavedSearch jsonFromNewSaveSearchWithName:_propFieldTitle.text candidateID:[[self.propAppDelegate.propGatewayOffline getUserID] intValue] dateToday:dateToday searchFor:_propSearchFor searchInID:_propSearchInID searchIn:_propSearchIn location:_propLocation lat:_propLat lng:_propLng countryID:_propCountryID distance:_propDistance jobTypeID:_propJobTypeID jobType:_propJobType postedWithin:_propPostedWithin]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[[UIAlertView alloc] initWithTitle:@" " message:(result)?result:self.propAppDelegate.messageSaveSuccessful delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
            [self.view endEditing:YES];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
