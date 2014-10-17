//
//  VCUserPage.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/3/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"
#import "VCUserSwitchingPage.h"

@interface VCUserPage : VCPage

- (void)switchToDetailPage;
- (void)switchToSearchPage;
- (void)switchToEmploymentPage;
- (void)switchToDocumentPage;
- (void)switchToApplicationsPage;
- (void)switchToPasswordPage;
- (void)switchToLoginPage;
- (void)logoutAndShowLogin:(id)sender;
- (void)switchToAdvanceSearchPage:(id)sender;
- (void)toggleActionToolbar;
- (void)showToolbar;
- (void)hideToolbar;

@end

