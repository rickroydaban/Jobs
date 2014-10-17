//
//  VCJobDetails.m
//  Jobs
//
//  Created by Rick Royd Aban on 9/30/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCJobDetails.h"
#import "JobDetail.h"
#import "MBProgressHUD.h"
#import "VelosiColors.h"
#import "CellDetail.h"

@interface VCJobDetails(){
    JobDetail *_jobDetail;
    CGFloat _cellDetailHeight;
    UIWebView *_detailWebView;
    UITextView *_coverLetter;
}
@end

@implementation VCJobDetails

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _coverLetter = [[UITextView alloc] init];
    _coverLetter.font = [UIFont systemFontOfSize:14];
    
    _detailWebView = 0;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        _jobDetail = [self.appDelegate.onlineGateway getJobDetailById:self.job.jobId];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.lv.delegate = self;
            self.lv.dataSource = self;
            self.lv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
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
                    cell.detailTextLabel.text = _jobDetail.jobType; break;
                    
                case 1:
                    cell.detailTextLabel.text = _jobDetail.duration; break;
                    
                case 2:
                    cell.detailTextLabel.text = _jobDetail.rotation; break;
                    
                case 3:
                    cell.detailTextLabel.text = _jobDetail.location; break;
                    
                case 4:
                    cell.detailTextLabel.text = _jobDetail.salary; break;
                    
                case 5:
                    cell.detailTextLabel.text = _jobDetail.contact; break;
                    
                    
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
            [webView loadHTMLString:_jobDetail.details baseURL:nil];
            [cellDetail.contentView addSubview:webView];
            return cellDetail;
        }
            
    }    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 43;

        default:;
            if(_cellDetailHeight < 1){
                _detailWebView = ((CellDetail *)[self.lv dequeueReusableCellWithIdentifier:@"cellDetail"]).webView;
                _detailWebView.delegate = self;
                [_detailWebView loadHTMLString:_jobDetail.details baseURL:nil];
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
            return [NSString stringWithFormat:@"Ref: %@",self.job.reference];
            
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
        [self.lv reloadData];
}

- (IBAction)apply:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cover Letter" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Submit", nil];
    [alert setValue:_coverLetter forKey:@"accessoryView"];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 1:
            NSLog(@"Submitting %@",_coverLetter.text);
            break;
            
        default:
            break;
    }
}

@end