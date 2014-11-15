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

@interface VCDocumentDetails(){
    AppDelegate *_appDelegate;
    UIPickerView *_typesPicker;
    UIDatePicker *_dateExpiryPicker;
}
@end

@implementation VCDocumentDetails

- (void)viewDidLoad{
    self.navigationItem.title = self.propDocument.propName;
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.propName.text = self.propDocument.propName;
    self.propType.text = [_appDelegate.propUserDetails.propDictDocumentTypes objectForKey:[NSString stringWithFormat:@"%d",self.propDocument.propType]];
    self.propDateExpiry.text = self.propDocument.propDateExpire;
    
    self.propName.delegate = self;
    self.propType.delegate = self;
    self.propDateExpiry.delegate = self;
    
    _typesPicker = [[VelosiCustomPicker alloc] initWithArray:_appDelegate.propUserDetails.propListDocumentTypes rowSelectionDelegate:self selectedItem:[_appDelegate.propUserDetails.propDictDocumentTypes objectForKey:[NSString stringWithFormat:@"%d",self.propDocument.propType]]];
    _dateExpiryPicker = [[UIDatePicker alloc] init];
    _dateExpiryPicker.datePickerMode = UIDatePickerModeDate;
    _dateExpiryPicker.date = [_appDelegate.propDateFormatVelosi dateFromString:self.propDocument.propDateExpire];
    _dateExpiryPicker.minimumDate = [NSDate date];
    _dateExpiryPicker.backgroundColor = [UIColor whiteColor];
    _dateExpiryPicker.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    _dateExpiryPicker.layer.shadowOpacity = 1;
    _dateExpiryPicker.layer.shadowOffset = CGSizeMake(0, 0);
    [_dateExpiryPicker addTarget:self action:@selector(updateDateExpiryField) forControlEvents:UIControlEventValueChanged];

}

- (void)updateDateExpiryField{
    self.propDateExpiry.text = [_appDelegate.propDateFormatVelosi stringFromDate:_dateExpiryPicker.date];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if(textField == self.propType)
        textField.inputView = _typesPicker;
    else if(textField == self.propDateExpiry)
        textField.inputView = _dateExpiryPicker;
}

- (void)pickerSelection:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(pickerView == _typesPicker)
        self.propType.text = [_appDelegate.propUserDetails.propListDocumentTypes objectAtIndex:row];
}

@end
