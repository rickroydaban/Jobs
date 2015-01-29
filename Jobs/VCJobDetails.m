//
//  VCJobDetails.m
//  Jobs
//
//  Created by Rick Royd Aban on 9/30/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCJobDetails.h"
#import "JobDetail.h"
#import "VelosiColors.h"
#import "CellDetail.h"

@interface VCJobDetails(){
    JobDetail *_jobDetail;
    CGFloat _cellDetailHeight;
    UIWebView *_detailWebView;
    UITextView *_coverLetter;
    IBOutlet UIBarButtonItem *propBarButtonApply;
    UIAlertView *alert;
}
@end

@implementation VCJobDetails

- (void)viewDidLoad{
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = (self.shouldShowApplyButton)?propBarButtonApply:nil;
    
    _coverLetter = [[UITextView alloc] init];
    _coverLetter.font = [UIFont systemFontOfSize:14];
    
    _detailWebView = 0;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        _jobDetail = [self.propAppDelegate.propGatewayOnline getJobDetailById:self.propJob.propJobID];
        dispatch_async(dispatch_get_main_queue(), ^{
            if([_jobDetail isKindOfClass:[NSString class]])
                [[[UIAlertView alloc] initWithTitle:@" " message:self.propAppDelegate.messageErrorGeneral delegate:nil cancelButtonTitle:self.propAppDelegate.cancelButton otherButtonTitles:nil, nil] show];
            else{
                self.propLv.delegate = self;
                self.propLv.dataSource = self;
                self.propLv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
            }
//            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            cell.textLabel.text = [[_jobDetail getJobDetailList] objectAtIndex:indexPath.row];
            
            switch (indexPath.row) {
                case 0:
                    cell.detailTextLabel.text = _jobDetail.propJobType; break;
                    
                case 1:
                    cell.detailTextLabel.text = _jobDetail.propDuration; break;
                    
                case 2:
                    cell.detailTextLabel.text = _jobDetail.propRotation; break;
                    
                case 3:
                    cell.detailTextLabel.text = _jobDetail.propLocation; break;
                    
                case 4:
                    cell.detailTextLabel.text = _jobDetail.propSalary; break;
                    
                case 5:
                    cell.detailTextLabel.text = _jobDetail.propContact; break;
                    
                    
                default:
                    cell.detailTextLabel.text = @"FIX ME";
            }
                    
            return cell;
        }
           
        default:{
            CellDetail *cellDetail = [tableView dequeueReusableCellWithIdentifier:@"cellDetail"];
            CGRect frame = cellDetail.webView.frame;
            [cellDetail.webView removeFromSuperview];
            
            UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, _cellDetailHeight)];
            webView.userInteractionEnabled = NO;
            [webView loadHTMLString:_jobDetail.propDetails baseURL:nil];
            [cellDetail.contentView addSubview:webView];
            return cellDetail;
        }
            
    }    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 49;

        default:;
            if(_cellDetailHeight < 1){
                _detailWebView = ((CellDetail *)[self.propLv dequeueReusableCellWithIdentifier:@"cellDetail"]).webView;
                _detailWebView.delegate = self;
                [_detailWebView loadHTMLString:_jobDetail.propDetails baseURL:nil];
            }
            return _cellDetailHeight;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [_jobDetail getJobDetailList].count;
            
        default:
            return 1;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [NSString stringWithFormat:@"Ref: %@",self.propJob.propReference];
            
        case 1:
            return @"Description";
            
        default:
            return nil;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    BOOL shouldReload = (_cellDetailHeight<1)?YES:NO;
    _cellDetailHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight;"] floatValue]+10;
    if(shouldReload)
        [self.propLv reloadData];
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
        
    }
//        [[[UIAlertView alloc] initWithTitle:@"" message:@"This module is still on development" delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
}

@end
