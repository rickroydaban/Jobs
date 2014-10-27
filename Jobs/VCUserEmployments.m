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
    
    _bottomNavigator.layer.shadowColor = [UIColor blackColor].CGColor;
    _bottomNavigator.layer.shadowOpacity = 1;
    _bottomNavigator.layer.shadowOffset = CGSizeMake(0, 0);
}

@end
