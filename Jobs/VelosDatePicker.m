//
//  VelosDatePicker.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/21/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VelosDatePicker.h"

@implementation VelosDatePicker

- (instancetype)initWithDate:(NSDate *)defaultDate minimumDate:(NSDate *)minDate viewController:(UIViewController *)vc action:(SEL)selector{
    self = [super init];
    
    if(self) {
        self.datePickerMode = UIDatePickerModeDate;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        self.layer.shadowOpacity = 1;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        [self addTarget:vc action:selector forControlEvents:UIControlEventValueChanged];
        
        if(minDate != nil)
            self.minimumDate = minDate;
        
        if(defaultDate != nil)
            self.date = defaultDate;
    }
    
    return self;
}

@end
