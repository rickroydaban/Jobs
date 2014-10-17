//
//  LVUserDetail.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/8/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "LVUserDetail.h"
#import "VCCountrySelection.h"

@implementation LVUserDetail

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _preferredLocations = [NSMutableArray array];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"selected %@",indexPath);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueDetailToCountrySelection"]){
        [(VCCountrySelection *)segue.destinationViewController cellSelectorSelectedCell:sender];
    } else if([segue.identifier isEqualToString:@"segueLocationPreferences"]){
        ((VCCountrySelection *)segue.destinationViewController).selectedFields = _preferredLocations;
        [(VCCountrySelection *)segue.destinationViewController cellSelectorSelectedCell:sender];
    }
}

@end
