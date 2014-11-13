//
//  CustomPicker.h
//  Salt
//
//  Created by Rick Royd Aban on 8/14/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol VelosiPickerRowSelectionDelegate;

@interface VelosiCustomPicker :UIPickerView<UIPickerViewDelegate, UIPickerViewDataSource>

- (id)initWithElements :(NSArray *)elements andRowSelectionDelegate :(NSObject<VelosiPickerRowSelectionDelegate> *)delegate hasAll:(BOOL)hasAll;
- (NSArray *)elements;
- (void)selectRowWithText:(NSString *)text;

@end
