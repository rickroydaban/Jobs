//
//  VelosiPickerRowSelectionDelegate.h
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/25/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VelosiPickerRowSelectionDelegate <NSObject>

-(void)pickerSelection:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;

@end
