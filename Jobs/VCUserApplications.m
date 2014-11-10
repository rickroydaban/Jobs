//
//  VCUserApplications.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/15/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserApplications.h"
#import "MBProgressHUD.h"
#import "CellApplication.h"
#import "Application.h"


@implementation VCUserApplications

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:[[UIBarButtonItem alloc] initWithTitle:@"List" style:UIBarButtonItemStylePlain target:self action:@selector(viewApplicationStatusList)],[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)],nil];

    _propLv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _propLv.delegate = self;
    _propLv.dataSource = self;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        id applicationList = [self.propAppDelegate.propGatewayOnline getApplications];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if([applicationList isKindOfClass:[NSString class]])
                [[[UIAlertView alloc] initWithTitle:@"Error" message:applicationList delegate:nil cancelButtonTitle:@"Dimiss" otherButtonTitles:nil, nil] show];
            else
                _propListApplications = applicationList;
            
            [self.propLv reloadData];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (void)viewApplicationStatusList{
    
}

- (void)refresh{
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self.propLv reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellApplication *cell = [self.propLv dequeueReusableCellWithIdentifier:@"cell"];
    Application *application = [_propListApplications objectAtIndex:indexPath.row];
    
    cell.propLabelTitle.text = application.propTitle;
    cell.propLabelStatus.text = application.propStatus;
    cell.propLabelReference.text = [NSString stringWithFormat:@"Reference: %@", application.propReference];
    cell.propLabelDateAdded.text = [NSString stringWithFormat:@"Added on %@",application.propDateAdded];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _propListApplications.count;
}

- (IBAction)showList:(id)sender {
    [self.propAppDelegate.propSlider toggleSidebar];
}


@end
