//
//  VCJobSummary.m
//  Jobs
//
//  Created by Rick Royd Aban on 9/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCJobSummary.h"
#import "CellJobSummary.h"
#import "JobSummary.h"
#import "VelosiColors.h"
#import "VCJobDetails.h"
#import "VCSaveSearch.h"

@interface VCJobSummary(){
    JobSummary *_selectedJob;
}
@end

@implementation VCJobSummary

- (void)viewDidLoad{
    [super viewDidLoad];
    _propListJobs = [NSMutableArray array];
    
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)],[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveSearch)]];
    
    self.propLv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.propLv.dataSource = self;
    self.propLv.delegate = self;
    self.propLv.separatorColor = [VelosiColors listSeparator];
    self.propLv.rowHeight = UITableViewAutomaticDimension;
    self.propLv.estimatedRowHeight = 44.0;
    
    [self refresh];
}

- (void)viewDidAppear:(BOOL)animated{
    [self.propLv reloadData];
}

- (void)saveSearch{
    [self performSegueWithIdentifier:@"segueJobSummaryToSave" sender:nil];
}

- (void)refresh{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        id result = [self.propAppDelegate.propGatewayOnline getAdvanceSearchResults:_propSearchFor in:[self.propAppDelegate.propDictSearchIns objectForKey:_propSearchIn] location:_propSearchLocationID radius:_propSearchDistance jobType:[self.propAppDelegate.propDictJobTypesz allKeysForObject:_propSearchJobType][0] country:_propSearchCountryID postedWithin:_propSearchPostedWithin];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_propListJobs removeAllObjects];
            
            if([result isKindOfClass:[NSString class]])
                [[[UIAlertView alloc] initWithTitle:@" " message:result delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
            else
                [_propListJobs addObjectsFromArray:result];
            
            [self.propLv reloadData];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellJobSummary *cell = (CellJobSummary *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    JobSummary *job = [self.propListJobs objectAtIndex:indexPath.row];
    cell.fieldTitle.text = [job getTitle];
    cell.fieldReference.text = [NSString stringWithFormat:@"Reference: %@",[job getReference]];
    cell.fieldCountry.text = [job getCountry];
    cell.fieldAddDate.text = [NSString stringWithFormat:@"Added on %@",[job getDateAdded]];
    cell.fieldDescription.attributedText = [[NSAttributedString alloc] initWithData:[[job getDetails] dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    [cell.fieldDescription setUserInteractionEnabled:NO];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.propListJobs.count;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VCJobDetails *vcJobDetails = [[self.propAppDelegate.propPageNavigator getSearchDetailPage].viewControllers objectAtIndex:0];
    vcJobDetails.propJob = [self.propListJobs objectAtIndex:indexPath.row];
    vcJobDetails.shouldShowApplyButton = YES;
    
    [self.navigationController pushViewController:vcJobDetails animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueJobSummaryToSave"]){
        VCSaveSearch *vcSaveSearch = (VCSaveSearch *)segue.destinationViewController;
        vcSaveSearch.propSearchInID = [self.propAppDelegate.propDictSearchIns objectForKey:_propSearchIn];
        vcSaveSearch.propSearchIn = _propSearchIn;
        vcSaveSearch.propJobTypeID = [self.propAppDelegate.propDictJobTypesz allKeysForObject:_propSearchJobType][0];
        vcSaveSearch.propJobType = _propSearchJobType;
        vcSaveSearch.propCountryID = _propSearchCountryID;
        vcSaveSearch.propPostedWithin = _propSearchPostedWithin;
        vcSaveSearch.propSearchFor = _propSearchFor;
        vcSaveSearch.propLocation = _propSearchLocation;
        vcSaveSearch.propLocationID = _propSearchLocationID;
        vcSaveSearch.propLat = @"0";
        vcSaveSearch.propLng = @"0";
        vcSaveSearch.propDistance = _propSearchDistance;
        
    }
}

@end
