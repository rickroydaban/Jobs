//
//  VCUserApplications.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/15/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserApplications.h"
#import "MBProgressHUD.h"
#import "CellApplication.h"
#import "Application.h"
#import "VCJobDetails.h"
#import "JobDetail.h"

@implementation VCUserApplications

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _propLv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _propListApplications = [NSMutableArray array];
    _propLv.delegate = self;
    _propLv.dataSource = self;
    [self refresh];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.propLv reloadData];
}

- (void)refresh{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        id applicationList = [self.propAppDelegate.propGatewayOnline getApplications];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_propListApplications removeAllObjects];
            if([applicationList isKindOfClass:[NSString class]])
                [[[UIAlertView alloc] initWithTitle:@"Error" message:applicationList delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            else
                [_propListApplications addObjectsFromArray:applicationList];
            
            [self.propLv reloadData];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellApplication *cell = [self.propLv dequeueReusableCellWithIdentifier:@"cell"];
    Application *application = [_propListApplications objectAtIndex:indexPath.row];
    
    cell.propLabelTitle.text = [application getVacancyTitle];
    cell.propLabelStatus.text = [application getStatusName];
    cell.propLabelReference.text = [NSString stringWithFormat:@"Reference: /VAC/%@", [application getVacancyRef]];
    cell.propLabelDateAdded.text = [NSString stringWithFormat:@"Added on %@",[application getDateCreated]];
    cell.tag = indexPath.row;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSMutableString *str = [NSMutableString string];
    [str appendString:@"\n\nApplied Online\n"];
    [str appendString:@"You applied for the vacancy via our website or job boards/social media platforms we subscribe to\n\n"];
    [str appendString:@"Unsuitable\n"];
    [str appendString:@"Your qualifications, skills and experience aren't aligned with the job description\n\n"];
    [str appendString:@"Resourced\n"];
    [str appendString:@"Our 150+ recuitment consultants worldwide found your CV on our database and feel you are a strong match for the vacancy\n\n"];
    [str appendString:@"Shortlisted\n"];
    [str appendString:@"You have progressed tot he shortlist stage and a recruitment consultant will contact you to (a)gather your appetite in the role (b)obtain your permission for your CV to  be sent to our client\n\n"];
    [str appendString:@"Interested\n"];
    [str appendString:@"Post contact you have expressed that you are interested in the role\n\n"];
    [str appendString:@"CV Submitted\n"];
    [str appendString:@"We have contacted you and ascertained your interest in the vacancy and obtained permission to send your CV to our client. This will be the date one of our 150+ recruitment consultants worldwide will have send your CV onto our client for consideration\n\n"];
    [str appendString:@"Interview Date\n"];
    [str appendString:@"If we obtained positive feedback from our client and have been or are awaiting daes for an interview\n\n"];
    [str appendString:@"Client Accepted\n"];
    [str appendString:@"Post interview our client has expressed an interview in you and has or inteds to make an offer of employment\n\n"];
    [str appendString:@"Client Rejected\n"];
    [str appendString:@"Post interview our client found there were stronger candidates available\n\n"];
    [str appendString:@"Not Interested\n"];
    [str appendString:@"Either we have been in contact and you have stated the position is not for you or post interview our client intends to make an offer of employment but you are no longer interested"];
    
    return str;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _propListApplications.count;
}

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}

- (IBAction)refresh:(id)sender {
    [self refresh];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    Application *application = [_propListApplications objectAtIndex:((CellApplication *)sender).tag];
    VCJobDetails *jobdetails = (VCJobDetails *)segue.destinationViewController;
    jobdetails.propJob = [[Job alloc] initWithId:[[application getVacancyID] intValue] title:nil reference:[application getVacancyRef] country:nil dateAdded:nil details:nil];
    jobdetails.shouldShowApplyButton = false;
}

@end
