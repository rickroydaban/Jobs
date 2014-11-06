//
//  VCUserTables.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/28/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserTables.h"
#import "VelosiColors.h"

@implementation VCUserTables

- (void)viewDidLoad{
    self.navigationController.navigationBar.barTintColor = [VelosiColors orangeVelosi];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.view.backgroundColor = [VelosiColors white];
    
    _propAppDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

}

@end
