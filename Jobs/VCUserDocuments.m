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

@implementation VCUserDocuments

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)],[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem)]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.propListDocuments = [NSMutableArray array];
    self.propLv.delegate = self;
    self.propLv.dataSource = self;
    self.propLv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self refresh];
}

- (void)addItem{
    [self performSegueWithIdentifier:@"segueDocumentsToDetails" sender:nil];
}

- (void)refresh{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        id result = [self.propAppDelegate.propGatewayOnline getDocuments];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_propListDocuments removeAllObjects];
            if([result isKindOfClass:[NSString class]])
                [[[UIAlertView alloc] initWithTitle:@"Error" message:result delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            else
                [_propListDocuments addObjectsFromArray:result];

            [self.propLv reloadData];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (void)viewWillAppear:(BOOL)animated{
    [self.propLv reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellDocument *cell = [self.propLv dequeueReusableCellWithIdentifier:@"cell"];
    Document *document = [self.propListDocuments objectAtIndex:indexPath.row];

    cell.propTitle.text = document.propName;
    cell.propDateExpire.text = [NSString stringWithFormat:@"Expire on %@",document.propDateExpire];
    cell.propExtAndType.text = [self.propAppDelegate.propUserDetails.propDictDocumentTypes objectForKey:[NSString stringWithFormat:@"%d",document.propType]];
    cell.propFileSize.text = [NSString stringWithFormat:@"%@ kb",document.propFileSize];
    cell.tag = indexPath.row;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"segueDocumentsToDetails" sender:[tableView.dataSource tableView:tableView cellForRowAtIndexPath:indexPath]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.propListDocuments.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([sender isKindOfClass:[UITableViewCell class]])
        ((VCDocumentDetails *)segue.destinationViewController).propDocument = [self.propListDocuments objectAtIndex:((CellDocument *)sender).tag];
}

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}

@end
