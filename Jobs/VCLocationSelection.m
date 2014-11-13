//
//  VCLocationSelection.m
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/24/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCLocationSelection.h"
#import "VelosiDesigner.h"
#import "MBProgressHUD.h"
#import "VCSearchJob.h"

@interface VCLocationSelection (){
    id _locations;
    UITableViewCell *_selectedCell;
}

@end

@implementation VCLocationSelection

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.propLv.delegate = self;
    self.propLv.dataSource = self;
    self.propLv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.propFieldSearch.delegate = self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [_locations objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ((NSMutableArray *)_locations).count;
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSString *searchString = [NSString stringWithFormat:@"%@%@",searchBar.text,text];
    if(searchString.length > 2){
        [MBProgressHUD showHUDAddedTo:self.propLv animated:YES];
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            _locations = [self.propAppDelegate.propGatewayOnline getLocationSuggestions:searchString];

            dispatch_async(dispatch_get_main_queue(), ^{
                if([_locations isKindOfClass:[NSString class]])
                    [[[UIAlertView alloc] initWithTitle:@"Error" message:_locations delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
                else
                    [self.propLv reloadData];
                [MBProgressHUD hideHUDForView:self.propLv animated:YES];
            });
        });
    }

    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedCell.detailTextLabel.text = [_locations objectAtIndex:indexPath.row];
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (void)cellSelectorSelectedCell:(UITableViewCell *)cell{
    _selectedCell = cell;
}



@end
