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
    
    self.lv.delegate = self;
    self.lv.dataSource = self;
    self.lv.separatorInset = UIEdgeInsetsZero;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [self.appDelegate.userDetails.propListLanguages objectAtIndex:indexPath.row];
    cell.accessoryType = (self.languages!=nil &&  [self.languages containsObject:cell.textLabel.text])?UITableViewCellAccessoryCheckmark:UITableViewCellAccessoryNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self.languages containsObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text])
        [self.languages removeObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    else
        [self.languages addObject:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    
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
    return self.appDelegate.userDetails.propListLanguages.count;
}

- (IBAction)done:(id)sender {
    _selectedCell.detailTextLabel.text = [NSString stringWithFormat:@"%d",self.languages.count];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)cellSelectorSelectedCell:(UITableViewCell *)cell{
    _selectedCell = cell;
}

@end