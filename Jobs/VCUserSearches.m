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

@interface VCUserSearches(){
    UIAlertView *_deleteConfirmationAlert;
    UITableViewCell *_cellDeletetarget;
}
@end

@implementation VCUserSearches

- (void)viewDidLoad{
    [super viewDidLoad];

    _deleteConfirmationAlert = [[UIAlertView alloc] initWithTitle:@"Confirm" message:nil delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    
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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        _cellDeletetarget = [tableView cellForRowAtIndexPath:indexPath];
        _deleteConfirmationAlert.message = [NSString stringWithFormat:@"Are you sure you want to delete %@?",[((SavedSearch *)[_propListSavedSearches objectAtIndex:indexPath.row]) getName]];
        [_deleteConfirmationAlert show];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellSavedSearches *cell = [_propLv dequeueReusableCellWithIdentifier:@"cell"];
    SavedSearch *savedSearch = [_propListSavedSearches objectAtIndex:indexPath.row];
    
    cell.delegate = self;
    cell.propLabelTitle.text = [savedSearch getName];
//    cell.propLabelDateAdded.text = [NSString stringWithFormat:@"Added on %@",savedSearch get];
    cell.propLabelDateAdded.text = @"Date added here";
    cell.propSwitchStatus.on = [savedSearch willAlert];
    cell.tag = indexPath.row;
    
    return cell;
}

- (void)cellSavedSearchChangeStatus:(id)sender{
    CellSavedSearches *cell = (CellSavedSearches *)sender;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *result = [self.propAppDelegate.propGatewayOnline saveSavedSearchesWithJSONContents:[[_propListSavedSearches objectAtIndex:cell.tag] jsonFromChangingStatus:cell.propSwitchStatus.isOn]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(result!=nil)
                [[[UIAlertView alloc] initWithTitle:@" " message:result delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            break;
            
        case 1:
            [self.propListSavedSearches removeObjectAtIndex:_cellDeletetarget.tag];
            [self.propLv deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_cellDeletetarget.tag inSection:0]] withRowAnimation:YES];
            break;
            
        default:
            break;
    }
}

@end
