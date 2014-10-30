//
//  VCUserPassword.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserPassword.h"

@implementation VCUserPassword

- (void)viewDidLoad{
    [super viewDidLoad];
    
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
    [self.appDelegate.slider toggleSidebar];
}

- (IBAction)done:(id)sender {
    NSLog(@"Done");
}

@end
