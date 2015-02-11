//
//  VCForgotPassword.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/11/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCForgotPassword.h"

@implementation VCForgotPassword

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidAppear:(BOOL)animated{
    _propFieldUsername.text = [self.propAppDelegate.propGatewayOffline getPrevUsername];
    [_propFieldUsername becomeFirstResponder];
    
}

- (IBAction)submit:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *result = [self.propAppDelegate.propGatewayOnline resetPasswordWithEmail:_propFieldUsername.text];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [[[UIAlertView alloc] initWithTitle:([result isEqualToString:@"OK"])?@"Success":@"Failed" message:([result isEqualToString:@"OK"])?@"Please wait while we send your new password to you email shortly":result delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
        });
    });
}

@end
