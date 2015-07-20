//
//  UserPageNavigators.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "PageNavigatorFactory.h"
#import "VCPage.h"

@interface PageNavigatorFactory(){
    UIStoryboard *_sbMain, *_sbSearch, *_sbLogin, *_sbProfileDetail, *_sbProfileDocs, *_sbProfileEmps, *_sbProfileApps, *_sbProfileSS, *_sbChangePass;
    UINavigationController
        *_navigatorHome, *_vcSearchJob,
    
        *_navigatorLogin, *_navigatorUserDetail, *_navigatorUserSearches, *_navigatorUserDocuments, *_navigatorUserApplications, *_navigatorUserEmployment, *_navigatorUserPassword,
    
        *_navigatorAboutus, *_navigatorCVHelp, *_navigatorNews, *_navigatorTerms, *_navigatorPrivacy, *_navigatorCopyright, *_navigatorDisclaimer, *_navigatorSecurityPolicy;
}
@end

@implementation PageNavigatorFactory

static PageNavigatorFactory *sharedNavigators = nil;

+ (PageNavigatorFactory *)sharedNavigators{
    if(sharedNavigators == nil)
        sharedNavigators = [[super alloc] init];
    
    return sharedNavigators;
}

- (instancetype)init{
    self = [super init];
    
    if(self){
        //initialize storyboards
        _sbMain = [UIStoryboard storyboardWithName:@"SBMain" bundle:nil];
        _sbSearch = [UIStoryboard storyboardWithName:@"SBSearch" bundle:nil];
        _sbLogin = [UIStoryboard storyboardWithName:@"SBLogin" bundle:nil];
        _sbProfileDetail = [UIStoryboard storyboardWithName:@"SBProfileDetail" bundle:nil];
        _sbProfileDocs = [UIStoryboard storyboardWithName:@"SBProfileDocs" bundle:nil];
        _sbProfileEmps = [UIStoryboard storyboardWithName:@"SBProfileEmps" bundle:nil];
        _sbProfileApps = [UIStoryboard storyboardWithName:@"SBProfileApps" bundle:nil];
        _sbProfileSS = [UIStoryboard storyboardWithName:@"SBProfileSS" bundle:nil];
        _sbChangePass = [UIStoryboard storyboardWithName:@"SBChangePass" bundle:nil];
    }
    
    return self;
}

- (void)logout{
    _navigatorUserDetail = nil;
    _navigatorUserDocuments = nil;
    _navigatorUserEmployment = nil;
    _navigatorUserApplications = nil;
    _navigatorUserSearches = nil;
}

- (UINavigationController *)getVCHome{
    if(_navigatorHome == nil)
        _navigatorHome = [_sbMain instantiateViewControllerWithIdentifier:@"homePage"];
    
    return _navigatorHome;
}

- (UINavigationController *)getVCSearchPage{
    if(_vcSearchJob == nil)
        _vcSearchJob = [_sbSearch instantiateViewControllerWithIdentifier:@"advanceSearchPage"];
    
    return _vcSearchJob;
}

- (UINavigationController *)getSearchDetailPage{
    return [_sbMain instantiateViewControllerWithIdentifier:@"searchdetailpage"];
}

- (UINavigationController *)getLoginNavigator{
    if(_navigatorLogin == nil)
        _navigatorLogin = [_sbLogin instantiateViewControllerWithIdentifier:@"navigatorLogin"];
    
    return _navigatorLogin;
}

- (UINavigationController *)getUserDetailNavigator{
    if (_navigatorUserDetail == nil)
        _navigatorUserDetail = [_sbProfileDetail instantiateViewControllerWithIdentifier:@"navigatorUserDetails"];
    
    return _navigatorUserDetail;
}

- (UINavigationController *)getUserSearchesNavigator{
    if(_navigatorUserSearches == nil)
        _navigatorUserSearches = [_sbProfileSS instantiateViewControllerWithIdentifier:@"navigatorUserSearches"];

    return _navigatorUserSearches;
}

- (UINavigationController *)getUserDocumentsNavigator{
    if(_navigatorUserDocuments == nil)
        _navigatorUserDocuments = [_sbProfileDocs instantiateViewControllerWithIdentifier:@"navigatorUserDocuments"];
    
    return _navigatorUserDocuments;
}

- (UINavigationController *)getUSerApplicationsNavigator{
    if(_navigatorUserApplications == nil)
        _navigatorUserApplications = [_sbProfileApps instantiateViewControllerWithIdentifier:@"navigatorUserApplications"];
    
    return _navigatorUserApplications;
}

- (UINavigationController *)getUserEmploymentsNavigator{
    if(_navigatorUserEmployment == nil)
        _navigatorUserEmployment = [_sbProfileEmps instantiateViewControllerWithIdentifier:@"navigatorUserEmployment"];
    
    return _navigatorUserEmployment;
}

- (UINavigationController *)getUSerPasswordNavigator{
    if(_navigatorUserPassword == nil)
        _navigatorUserPassword = [_sbChangePass instantiateViewControllerWithIdentifier:@"navigatorUserPassword"];
    
    return _navigatorUserPassword;
}

- (UINavigationController *)getVCAboutUs{
    if(_navigatorAboutus == nil)
        _navigatorAboutus = [_sbMain instantiateViewControllerWithIdentifier:@"aboutusPage"];
    
    return _navigatorAboutus;
}

- (UINavigationController *)getVCCVHelp{
    if(_navigatorCVHelp == nil)
        _navigatorCVHelp = [_sbMain instantiateViewControllerWithIdentifier:@"cvhelpPage"];
    
    return _navigatorCVHelp;
}

- (UINavigationController *)getVCNews{
    if(_navigatorNews == nil)
        _navigatorNews = [_sbMain instantiateViewControllerWithIdentifier:@"newsPage"];
    
    return _navigatorNews;
}

- (UINavigationController *)getVCTerms{
    if(_navigatorTerms == nil)
        _navigatorTerms = [_sbMain instantiateViewControllerWithIdentifier:@"termsPage"];
    
    return _navigatorTerms;
}

- (UINavigationController *)getVCPrivacy{
    if(_navigatorPrivacy == nil)
        _navigatorPrivacy = [_sbMain instantiateViewControllerWithIdentifier:@"privacyPage"];
    
    return _navigatorPrivacy;
}

- (UINavigationController *)getVCCopyRight{
    if(_navigatorCopyright == nil)
        _navigatorCopyright = [_sbMain instantiateViewControllerWithIdentifier:@"copyrightPage"];
    
    return _navigatorCopyright;
}

- (UINavigationController *)getVCDisclaimer{
    if(_navigatorDisclaimer == nil)
        _navigatorDisclaimer = [_sbMain instantiateViewControllerWithIdentifier:@"disclaimerPage"];
    
    return _navigatorDisclaimer;
}

- (UINavigationController *)getVCSecurityPolicy{
    if(_navigatorSecurityPolicy == nil)
        _navigatorSecurityPolicy = [_sbMain instantiateViewControllerWithIdentifier:@"securitypolicyPage"];
    
    return _navigatorSecurityPolicy;
}


@end
