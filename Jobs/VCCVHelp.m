//
//  VCCVHelp.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCCVHelp.h"

@implementation VCCVHelp

- (void)viewDidLoad{
    [super viewDidLoad];
    self.propWebView.delegate = self;
    [self loadLink];
}

- (IBAction)showList:(id)sender {
    [self.appDelegate.slider toggleSidebar];
}

- (IBAction)refresh:(id)sender {
    [self loadLink];
}

- (void)loadLink{
    [self.propWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.velosijobs.com/CV-Help"]]];
}

@end
