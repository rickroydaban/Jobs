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
        self.navigationItem.title = [self.propDocument getName];
        self.propName.text = [self.propDocument getName];
        self.propType.text = [self.propAppDelegate.propUserDetails.propDictDocumentTypes allKeysForObject:@([self.propDocument getType])][0];
        self.propDateExpiry.text = [self.propDocument getDateExpire];
    }else
        self.navigationItem.title = @"New Document";
    
    _typesPicker = [[VelosiCustomPicker alloc] initWithArray:self.propAppDelegate.propUserDetails.propListDocumentTypes rowSelectionDelegate:self selectedItem:(_propDocument!=nil)?[self.propAppDelegate.propUserDetails.propDictDocumentTypes objectForKey:[NSString stringWithFormat:@"%d",[self.propDocument getType]]]:nil];
    _dateExpiryPicker = [[VelosDatePicker alloc] initWithDate:(_propDocument!=nil)?[self.propAppDelegate.propDateFormatVelosi dateFromString:[self.propDocument getDateExpire]]:nil minimumDate:nil viewController:self action:@selector(updateDateExpiryField)];

    self.propName.delegate = self;
    self.propType.delegate = self;
    self.propDateExpiry.delegate = self;
}

- (IBAction)done:(id)sender {
    [[[UIAlertView alloc] initWithTitle:@"" message:@"This module is still on development" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    NSString *name = self.propName.text;
//    int type = [[self.propAppDelegate.propUserDetails.propDictDocumentTypes objectForKey:self.propType.text] intValue];
//    NSString *expireDate = self.propDateExpiry.text;
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        NSString *result = [self.propAppDelegate.propGatewayOnline saveDocumentWithJSONContents:[_propDocument jsonFromName:name type:type dateExpiry:expireDate]];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [[[UIAlertView alloc] initWithTitle:@" " message:(result)?result:self.propAppDelegate.messageSaveSuccessful delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
//            [self.view endEditing:YES];
//            [MBProgressHUD hideHUDForView:self.view animated:YES];
//        });
//    });
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
