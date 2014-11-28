//
//  VCTableViewDetail.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCDetail.h"
#import "VelosiColors.h"

@implementation VCDetail

- (void)viewDidLoad{
    self.navigationController.navigationBar.barTintColor = [VelosiColors orangeVelosi];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.view.backgroundColor = [VelosiColors white];

    _propAppDelegate = [[UIApplication sharedApplication] delegate];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    textField.textColor = [UIColor blackColor];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    textField.textColor = [UIColor lightGrayColor];
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    textView.textColor = [UIColor blackColor];
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    textView.textColor = [UIColor lightGrayColor];
}

@end
