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

- (id)initWithArray :(NSArray *)elements rowSelectionDelegate :(NSObject<VelosiPickerRowSelectionDelegate> *)delegate selectedItem:(NSString *)selectedItem;
- (NSArray *)elements;
- (void)selectRowWithText:(NSString *)text;

@end
