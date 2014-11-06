//
//  VCLanguages.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/20/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCLanguages.h"

@interface VCLanguages(){
    UITableViewCell *_selectedCell;
}
@end

@implementation VCLanguages

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.propLv.delegate = self;
    self.propLv.dataSource = self;
    self.propLv.separatorInset = UIEdgeInsetsZero;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [self.propAppDelegate.propUserDetails.propListLanguages objectAtIndex:indexPath.row];
    cell.accessoryType = (self.propListLanguages!=nil &&  [self.propListLanguages containsObject:cell.textLabel.text])?UITableViewCellAccessoryCheckmark:UITableViewCellAccessoryNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self.propListLanguages containsObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text])
        [self.propListLanguages removeObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    else
        [self.propListLanguages addObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    
    [tableView reloadData];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.propAppDelegate.propUserDetails.propListLanguages.count;
}

- (IBAction)done:(id)sender {
    _selectedCell.detailTextLabel.text = [NSString stringWithFormat:@"%d",(int)self.propListLanguages.count];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)cellSelectorSelectedCell:(UITableViewCell *)cell{
    _selectedCell = cell;
}

@end
