//
//  VCLocationSelection.m
//  ApplusJobs
//
//  Created by Rick Royd Aban on 9/24/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCLocationSelection.h"
#import "VelosiDesigner.h"
#import "VelosiColors.h"
#import "MBProgressHUD.h"
#import "VCSearchJob.h"

@interface VCLocationSelection (){
    NSMutableArray *_locations;
}

@end

@implementation VCLocationSelection

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _locations = [NSMutableArray array];
    self.view.backgroundColor = [UIColor whiteColor];
    self.lv.delegate = self;
    self.lv.dataSource = self;
    self.lv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.fieldSearch.delegate = self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [_locations objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [VelosiColors blackFont];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _locations.count;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if([textField.text length]>2){
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *searchString = [NSString stringWithFormat:@"%@%@",textField.text,string];
                _locations = [self.appDelegate.onlineGateway getLocationSuggestions:searchString];
                [self.lv reloadData];
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            });
        });
    }

    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[VCSearchJob getInstance].lv cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]].detailTextLabel.text = [_locations objectAtIndex:indexPath.row];
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (IBAction)done:(id)sender {
    [self.view endEditing:YES];
}



@end
