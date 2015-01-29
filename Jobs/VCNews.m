//
//  VCNews.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCNews.h"

@implementation VCNews

- (void)viewDidLoad{
    [super viewDidLoad];
    self.propWebView.delegate = self;
    [self loadLink];
}

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}

- (IBAction)refresh:(id)sender {
    [self loadLink];
}

- (void)loadLink{
    [self.propWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.velosijobs.com/app/news"]]];
}

@end
