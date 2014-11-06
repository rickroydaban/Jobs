//
//  VCHome.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/27/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCHome.h"

@implementation VCHome

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}

@end
