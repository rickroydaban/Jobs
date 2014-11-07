//
//  VCUserPassword.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserPassword.h"
#import "MBProgressHUD.h"

@interface VCUserPassword(){
    UIAlertView *_alertviewSuccess;
}
@end

@implementation VCUserPassword

- (void)viewDidLoad{
    [super viewDidLoad];
    _alertviewSuccess = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Changed Successfully" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            NSLog(@"Submit");
            break;
            
        case 1:
            NSLog(@"Logout");
            break;
            
        default:
            break;
    }
}

- (IBAction)showList:(id)sender {
    [self.view endEditing:YES];
    [self.propAppDelegate.propSlider toggleSidebar];
}

- (IBAction)done:(id)sender {
    if(self.fieldOldPassword.text.length<1 || self.fieldNewPassword.text.length<1 || self.fieldConfirmPassword.text.length<1)
        [[[UIAlertView alloc] initWithTitle:@"Message" message:@"All fields are required to have values" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
    else if(![self.fieldNewPassword.text isEqualToString:self.fieldConfirmPassword.text])
        [[[UIAlertView alloc] initWithTitle:@"Message" message:@"Passwords do not match" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
    else{
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSString *alertMessage = [NSString stringWithFormat:@"%@",[self.propAppDelegate.propGatewayOnline changePassword:self.fieldOldPassword.text to:self.fieldNewPassword.text]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([alertMessage isEqualToString:@"OK"]) {
                    [_alertviewSuccess show];
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                }else{
                    [[[UIAlertView alloc] initWithTitle:@"Message" message:alertMessage delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                }
            });
        });
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    self.fieldOldPassword.text = @"";
    self.fieldNewPassword.text = @"";
    self.fieldConfirmPassword.text = @"";
    [self.view endEditing:YES];
}

@end
