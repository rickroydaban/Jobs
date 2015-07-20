//
//  VCJobDetails.m
//  Jobs
//
//  Created by Rick Royd Aban on 9/30/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCJobDetails.h"
#import "Job.h"
#import "VelosiColors.h"
#import "CellDetail.h"
#import "Application.h"
#import "User.h"

@interface VCJobDetails(){
    Job *_jobDetail;
    UITextView *_coverLetter;
    UIAlertView *alert;
    IBOutlet UIBarButtonItem *propBarButtonApply;
    IBOutlet UILabel *propLabelJobType;
    IBOutlet UILabel *propLabelDuration;
    IBOutlet UILabel *propLabelStartDate;
    IBOutlet UILabel *propLabelLocation;
    IBOutlet UILabel *propLabelSalary;
    IBOutlet UILabel *propLabelContact;
    IBOutlet UIWebView *propWebviewDesc;
    
    float descHeight;
}
@end

@implementation VCJobDetails

- (void)viewDidLoad{
    [super viewDidLoad];
    
    descHeight = 49.0;
    
    self.navigationItem.rightBarButtonItem = (self.shouldShowApplyButton)?propBarButtonApply:nil;
    
    _coverLetter = [[UITextView alloc] init];
    _coverLetter.font = [UIFont systemFontOfSize:14];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        _jobDetail = [self.propAppDelegate.propGatewayOnline getJobDetailById:[_propJob getJobID]];
        dispatch_async(dispatch_get_main_queue(), ^{
            if([_jobDetail isKindOfClass:[NSString class]]){
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[[UIAlertView alloc] initWithTitle:@" " message:self.propAppDelegate.messageErrorGeneral delegate:nil cancelButtonTitle:self.propAppDelegate.cancelButton otherButtonTitles:nil, nil] show];
            }else{
                self.navigationItem.title = [_jobDetail getTitle];
                propLabelJobType.text = [_jobDetail getTypeDescription];
                propLabelDuration.text = [_jobDetail getDuration];
                propLabelStartDate.text = [_jobDetail getStartDate];
                propLabelLocation.text = [_jobDetail getLocation];
                propLabelSalary.text = [_jobDetail getSalary];
                propLabelContact.text = [_jobDetail getContactName];
                propWebviewDesc.delegate = self;
                [propWebviewDesc loadHTMLString:[_jobDetail getDetails] baseURL:nil];
            }
        });
    });
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 1)
        return descHeight;
    
    return 49.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [NSString stringWithFormat:@"Ref: %@",[_propJob getReference]];
            
        case 1:
            return @"Description";
            
        default:
            return nil;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [propWebviewDesc sizeToFit];
    float webHeight = propWebviewDesc.frame.size.height;
    descHeight = webHeight;
    [self.tableView reloadData];
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [[[UIAlertView alloc] initWithTitle:@"" message:error.localizedFailureReason delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
}

- (IBAction)apply:(id)sender {
    if(!alert){
        alert = [[UIAlertView alloc] initWithTitle:@"Cover Letter" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Submit", nil];
        [alert setValue:_coverLetter forKey:@"accessoryView"];
    }
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            if(self.propAppDelegate.propUser == nil)
                self.propAppDelegate.propUser = [[User alloc] initWithDictionary:[self.propAppDelegate.propGatewayOnline getCandidateData]];
            NSString *result = [self.propAppDelegate.propGatewayOnline applyJobWithJSONContents:[Application jsonFromNewApplicationForJob:_jobDetail fromThisUser:self.propAppDelegate.propUser coverLetter:_coverLetter.text dateFormatter:self.propAppDelegate.propDateFormatVelosi]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [[[UIAlertView alloc] initWithTitle:@"" message:([result isEqualToString:@"OK"])?@"Thank you for your application, it has been recieved and will be reviewed by one of our consultants":result delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
                [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            });
        
        });
    }
}

@end
