//
//  VCLogin.m
//  Jobs
//
//  Created by Rick Royd Aban on 9/26/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//
#import "VCLogin.h"
#import "VelosiColors.h"
#import "MBProgressHUD.h"

@interface VCLogin(){
    UITapGestureRecognizer *_viewTappedRecognizer;
}
@end

@implementation VCLogin

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [VelosiColors orangeVelosi];
    _viewTappedRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onViewTapped)];
    [self.view addGestureRecognizer:_viewTappedRecognizer];
    
    self.fieldUsername.delegate = self;
    self.fieldPassword.delegate = self;
    
    self.fieldUsername.backgroundColor = [UIColor whiteColor];
    self.fieldPassword.backgroundColor = [UIColor whiteColor];
    UIImageView *ivUsername = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
    ivUsername.image = [UIImage imageNamed:@"icon_username"];
    UIImageView *ivPassword = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
    ivPassword.image = [UIImage imageNamed:@"icon_password"];
    
    self.fieldUsername.leftViewMode = UITextFieldViewModeAlways;
    self.fieldUsername.leftView = ivUsername;
        self.fieldPassword.leftViewMode = UITextFieldViewModeAlways;
    self.fieldPassword.leftView= ivPassword;
    self.fieldUsername.text = @"admin@blandyuk.co.uk";
    self.fieldPassword.text = @"redrose1982";
}

- (void)onViewTapped{
    [self.view endEditing:YES];
}

- (IBAction)searchAdvance:(id)sender {
    [self switchToAdvanceSearchPage:sender];
}

- (IBAction)login {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self.appDelegate.onlineGateway authenticateUserName:self.fieldUsername.text password:self.fieldPassword.text];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            if([self.appDelegate.offlineGateway isLoggedIn]){
                [self switchToDetailPage];
            }
            else
                [[[UIAlertView alloc] initWithTitle:nil message:@"Your details are invalid" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        });
    });
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.fieldUsername) {
        [self.fieldPassword becomeFirstResponder];
    }else if(textField == self.fieldPassword){
        [self.view endEditing:YES];
    }
    
    return YES;
}


@end
