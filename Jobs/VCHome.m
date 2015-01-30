//
//  VCHome.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/27/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCHome.h"
#import "Job.h"
#import "CellLatestVacancy.h"
#import "VCJobDetails.h"

@implementation VCHome

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.propListVacancies = [NSMutableArray array];
    self.propLV.delegate = self;
    self.propLV.dataSource = self;
    self.propLV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self resetTableContents];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.propLV reloadData];
}

- (void)resetTableContents{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        id result = [self.propAppDelegate.propGatewayOnline getAdvanceSearchResults:@"" in:@"0" location:@"0" radius:@"100" jobType:@"0" country:@"0" postedWithin:@"0"];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_propListVacancies removeAllObjects];
            if([result isKindOfClass:[NSString class]])
                [[[UIAlertView alloc] initWithTitle:@"Error" message:result delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            else
                [_propListVacancies addObjectsFromArray:result];
            
            [self.propLV reloadData];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
    
}

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}

- (IBAction)refresh:(id)sender{
    [self resetTableContents];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellLatestVacancy *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    Job *job = (Job *)[_propListVacancies objectAtIndex:indexPath.row];
    
    cell.propLabelTitle.text = job.propTitle;
    cell.propLabelLocation.text = job.propCountry;
    cell.propLabelType.text = @"Permanent";
    cell.propLabelSalary.text = @"Negotiable";
    cell.tag = indexPath.row;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _propListVacancies.count;
}

- (void)onLanguageChanged{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    VCJobDetails *vcJobDetails = (VCJobDetails *)segue.destinationViewController;
    vcJobDetails.propJob = [_propListVacancies objectAtIndex:((UITableViewCell *)sender).tag];
    vcJobDetails.shouldShowApplyButton = YES;
}

@end
