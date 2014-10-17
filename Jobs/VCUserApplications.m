//
//  VCUserApplications.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/15/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserApplications.h"

@implementation VCUserApplications

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _bottomNavigator.layer.shadowColor = [UIColor blackColor].CGColor;
    _bottomNavigator.layer.shadowOpacity = 1;
    _bottomNavigator.layer.shadowOffset = CGSizeMake(0, 0);
}

- (IBAction)showUserDetailPage:(id)sender {
    [self switchToDetailPage];
}

- (IBAction)showUserSearchesPage:(id)sender {
    [self switchToSearchPage];
}

- (IBAction)showUserDocumentPage:(id)sender {
    [self switchToDocumentPage];
}

- (IBAction)showUserEmploymentPage:(id)sender {
    [self switchToEmploymentPage];
}

- (IBAction)showUserPassword:(id)sender {
    [self switchToPasswordPage];
}
@end
