//
//  VCUserEmployments.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserEmployments.h"

@implementation VCUserEmployments

- (IBAction)showUserDetailPage:(id)sender {
    [self switchToDetailPage];
}

- (IBAction)showUserSearchesPage:(id)sender {
    [self switchToSearchPage];
}

- (IBAction)showUserDocumentPage:(id)sender {
    [self switchToDocumentPage];
}

- (IBAction)showUserPasswordPage:(id)sender {
    [self switchToPasswordPage];
}

- (IBAction)logout:(id)sender {
    [self logoutAndShowLogin:sender];
}

- (IBAction)showUserApplicationPage:(id)sender {
    [self switchToApplicationsPage];
}

- (IBAction)advanceSearch:(id)sender {
    [self switchToAdvanceSearchPage:sender];
}

@end
