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
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        _documents = [self.appDelegate.onlineGateway getDocuments];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.lv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
            self.lv.separatorColor = [VelosiColors listSeparator];
            self.lv.delegate = self;
            self.lv.dataSource = self;
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (void)viewWillAppear:(BOOL)animated{
    [self.lv reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellDocument *cell = [self.lv dequeueReusableCellWithIdentifier:@"cell"];
    Document *document = [self.documents objectAtIndex:indexPath.row];

    cell.propTitle.text = document.propName;
    cell.propDateExpire.text = [NSString stringWithFormat:@"Expire on %@",document.propDateExpire];
    cell.propType.text = [self.appDelegate.userDetails.propDictDocumentTypes objectForKey:[NSString stringWithFormat:@"%d",document.propType]];
    cell.propExtension.text = document.propExtension;
    cell.propFileSize.text = [NSString stringWithFormat:@"%@ kb",document.propFileSize];
    cell.backgroundColor = [VelosiColors white];
    cell.tag = indexPath.row;

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.documents.count;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ((VCDocumentDetails *)segue.destinationViewController).document = [self.documents objectAtIndex:((CellDocument *)sender).tag];
}

- (IBAction)showList:(id)sender {
    [self.appDelegate.slider toggleSidebar];
}

@end
