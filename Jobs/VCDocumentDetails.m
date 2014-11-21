//
//  VCDocumentDetails.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/30/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCDocumentDetails.h"
#import "AppDelegate.h"
#import "VelosiCustomPicker.h"
#import "VelosDatePicker.h"

@interface VCDocumentDetails(){
    UIPickerView *_typesPicker;
    UIDatePicker *_dateExpiryPicker;
}
@end

@implementation VCDocumentDetails

- (void)viewDidLoad{
    [super viewDidLoad];
    
    if(_propDocument!=nil){
        self.navigationItem.title = self.propDocument.propName;
        self.propName.text = self.propDocument.propName;
        self.propType.text = [self.propAppDelegate.propUserDetails.propDictDocumentTypes objectForKey:[NSString stringWithFormat:@"%d",self.propDocument.propType]];
        self.propDateExpiry.text = self.propDocument.propDateExpire;
    }else
        self.navigationItem.title = @"New Document";
    
    _typesPicker = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propUserDetails.propListDocumentTypes rowSelectionDelegate:self selectedItem:(_propDocument!=nil)?[self.propAppDelegate.propUserDetails.propDictDocumentTypes objectForKey:[NSString stringWithFormat:@"%d",self.propDocument.propType]]:nil];
    _dateExpiryPicker = [[VelosDatePicker alloc] initWithDate:(_propDocument!=nil)?[self.propAppDelegate.propDateFormatVelosi dateFromString:self.propDocument.propDateExpire]:nil minimumDate:nil viewController:self action:@selector(updateDateExpiryField)];

    self.propName.delegate = self;
    self.propType.delegate = self;
    self.propDateExpiry.delegate = self;
}

- (void)updateDateExpiryField{
    self.propDateExpiry.text = [self.propAppDelegate.propDateFormatVelosi stringFromDate:_dateExpiryPicker.date];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [super textFieldDidBeginEditing:textField];
    
    if(textField == self.propType)
        textField.inputView = _typesPicker;
    else if(textField == self.propDateExpiry)
        textField.inputView = _dateExpiryPicker;
}

- (void)pickerSelection:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(pickerView == _typesPicker)
        self.propType.text = [self.propAppDelegate.propUserDetails.propListDocumentTypes objectAtIndex:row];
}

@end
