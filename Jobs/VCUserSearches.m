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
    UIBarButtonItem *_buttonSubscribe, *_buttonUnsubscribe, *_buttonRefresh;
    UITableViewCell *_cellDeletetarget;
    int _countSubscribedItems;
}
@end

@implementation VCUserSearches

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _buttonRefresh = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
    _buttonUnsubscribe = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_unsubscribe"] style:UIBarButtonItemStylePlain target:self action:@selector(unsubscribeAll)];
    _buttonSubscribe = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_subscribe"] style:UIBarButtonItemStylePlain target:self action:@selector(subscribeAll)];
    
    _deleteConfirmationAlert = [[UIAlertView alloc] initWithTitle:@"Confirm" message:nil delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    
    _propLv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _propListSavedSearches = [NSMutableArray array];
    _propLv.delegate = self;
    _propLv.dataSource = self;
    [self refresh];
}

- (void)subscribeAll{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *result = [self.propAppDelegate.propGatewayOnline changeAllSavedSearchSubscriptionForCandidateID:[self.propAppDelegate.propGatewayOffline getUserID] status:YES];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(![result isEqualToString:@"OK"])
                [[[UIAlertView alloc] initWithTitle:@" " message:result delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            else{
                _countSubscribedItems = (int)_propListSavedSearches.count;
                [self updateRightNavigationButtons];
                
                for(SavedSearch *ss in _propListSavedSearches)
                    [ss changeSubscriptionWillAlert:YES];
                
                _countSubscribedItems = (int)_propListSavedSearches.count;
                [self updateRightNavigationButtons];
                [self.propLv reloadData];
            }
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (void)unsubscribeAll{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *result = [self.propAppDelegate.propGatewayOnline changeAllSavedSearchSubscriptionForCandidateID:[self.propAppDelegate.propGatewayOffline getUserID] status:NO];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(![result isEqualToString:@"OK"])
                [[[UIAlertView alloc] initWithTitle:@" " message:result delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            else{
                _countSubscribedItems = (int)_propListSavedSearches.count;
                [self updateRightNavigationButtons];
                
                for(SavedSearch *ss in _propListSavedSearches)
                    [ss changeSubscriptionWillAlert:NO];
                
                _countSubscribedItems = 0;
                [self updateRightNavigationButtons];
                [self.propLv reloadData];
            }
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (void)refresh{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        id savedSearchesList = [self.propAppDelegate.propGatewayOnline getSavedSearches];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if([savedSearchesList isKindOfClass:[NSString class]])
                [[[UIAlertView alloc] initWithTitle:@"Error" message:savedSearchesList delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            else{
                [_propListSavedSearches removeAllObjects];
                [_propListSavedSearches addObjectsFromArray:savedSearchesList];
                _countSubscribedItems = 0;
                
                for(SavedSearch *ss in _propListSavedSearches){
                    if([ss willAlert])
                        _countSubscribedItems++;
                }
                [self updateRightNavigationButtons];
                [self.propLv reloadData];
            }
            
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            
        });
    });
}

- (void)updateRightNavigationButtons{
    if(_countSubscribedItems == _propListSavedSearches.count)
        self.navigationItem.rightBarButtonItems = @[_buttonRefresh, _buttonUnsubscribe];
    else if(_countSubscribedItems == 0)
        self.navigationItem.rightBarButtonItems = @[_buttonRefresh, _buttonSubscribe];
    else
        self.navigationItem.rightBarButtonItems = @[_buttonRefresh, _buttonUnsubscribe, _buttonSubscribe];
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
    cell.propLabelDateAdded.text = [NSString stringWithFormat:@"Added on %@",[self.propAppDelegate.propGatewayOnline deserializeJsonDateString:[savedSearch getDateAdded]]];
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
            else{
                if(cell.propSwitchStatus.isOn)
                    _countSubscribedItems++;
                else
                    _countSubscribedItems--;
                
                [self updateRightNavigationButtons];
            }
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _propListSavedSearches.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Below are your saves job searches, you can enable them individually, or in bulk using the envelope above.";
}

- (void)viewWillAppear:(BOOL)animated{
    [self refresh];
}

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ((VCSavedSearchDetail *)segue.destinationViewController).propSavedSearch = [_propListSavedSearches objectAtIndex:((CellSavedSearches *)sender).tag];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            break;
            
        case 1:{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                NSString *result = [self.propAppDelegate.propGatewayOnline deleteSavedSearchesWithJBEID:[(SavedSearch *)[self.propListSavedSearches objectAtIndex:_cellDeletetarget.tag] getJBEID]];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    if(![result isEqualToString:@"OK"])
                        [[[UIAlertView alloc] initWithTitle:@" " message:result delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
                    else{
                        [self.propListSavedSearches removeObjectAtIndex:_cellDeletetarget.tag];
                        _countSubscribedItems = 0;
                        for(SavedSearch *ss in _propListSavedSearches){
                            if([ss willAlert])
                                _countSubscribedItems++;
                        }
                        [self updateRightNavigationButtons];
                        [self.propLv deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_cellDeletetarget.tag inSection:0]] withRowAnimation:YES];
                    }
                    
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                });
            });
        }
            break;
            
        default:
            break;
    }
}

@end
