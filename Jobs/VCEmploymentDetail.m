//
//  VCEmploymentDetail.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCEmploymentDetail.h"
#import "AppDelegate.h"

@interface VCEmploymentDetail(){
    AppDelegate *_appDelegate;
    UIDatePicker *_datePicekrStart, *_datePickerEnd;
}
@end

@implementation VCEmploymentDetail

- (void)viewDidLoad{    
    self.propFieldJobTitle.text = self.propEmployment.propJobTitle;
    self.propFieldDateStart.text = self.propEmployment.propDateStart;
    self.propFieldDateEnd.text = self.propEmployment.propDateEnd;
    self.propFieldEmployer.text = self.propEmployment.propEmployer;
    self.propFieldDescription.text = self.propEmployment.propDescription;
    
    self.propFieldJobTitle.delegate = self;
    self.propFieldDateStart.delegate = self;
    self.propFieldDateEnd.delegate = self;
    self.propFieldEmployer.delegate = self;
    self.propFieldDescription.delegate = self;
}


- (IBAction)done:(id)sender {
}

@end
