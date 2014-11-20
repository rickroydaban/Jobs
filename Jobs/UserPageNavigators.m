//
//  UserPageNavigators.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "UserPageNavigators.h"
#import "VCPage.h"

@interface UserPageNavigators(){
    UIStoryboard *_storyBoard;
    UINavigationController *_navigatorLogin, *_navigatorUserDetail, *_navigatorUserSearches, *_navigatorUserDocuments, *_navigatorUserApplications, *_navigatorUserEmployment, *_navigatorUserPassword,
    
        *_navigatorAboutus, *_navigatorCVHelp, *_navigatorNews, *_navigatorTerms, *_navigatorPrivacy, *_navigatorCopyright, *_navigatorDisclaimer, *_navigatorSecurityPolicy;
    
    VCPage *_vcHome;
    VCPage *_vcSearchJob;
}
@end

@implementation UserPageNavigators

static UserPageNavigators *sharedNavigators = nil;

+ (UserPageNavigators *)sharedNavigators{
    if(sharedNavigators == nil)
        sharedNavigators = [[super alloc] init];
    
    return sharedNavigators;
}

- (instancetype)init{
    self = [super init];
    
    if(self){
        _storyBoard = [UIStoryboard storyboardWithName:@"iphone5" bundle:nil];
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

- (VCPage *)getVCHome{
    if(_vcHome == nil)
        _vcHome = [_storyBoard instantiateViewControllerWithIdentifier:@"homePage"];
    
    return _vcHome;
}

- (VCPage *)getVCSearchPage{
    if(_vcSearchJob == nil)
        _vcSearchJob = [_storyBoard instantiateViewControllerWithIdentifier:@"advanceSearchPage"];
    
    return _vcSearchJob;
}

- (UINavigationController *)getLoginNavigator{
    if(_navigatorLogin == nil)
        _navigatorLogin = [_storyBoard instantiateViewControllerWithIdentifier:@"navigatorLogin"];
    
    return _navigatorLogin;
}

- (UINavigationController *)getUserDetailNavigator{
    if (_navigatorUserDetail == nil)
        _navigatorUserDetail = [_storyBoard instantiateViewControllerWithIdentifier:@"navigatorUserDetails"];
    
    return _navigatorUserDetail;
}

- (UINavigationController *)getUserSearchesNavigator{
    if(_navigatorUserSearches == nil)
        _navigatorUserSearches = [_storyBoard instantiateViewControllerWithIdentifier:@"navigatorUserSearches"];

    return _navigatorUserSearches;
}

- (UINavigationController *)getUserDocumentsNavigator{
    if(_navigatorUserDocuments == nil)
        _navigatorUserDocuments = [_storyBoard instantiateViewControllerWithIdentifier:@"navigatorUserDocuments"];
    
    return _navigatorUserDocuments;
}

- (UINavigationController *)getUSerApplicationsNavigator{
    if(_navigatorUserApplications == nil)
        _navigatorUserApplications = [_storyBoard instantiateViewControllerWithIdentifier:@"navigatorUserApplications"];
    
    return _navigatorUserApplications;
}

- (UINavigationController *)getUserEmploymentsNavigator{
    if(_navigatorUserEmployment == nil)
        _navigatorUserEmployment = [_storyBoard instantiateViewControllerWithIdentifier:@"navigatorUserEmployment"];
    
    return _navigatorUserEmployment;
}

- (UINavigationController *)getUSerPasswordNavigator{
    if(_navigatorUserPassword == nil)
        _navigatorUserPassword = [_storyBoard instantiateViewControllerWithIdentifier:@"navigatorUserPassword"];
    
    return _navigatorUserPassword;
}

- (UINavigationController *)getVCAboutUs{
    if(_navigatorAboutus == nil)
        _navigatorAboutus = [_storyBoard instantiateViewControllerWithIdentifier:@"aboutusPage"];
    
    return _navigatorAboutus;
}

- (UINavigationController *)getVCCVHelp{
    if(_navigatorCVHelp == nil)
        _navigatorCVHelp = [_storyBoard instantiateViewControllerWithIdentifier:@"cvhelpPage"];
    
    return _navigatorCVHelp;
}

- (UINavigationController *)getVCNews{
    if(_navigatorNews == nil)
        _navigatorNews = [_storyBoard instantiateViewControllerWithIdentifier:@"newsPage"];
    
    return _navigatorNews;
}

- (UINavigationController *)getVCTerms{
    if(_navigatorTerms == nil)
        _navigatorTerms = [_storyBoard instantiateViewControllerWithIdentifier:@"termsPage"];
    
    return _navigatorTerms;
}

- (UINavigationController *)getVCPrivacy{
    if(_navigatorPrivacy == nil)
        _navigatorPrivacy = [_storyBoard instantiateViewControllerWithIdentifier:@"privacyPage"];
    
    return _navigatorPrivacy;
}

- (UINavigationController *)getVCCopyRight{
    if(_navigatorCopyright == nil)
        _navigatorCopyright = [_storyBoard instantiateViewControllerWithIdentifier:@"copyrightPage"];
    
    return _navigatorCopyright;
}

- (UINavigationController *)getVCDisclaimer{
    if(_navigatorDisclaimer == nil)
        _navigatorDisclaimer = [_storyBoard instantiateViewControllerWithIdentifier:@"disclaimerPage"];
    
    return _navigatorDisclaimer;
}

- (UINavigationController *)getVCSecurityPolicy{
    if(_navigatorSecurityPolicy == nil)
        _navigatorSecurityPolicy = [_storyBoard instantiateViewControllerWithIdentifier:@"securitypolicyPage"];
    
    return _navigatorSecurityPolicy;
}


@end
