//
//  VCEmploymentDetail.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCEmploymentDetail.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import "VelosDatePicker.h"

@interface VCEmploymentDetail(){
    UIDatePicker *_datePicekrStart, *_datePickerEnd;
    UIAlertView *_requestDoneAlert;
}
@end

@implementation VCEmploymentDetail

- (void)viewDidLoad{
    [super viewDidLoad];
    
    if(_propEmployment != nil){
        self.navigationItem.title = [_propEmployment getJobTitle];
        self.propFieldJobTitle.text = [_propEmployment getJobTitle];
        self.propFieldDateStart.text = [_propEmployment getDateStart];
        self.propFieldDateEnd.text = [_propEmployment getDateEnd];
        self.propFieldEmployer.text = [_propEmployment getEmployer];
        self.propFieldDescription.text = [_propEmployment getDescription];
    }else
        self.navigationItem.title = @"New Employment";

    
    _datePicekrStart = [[VelosDatePicker alloc] initWithDate:(_propEmployment!=nil)?[self.propAppDelegate.propDateFormatVelosi dateFromString:[_propEmployment getDateStart]]:nil minimumDate:nil viewController:self action:@selector(updateStartDate)];
    _datePickerEnd = [[VelosDatePicker alloc] initWithDate:(_propEmployment!=nil)?[self.propAppDelegate.propDateFormatVelosi dateFromString:[_propEmployment getDateEnd]]:nil minimumDate:nil viewController:self action:@selector(updateEndDate)];
    
    self.propFieldDescription.textContainerInset = UIEdgeInsetsMake(5, 15, 5, 15);
    self.propFieldJobTitle.delegate = self;
    self.propFieldDateStart.delegate = self;
    self.propFieldDateEnd.delegate = self;
    self.propFieldEmployer.delegate = self;
    self.propFieldDescription.delegate = self;
}

- (void)updateStartDate{
    self.propFieldDateStart.text = [self.propAppDelegate.propDateFormatVelosi stringFromDate:_datePicekrStart.date];
}

- (void)updateEndDate{
    self.propFieldDateEnd.text = [self.propAppDelegate.propDateFormatVelosi stringFromDate:_datePickerEnd.date];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [super textFieldDidBeginEditing:textField];
    
    if(textField == self.propFieldDateStart)
        textField.inputView = _datePicekrStart;
    else if(textField == self.propFieldDateEnd)
        textField.inputView = _datePickerEnd;
}

- (IBAction)done:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *json;
        if(_propEmployment)
            json = [_propEmployment jsonFromEmployer:_propFieldEmployer.text jobTitle:_propFieldJobTitle.text startDate:_propFieldDateStart.text endDate:_propFieldDateEnd.text description:_propFieldDescription.text];
        else
            json = [Employment jsonFromNewEmployerName:_propFieldEmployer.text jobTitle:_propFieldJobTitle.text startDate:_propFieldDateStart.text endDate:_propFieldDateEnd.text description:_propFieldDescription.text dateToday:[self.propAppDelegate.propDateFormatVelosi stringFromDate:[NSDate date]] userID:[[self.propAppDelegate.propGatewayOffline getUserID]intValue]];
        
        NSString *result = [self.propAppDelegate.propGatewayOnline saveEmploymentWithJSONContents:json];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(!_requestDoneAlert)
             _requestDoneAlert = [[UIAlertView alloc] initWithTitle:@" " message:(result)?result:self.propAppDelegate.messageSaveSuccessful delegate:self cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil];
            
            [_requestDoneAlert show];
            [self.view endEditing:YES];
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        });
    });
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
