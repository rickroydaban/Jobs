//
//  VCUserSearches.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserSearches.h"
#import "CellSavedSearches.h"
#import "SavedSearch.h"
#import "VCSavedSearchDetail.h"
#import "MBProgressHUD.h"

@implementation VCUserSearches

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _propLv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _propLv.delegate = self;
    _propLv.dataSource = self;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        id savedSearchesList = [self.propAppDelegate.propGatewayOnline getSavedSearches];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if([savedSearchesList isKindOfClass:[NSString class]])
                [[[UIAlertView alloc] initWithTitle:@"Error" message:savedSearchesList delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            else
                _propListSavedSearches = savedSearchesList;
            
            [self.propLv reloadData];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        });
    });
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellSavedSearches *cell = [_propLv dequeueReusableCellWithIdentifier:@"cell"];
    SavedSearch *savedSearch = [_propListSavedSearches objectAtIndex:indexPath.row];
    
    cell.propLabelTitle.text = savedSearch.propTitle;
    cell.propLabelDateAdded.text = savedSearch.propDateAdded;
    cell.propLabelStatus.text = (savedSearch.propEmailAlert)?@"Sending":@"Not Sending";
    cell.tag = indexPath.row;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _propListSavedSearches.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"The jobs-by-email facility enables you to set up a criteria, i..e, job title/skill, country and location + acceptable radius, job type (permanent, temporary).  When a vacancy is posted onto the website that matches your criteria you will be sent a link via email.";
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Below are job searches that you have saved. You can re-run the job search by clicking on the envelope icon in the navigation bar.";
}

- (void)viewWillAppear:(BOOL)animated{
    [self.propLv reloadData];
}

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}

- (IBAction)refresh:(id)sender {
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ((VCSavedSearchDetail *)segue.destinationViewController).propSavedSearch = [_propListSavedSearches objectAtIndex:((CellSavedSearches *)sender).tag];
}

@end
