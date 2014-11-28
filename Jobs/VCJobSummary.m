//
//  VCJobSummary.m
//  Jobs
//
//  Created by Rick Royd Aban on 9/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCJobSummary.h"
#import "CellJobSummary.h"
#import "Job.h"
#import "VelosiColors.h"
#import "VCJobDetails.h"

@interface VCJobSummary(){
    NSMutableArray *_heights;
    Job *_selectedJob;
}
@end

@implementation VCJobSummary

- (void)viewDidLoad{
    [super viewDidLoad];
    _propListJobs = [NSMutableArray array];
    _heights = [NSMutableArray array];
    
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)],[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveSearch)]];
    
    self.propLv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.propLv.dataSource = self;
    self.propLv.delegate = self;
    self.propLv.separatorColor = [VelosiColors listSeparator];
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
        id result = [self.propAppDelegate.propGatewayOnline getAdvanceSearchResults:_propSearchFor in:_propSearchIn location:_propSearchLocation radius:_propSearchDistance jobType:_propSearchJobType country:_propSearchCountry postedWithin:_propSearchPostedWithin];
        
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
    UITextView *newDescTV;
    CGFloat newHeight = [[_heights objectAtIndex:indexPath.row] floatValue];
    
    CellJobSummary *cell = (CellJobSummary *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    Job *job = [self.propListJobs objectAtIndex:indexPath.row];
    cell.fieldTitle.text = job.propTitle;
    cell.fieldReference.text = [NSString stringWithFormat:@"Reference: %@",job.propReference];
    cell.fieldCountry.text = job.propCountry;
    cell.fieldAddDate.text = [NSString stringWithFormat:@"Added on %@",job.propDateAdded];
    cell.fieldDescription.text = @"";
    
    if([cell.fieldDescription isDescendantOfView:cell.fieldTitle.superview]){
        CGRect oldFrame = cell.fieldDescription.frame;
        UIView *superView = (UIView *)cell.fieldTitle.superview;
        newDescTV = [[UITextView alloc] initWithFrame:CGRectMake(oldFrame.origin.x, oldFrame.origin.y, oldFrame.size.width, newHeight)];
        newDescTV.tag = 4;
        newDescTV.editable = NO;
        [cell.fieldDescription removeFromSuperview];
        [superView addSubview:newDescTV];
        cell.tag = indexPath.row;
    }else{
        for(UIView *temp in [cell.fieldTitle.superview subviews]){
            if(temp.tag == 4){
                newDescTV = (UITextView *)temp;
                break;
            }
        }
    }
    
    CGRect frame = newDescTV.frame;
    newDescTV.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, newHeight);
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[job.propDetails dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    newDescTV.attributedText = attributedString;
    newDescTV.font = [UIFont systemFontOfSize:13];
    newDescTV.textColor = [VelosiColors blackFont];
    newDescTV.userInteractionEnabled = NO;
    newDescTV.textContainer.size = CGSizeMake(frame.size.width, newHeight);
    newDescTV.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellJobSummary *cell = (CellJobSummary *)[self.propLv dequeueReusableCellWithIdentifier:@"cell"];
    Job *job = (Job *)[self.propListJobs objectAtIndex:indexPath.row];
    cell.fieldDescription.text = job.propDetails;
    CGSize estimatedSize = [cell.fieldDescription sizeThatFits:CGSizeMake(cell.fieldDescription.frame.size.width, 999)];
    CGFloat rowHeight = estimatedSize.height+100;
    [_heights addObject:[NSString stringWithFormat:@"%f",estimatedSize.height]];
    return rowHeight;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueJobSummaryToSave"]){
        
    }else{
        VCJobDetails *vcJobDetails = (VCJobDetails *)segue.destinationViewController;
        vcJobDetails.propJob = [self.propListJobs objectAtIndex:((CellJobSummary *)sender).tag];
    }
}

@end
