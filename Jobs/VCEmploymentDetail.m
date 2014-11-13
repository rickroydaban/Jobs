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
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.propAppDelegate.propGatewayOnline saveEmployment:[[Employment alloc] initWithID:_propEmployment.propJobID jobTitle:_propFieldJobTitle.text startDate:_propFieldDateStart.text endDate:_propFieldDateEnd.text employer:_propFieldEmployer.text description:_propFieldDescription.text] connectionDelegate:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"failed %@",error);
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"response %@",response);
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
//    NSError *error;
//    
//    NSLog(@"data %@",data);
//    if(error)
//        NSLog(@"error");
//    
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"success!");
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
