//
//  VCUserApplications.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/15/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserApplications.h"

@implementation VCUserApplications

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _bottomNavigator.layer.shadowColor = [UIColor blackColor].CGColor;
    _bottomNavigator.layer.shadowOpacity = 1;
    _bottomNavigator.layer.shadowOffset = CGSizeMake(0, 0);
}

- (IBAction)toggleActions:(id)sender {
    [[[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Save", @"Close Account", @"Logout", nil] showInView:self.view];
}

- (IBAction)showList:(id)sender {
    [self.appDelegate.slider toggleSidebar];
}


@end
