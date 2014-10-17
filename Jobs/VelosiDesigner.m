//
//  VelosiDesigner.m
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VelosiDesigner.h"
#import "VelosiColors.h"

@implementation VelosiDesigner

+ (void)makeVelosiTextField: (UITextField *)textField{
    textField.layer.borderWidth = 0;
    textField.font = [UIFont systemFontOfSize:14];
    textField.textColor = [UIColor lightGrayColor];
}

+ (void)makeVelosiFocusedTextField: (UITextField *)textField{
    textField.layer.borderWidth = 0;
    textField.textColor = [VelosiColors blackFont];
    textField.font = [UIFont systemFontOfSize:14];
}


@end
