//
//  VCHome.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/27/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCHome.h"
#import "JobSummary.h"
#import "CellLatestVacancy.h"
#import "VCJobDetails.h"


@implementation VCHome

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.propListVacancies = [NSMutableArray array];
    self.propLV.delegate = self;
    self.propLV.dataSource = self;
    self.propLV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.propLV.rowHeight = UITableViewAutomaticDimension;
    self.propLV.estimatedRowHeight = 999.0; // set to whatever your "average" cell height is
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
    JobSummary *job = (JobSummary *)[_propListVacancies objectAtIndex:indexPath.row];
    
    cell.propLabelTitle.text = [job getTitle];
    cell.propLabelLocation.text = [job getCountry];
    cell.propLabelType.text = @"Permanent";
    cell.propLabelSalary.text = @"Negotiable";
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _propListVacancies.count;
}

- (void)onLanguageChanged{
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VCJobDetails *vcJobDetails = [[self.propAppDelegate.propPageNavigator getSearchDetailPage].viewControllers objectAtIndex:0];
    vcJobDetails.propJob = [_propListVacancies objectAtIndex:indexPath.row];
    vcJobDetails.shouldShowApplyButton = YES;
    
    [self.navigationController pushViewController:vcJobDetails animated:YES];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    NSLog(@"prepare to segue at %d",_selIndex);
//    VCJobDetails *vcJobDetails = (VCJobDetails *)segue.destinationViewController;
//    vcJobDetails.propJob = [_propListVacancies objectAtIndex:_selIndex];
//    vcJobDetails.shouldShowApplyButton = YES;
//}

@end
