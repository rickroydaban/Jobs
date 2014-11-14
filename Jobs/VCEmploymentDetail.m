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

@interface VCEmploymentDetail(){
    AppDelegate *_appDelegate;
    UIDatePicker *_datePicekrStart, *_datePickerEnd;
}
@end

@implementation VCEmploymentDetail

- (void)viewDidLoad{
    [super viewDidLoad];
    self.propFieldJobTitle.text = [_propEmployment getJobTitle];
    self.propFieldDateStart.text = [_propEmployment getDateStart];
    self.propFieldDateEnd.text = [_propEmployment getDateEnd];
    self.propFieldEmployer.text = [_propEmployment getEmployer];
    self.propFieldDescription.text = [_propEmployment getDescription];
    self.propFieldDescription.textContainerInset = UIEdgeInsetsMake(5, 15, 5, 15);
    self.propFieldJobTitle.delegate = self;
    self.propFieldDateStart.delegate = self;
    self.propFieldDateEnd.delegate = self;
    self.propFieldEmployer.delegate = self;
    self.propFieldDescription.delegate = self;
}


- (IBAction)done:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *result = [self.propAppDelegate.propGatewayOnline saveEmploymentWithJSONContents:[_propEmployment jsonFromEmployer:_propFieldEmployer.text jobTitle:_propFieldJobTitle.text startDate:_propFieldDateStart.text endDate:_propFieldDateEnd.text description:_propFieldDescription.text]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[[UIAlertView alloc] initWithTitle:@" " message:result delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            [self.view endEditing:YES];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

@end
