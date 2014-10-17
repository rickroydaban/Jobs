//
//  VCUserDocuments.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserDocuments.h"

@implementation VCUserDocuments

- (void)viewDidLoad{
    [super viewDidLoad];
    
}

- (IBAction)showUserDetailPage:(id)sender {
    [self switchToDetailPage];
}

- (IBAction)showUserSearchesPage:(id)sender {
    [self switchToSearchPage];
}

- (IBAction)showUserEmploymentPage:(id)sender {
    [self switchToEmploymentPage];
}

- (IBAction)showUserPasswordPage:(id)sender {
    [self switchToPasswordPage];
}

- (IBAction)showUserApplicationPage:(id)sender {
    [self switchToApplicationsPage];
}

- (IBAction)logout:(id)sender {
    [self logoutAndShowLogin:sender];
}

- (IBAction)advanceSearch:(id)sender {
    [self switchToAdvanceSearchPage:sender];
}

@end
