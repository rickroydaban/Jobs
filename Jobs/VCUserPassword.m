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
    
    _lvContainer.layer.shadowColor = [UIColor blackColor].CGColor;
    _lvContainer.layer.shadowOpacity = 1;
    _lvContainer.layer.shadowOffset = CGSizeMake(0, 0);
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
    [self.appDelegate.slider toggleSidebar];
}

@end
