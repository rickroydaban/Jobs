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
    self.navigationItem.title = self.document.propName;
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.propName.text = self.document.propName;
    self.propType.text = [_appDelegate.userDetails.propDictDocumentTypes objectForKey:[NSString stringWithFormat:@"%d",self.document.propType]];
    self.propDateExpiry.text = self.document.propDateExpire;
    
    self.propName.delegate = self;
    self.propType.delegate = self;
    self.propDateExpiry.delegate = self;
    
    _typesPicker = [[VelosiCustomPicker alloc] initWithElements:_appDelegate.userDetails.propListDocumentTypes andRowSelectionDelegate:self hasAll:NO];
    [_typesPicker selectRow:[_appDelegate.userDetails.propListDocumentTypes indexOfObject:[_appDelegate.userDetails.propDictDocumentTypes objectForKey:[NSString stringWithFormat:@"%d",self.document.propType]]] inComponent:0 animated:NO];
    _dateExpiryPicker = [[UIDatePicker alloc] init];
    _dateExpiryPicker.datePickerMode = UIDatePickerModeDate;
    _dateExpiryPicker.date = [_appDelegate.velosiDateFormat dateFromString:self.document.propDateExpire];
    _dateExpiryPicker.minimumDate = [NSDate date];
    _dateExpiryPicker.backgroundColor = [UIColor whiteColor];
    _dateExpiryPicker.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    _dateExpiryPicker.layer.shadowOpacity = 1;
    _dateExpiryPicker.layer.shadowOffset = CGSizeMake(0, 0);
    [_dateExpiryPicker addTarget:self action:@selector(updateDateExpiryField) forControlEvents:UIControlEventValueChanged];

}

- (void)updateDateExpiryField{
    self.propDateExpiry.text = [_appDelegate.velosiDateFormat stringFromDate:_dateExpiryPicker.date];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if(textField == self.propType)
        textField.inputView = _typesPicker;
    else if(textField == self.propDateExpiry)
        textField.inputView = _dateExpiryPicker;
}

- (void)pickerSelection:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(pickerView == _typesPicker)
        self.propType.text = [_appDelegate.userDetails.propListDocumentTypes objectAtIndex:row];
}

@end
