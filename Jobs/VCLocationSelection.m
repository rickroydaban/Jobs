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
    NSMutableArray *_locations;
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
    NSString *searchString = (range.length>0)?[searchBar.text substringWithRange:NSMakeRange(0, searchBar.text.length-range.length)]:[NSString stringWithFormat:@"%@%@",searchBar.text, text];
    
    if(searchString.length > 2){
        [MBProgressHUD showHUDAddedTo:self.propLv animated:YES];
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            
            id result = [self.propAppDelegate.propGatewayOnline getLocationSuggestions:searchString];
            if(![result isKindOfClass:[NSString class]]){
                [_locations removeAllObjects];
                [_locations addObject:@"Any"];
                [_locations addObjectsFromArray:result];
            }
                
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideAllHUDsForView:self.propLv animated:YES];
                if([_locations isKindOfClass:[NSString class]])
                    [[[UIAlertView alloc] initWithTitle:@"Error" message:result delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
                else
                    [self.propLv reloadData];
            });
        });
    }else{
        [_locations removeAllObjects];
        [_locations addObject:@"Any"];
        [self.propLv reloadData];
    }

    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row>0){
        if(_dictionary != nil)
            [_dictionary setValuesForKeysWithDictionary:[_locations objectAtIndex:indexPath.row]];

        _selectedCell.detailTextLabel.text = [[_locations objectAtIndex:indexPath.row] objectForKey:@"LocationFull"];
    }
    else
        _selectedCell.detailTextLabel.text = [_locations objectAtIndex:0];
    
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (void)cellSelectorSelectedCell:(UITableViewCell *)cell withObject:(id)data{
    _selectedCell = cell;
    _dictionary = data;
}



@end
