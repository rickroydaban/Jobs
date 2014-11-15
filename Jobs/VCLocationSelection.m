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
    NSMutableDictionary *_dictionary;
}

@end

@implementation VCLocationSelection

- (void)viewDidLoad {
    [super viewDidLoad];
    _locations = [NSMutableArray arrayWithObject:@"Any"];
    
    self.propLv.delegate = self;
    self.propLv.dataSource = self;
    self.propLv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.propFieldSearch.delegate = self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    if(indexPath.row > 0)
        cell.textLabel.text = [[_locations objectAtIndex:indexPath.row] objectForKey:@"LocationFull"];
    else
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
            _locations = [NSMutableArray arrayWithObject:@"Any"];
            [_locations addObjectsFromArray:[self.propAppDelegate.propGatewayOnline getLocationSuggestions:searchString]];

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
    if(indexPath.row>0){
        [_dictionary setValuesForKeysWithDictionary:[_locations objectAtIndex:indexPath.row]];
        _selectedCell.detailTextLabel.text = [_dictionary objectForKey:@"LocationFull"];
    }
    else
        [_locations objectAtIndex:0];
    
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (void)cellSelectorSelectedCell:(UITableViewCell *)cell withObject:(id)data{
    _selectedCell = cell;
    _dictionary = data;
}



@end
