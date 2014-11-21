//
//  VelosDatePicker.h
//  Jobs
//
//  Created by Rick Royd Aban on 11/21/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VelosDatePicker : UIDatePicker

- (instancetype)initWithDate:(NSDate *)defaultDate minimumDate:(NSDate *)minDate viewController:(UIViewController *)vc action:(SEL)selector;

@end
