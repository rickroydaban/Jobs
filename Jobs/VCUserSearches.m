//
//  VCUserSearches.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserSearches.h"

@implementation VCUserSearches

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}


@end
