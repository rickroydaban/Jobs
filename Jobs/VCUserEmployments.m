//
//  VCUserEmployments.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserEmployments.h"
#import "CellEmployment.h"
#import "Employment.h"
#import "VCEmploymentDetail.h"
#import "MBProgressHUD.h"

@implementation VCUserEmployments

- (void)viewDidLoad{
    [super viewDidLoad];
        
    _propLV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _propLV.delegate = self;
    _propLV.dataSource = self;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        id employmentList = [self.propAppDelegate.propGatewayOnline getEmployments];

        dispatch_async(dispatch_get_main_queue(), ^{
            if([employmentList isKindOfClass:[NSString class]])
                [[[UIAlertView alloc] initWithTitle:@"Error" message:employmentList delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            else
                _propListEmployments = employmentList;
            
            [self.propLV reloadData];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        });
    });
}

- (void)viewWillAppear:(BOOL)animated{
    [self.propLV reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellEmployment *cell = [_propLV dequeueReusableCellWithIdentifier:@"cell"];
    Employment *employment = [_propListEmployments objectAtIndex:indexPath.row];
    
    cell.propLabelTitle.text = employment.propJobTitle;
    cell.propLabelDate.text = [NSString stringWithFormat:@"%@ - %@",employment.propDateStart,employment.propDateEnd];
    cell.propLabelEmployer.text = employment.propEmployer;
    cell.tag = indexPath.row;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _propListEmployments.count;
}

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}

- (IBAction)done:(id)sender {
    NSLog(@"Done");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ((VCEmploymentDetail *)segue.destinationViewController).propEmployment = [_propListEmployments objectAtIndex:((CellEmployment *)sender).tag];
}

@end
