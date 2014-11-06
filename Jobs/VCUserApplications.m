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
    
}

- (IBAction)toggleActions:(id)sender {
}

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}


@end
