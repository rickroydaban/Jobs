//
//  VCCopyright.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCCopyright.h"

@implementation VCCopyright

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
    [self.propWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.velosijobs.com/about-us/copyright"]]];
}

@end
