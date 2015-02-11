//
//  VCUserEmployments.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserEmployments.h"
#import "CellEmployment.h"
#import "Employment.h"
#import "VCEmploymentDetail.h"
#import "MBProgressHUD.h"

@interface VCUserEmployments(){
    UIAlertView *_deleteConfirmationAlert;
    UITableViewCell *_cellDeleteTarget;
}
@end

@implementation VCUserEmployments

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _deleteConfirmationAlert = [[UIAlertView alloc] initWithTitle:@"Confirm" message:nil delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];

    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)],[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem)]];
    _propLV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _propListEmployments = [NSMutableArray array];
    _propLV.delegate = self;
    _propLV.dataSource = self;
}

- (void)addItem{
    [self performSegueWithIdentifier:@"segueEmploymentsToDetails" sender:nil];
}

- (void)refresh{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        id employmentList = [self.propAppDelegate.propGatewayOnline getEmployments];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if([employmentList isKindOfClass:[NSString class]])
                [[[UIAlertView alloc] initWithTitle:@"Error" message:employmentList delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            else{
                [_propListEmployments removeAllObjects];
                [_propListEmployments addObjectsFromArray:employmentList];
                [self.propLV reloadData];
            }
            
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            
        });
    });
}


- (void)viewWillAppear:(BOOL)animated{
    [self refresh];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        _cellDeleteTarget = [tableView cellForRowAtIndexPath:indexPath];
        _deleteConfirmationAlert.message = [NSString stringWithFormat:@"Are you sure you want to delete %@?",[((Employment *)[_propListEmployments objectAtIndex:indexPath.row]) getJobTitle]];
        [_deleteConfirmationAlert show];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellEmployment *cell = [_propLV dequeueReusableCellWithIdentifier:@"cell"];
    Employment *employment = [_propListEmployments objectAtIndex:indexPath.row];
    
    cell.propLabelTitle.text = [employment getJobTitle];
    cell.propLabelDate.text = [NSString stringWithFormat:@"%@ - %@",[employment getDateStart],[employment getDateEnd]];
    cell.propLabelEmployer.text = [employment getEmployer];
    cell.tag = indexPath.row;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Please enter / update details of your last 5 jobs.";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"segueEmploymentsToDetails" sender:[tableView.dataSource tableView:tableView cellForRowAtIndexPath:indexPath]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _propListEmployments.count;
}

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([sender isKindOfClass:[UITableViewCell class]])
        ((VCEmploymentDetail *)segue.destinationViewController).propEmployment = [_propListEmployments objectAtIndex:((CellEmployment *)sender).tag];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            break;
            
        case 1:{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                NSString *result = [self.propAppDelegate.propGatewayOnline deleteEmploymentWithID:[(Employment *)[self.propListEmployments objectAtIndex:_cellDeleteTarget.tag] getJobID]];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    if(![result isEqualToString:@"OK"])
                        [[[UIAlertView alloc] initWithTitle:@" " message:result delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
                    else{
                        [self.propListEmployments removeObjectAtIndex:_cellDeleteTarget.tag];
                        [self.propLV deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_cellDeleteTarget.tag inSection:0]] withRowAnimation:YES];
                    }
                    
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [self.propLV reloadData];
                });
            });
        }
            break;
            
        default:
            break;
    }
}
@end
