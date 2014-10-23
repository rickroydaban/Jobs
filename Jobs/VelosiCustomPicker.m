//
//  CustomPicker.m
//  Salt
//
//  Created by Rick Royd Aban on 8/14/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VelosiCustomPicker.h"
#import "VelosiPickerRowSelectionDelegate.h"

@interface VelosiCustomPicker(){
    NSMutableArray *_elements;
    NSObject<VelosiPickerRowSelectionDelegate> *_selectionDelegate;
}
@end

@implementation VelosiCustomPicker

- (id)initWithElements :(NSArray *)elements andRowSelectionDelegate :(NSObject<VelosiPickerRowSelectionDelegate> *)delegate hasAll:(BOOL)hasAll{
    if([super init]){
        _elements = [NSMutableArray array];
        
        if(hasAll)
            [_elements addObject:@"All"];
        
        [_elements addObjectsFromArray:elements];
        _selectionDelegate = delegate;
        [self setDelegate:self];
        [self setDataSource:self];
        [self setShowsSelectionIndicator:YES];       
    }
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.layer.shadowOpacity = 1;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    return self;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_elements count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_elements objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [_selectionDelegate pickerSelection:pickerView didSelectRow:row inComponent:component];
}

- (NSArray *)elements{
    return _elements;
}

@end
