//
//  VCUserDocuments.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserDocuments.h"
#import "CellDocument.h"
#import "Document.h"
#import "VelosiColors.h"
#import "MBProgressHUD.h"
#import "VCDocumentDetails.h"

@interface VCUserDocuments(){
    UIAlertView *_deleteConfirmationAlert;
    UITableViewCell *_cellDeletetarget;
}
@end

@implementation VCUserDocuments

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.propListDocuments = [NSMutableArray array];
    self.propLv.delegate = self;
    self.propLv.dataSource = self;
    self.propLv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

//- (void)addItem{
//    [self performSegueWithIdentifier:@"segueDocumentsToDetails" sender:nil];
//}

- (IBAction)refresh:(id)sender {
    [self refresh];
}

- (void)refresh{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        id result = [self.propAppDelegate.propGatewayOnline getDocuments];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            if([result isKindOfClass:[NSString class]])
                [[[UIAlertView alloc] initWithTitle:@"Error" message:result delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            else{
                [_propListDocuments removeAllObjects];
                [_propListDocuments addObjectsFromArray:result];
                [self.propLv reloadData];
            }
        });
    });
}

- (void)viewWillAppear:(BOOL)animated{
    [self refresh];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellDocument *cell = [self.propLv dequeueReusableCellWithIdentifier:@"cell"];
    Document *document = [self.propListDocuments objectAtIndex:indexPath.row];

    cell.propTitle.text = [document getName];
    cell.propDateExpire.text = [NSString stringWithFormat:@"Expire on %@",[document getDateExpire]];
    cell.propExtAndType.text = [self.propAppDelegate.propUserDetails.propDictDocumentTypes allKeysForObject:@([document getType])][0];
    cell.propFileSize.text = [NSString stringWithFormat:@"%@ kb",[document getFileSize]];
    cell.tag = indexPath.row;

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Below are the documents currently held on your account. Log in online to add or update documents";
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self performSegueWithIdentifier:@"segueDocumentsToDetails" sender:[tableView.dataSource tableView:tableView cellForRowAtIndexPath:indexPath]];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.propListDocuments.count;
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if([sender isKindOfClass:[UITableViewCell class]])
//        ((VCDocumentDetails *)segue.destinationViewController).propDocument = [self.propListDocuments objectAtIndex:((CellDocument *)sender).tag];
//}

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        _cellDeletetarget = [tableView cellForRowAtIndexPath:indexPath];
        _deleteConfirmationAlert.message = [NSString stringWithFormat:@"Are you sure you want to delete %@?",[((Document *)[_propListDocuments objectAtIndex:indexPath.row]) getName]];
        [_deleteConfirmationAlert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0: break;
        case 1: {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                NSString *result = [self.propAppDelegate.propGatewayOnline deleteDocumentsWithID:[((Document *)[self.propListDocuments objectAtIndex:_cellDeletetarget.tag]) getDocumentID]];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                   if(![result isEqualToString:@"OK"])
                       [[[UIAlertView alloc] initWithTitle:@" " message:result delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
                   else{
                       [self.propListDocuments removeObjectAtIndex:_cellDeletetarget.tag];
                       [self.propLv deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_cellDeletetarget.tag inSection:0]] withRowAnimation:YES];
                   }
                    
                   [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                });
            });
        }
            break;
            
        default:
            break;
    }
}

@end
