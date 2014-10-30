//
//  VCUserEmployments.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserEmployments.h"

@implementation VCUserEmployments

- (void)viewDidLoad{
    [super viewDidLoad];
    
}

- (IBAction)showList:(id)sender {
    [self.appDelegate.slider toggleSidebar];
}

- (IBAction)done:(id)sender {
    NSLog(@"Done");
}

@end
