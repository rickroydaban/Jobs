//
//  LVUserDetail.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/8/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "LVUserDetail.h"
#import "VCCountrySelection.h"
#import "VCLanguages.h"

@implementation LVUserDetail

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"selected %@",indexPath);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueDetailToCountrySelection"]){
        [(VCCountrySelection *)segue.destinationViewController cellSelectorSelectedCell:sender];
    } else if([segue.identifier isEqualToString:@"segueLocationPreferences"]){
        ((VCCountrySelection *)segue.destinationViewController).selectedFields = self.vcUserDetails.locationprefs;
        [(VCCountrySelection *)segue.destinationViewController cellSelectorSelectedCell:sender];
    }
    
    if([segue.destinationViewController isKindOfClass:[VCLanguages class]]){
        ((VCLanguages *)segue.destinationViewController).languages = self.vcUserDetails.languages;
        [(VCLanguages *)segue.destinationViewController cellSelectorSelectedCell:sender];
    }
}

@end
