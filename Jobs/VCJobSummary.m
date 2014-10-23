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
    
    _heights = [NSMutableArray array];
    self.lv.dataSource = self;
    self.lv.delegate = self;
    self.lv.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.lv.separatorColor = [VelosiColors listSeparator];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITextView *newDescTV;
    CGFloat newHeight = [[_heights objectAtIndex:indexPath.row] floatValue];
    
    CellJobSummary *cell = (CellJobSummary *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    Job *job = [self.jobs objectAtIndex:indexPath.row];
    cell.fieldTitle.text = job.title;
    cell.fieldTitle.textColor = [VelosiColors blackFont];
    cell.fieldReference.text = [NSString stringWithFormat:@"Reference: %@",job.reference];
    cell.fieldCountry.text = job.country;
    cell.fieldAddDate.text = [NSString stringWithFormat:@"Added on %@",job.dateAdded];
    cell.fieldDescription.text = @"test";
    
    if([cell.fieldDescription isDescendantOfView:cell.fieldTitle.superview]){
        CGRect oldFrame = cell.fieldDescription.frame;
        UIView *superView = (UIView *)cell.fieldTitle.superview;
        newDescTV = [[UITextView alloc] initWithFrame:CGRectMake(oldFrame.origin.x, oldFrame.origin.y, oldFrame.size.width, newHeight)];
        newDescTV.backgroundColor = [UIColor clearColor];
        newDescTV.tag = 4;
        newDescTV.editable = NO;
        [cell.fieldDescription removeFromSuperview];
        [superView addSubview:newDescTV];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[job.details dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    newDescTV.attributedText = attributedString;
    newDescTV.font = [UIFont systemFontOfSize:13];
    newDescTV.textColor = [VelosiColors blackFont];
    newDescTV.userInteractionEnabled = NO;
    newDescTV.textContainer.size = CGSizeMake(frame.size.width, newHeight);
    newDescTV.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellJobSummary *cell = (CellJobSummary *)[self.lv dequeueReusableCellWithIdentifier:@"cell"];
    Job *job = (Job *)[self.jobs objectAtIndex:indexPath.row];
    cell.fieldDescription.text = job.details;
    CGSize estimatedSize = [cell.fieldDescription sizeThatFits:CGSizeMake(cell.fieldDescription.frame.size.width, 999)];
    CGFloat rowHeight = estimatedSize.height+100;
    [_heights addObject:[NSString stringWithFormat:@"%f",estimatedSize.height]];
    return rowHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.jobs.count;
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
    VCJobDetails *vcJobDetails = (VCJobDetails *)segue.destinationViewController;
    vcJobDetails.job = [self.jobs objectAtIndex:((CellJobSummary *)sender).tag];
}

- (IBAction)showActions:(id)sender {
    [[[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Reload Search", @"Save Search", nil] showInView:self.view];
}


@end
