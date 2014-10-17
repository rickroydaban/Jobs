//
//  VCUserPage.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/3/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserPage.h"
#import "VCUserSwitchingPage.h"

@interface VCUserPage(){
    VCUserSwitchingPage *_switchingPage;
    BOOL _isToolbarShown;
}
@end

@implementation VCUserPage

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _switchingPage = [VCUserSwitchingPage sharedSwitchingPage];
    _isToolbarShown = false;
}

- (void)switchToDetailPage{
    [_switchingPage changePage:[self.appDelegate.userPageNavigators getUserDetailNavigator]];
}

- (void)switchToSearchPage{
    [_switchingPage changePage:[self.appDelegate.userPageNavigators getUserSearchesNavigator]];
}

- (void)switchToEmploymentPage{
    [_switchingPage changePage:[self.appDelegate.userPageNavigators getUserEmploymentsNavigator]];
}

- (void)switchToDocumentPage{
    [_switchingPage changePage:[self.appDelegate.userPageNavigators getUserDocumentsNavigator]];
}

- (void)switchToApplicationsPage{
    [_switchingPage changePage:[self.appDelegate.userPageNavigators getUSerApplicationsNavigator]];
}

- (void)switchToPasswordPage{
    [_switchingPage changePage:[self.appDelegate.userPageNavigators getUSerPasswordNavigator]];
}

- (void)switchToLoginPage{
    [_switchingPage changePage:[self.appDelegate.userPageNavigators getVCLogin]];
}

- (void)toggleActionToolbar{
    (_isToolbarShown)?[self hideToolbar]:[self showToolbar];
    _isToolbarShown = !_isToolbarShown;
}

- (void)logoutAndShowLogin:(id)sender{
    [self.appDelegate.offlineGateway logout];
    [self switchToLoginPage];
}

- (void)switchToAdvanceSearchPage:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showToolbar{
    CGRect vf = self.view.frame;
    vf.origin.y = 46;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0];
    [UIView setAnimationCurve:7];
    self.view.frame = vf;
    [UIView commitAnimations];
}

- (void)hideToolbar{
    CGRect containerFrame = self.view.frame;
    containerFrame.origin.y = 0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0];
    [UIView setAnimationCurve:7];
    self.view.frame = containerFrame;
    [UIView commitAnimations];
}

@end

