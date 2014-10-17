//
//  VCPage.m
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"
#import "VelosiColors.h"

@interface VCPage ()

@end

@implementation VCPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [VelosiColors orangeVelosi];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.view.backgroundColor = [VelosiColors white];
    
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

@end
