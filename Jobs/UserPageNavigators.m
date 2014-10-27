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
    UINavigationController *_navigatorUserDetail, *_navigatorUserSearches, *_navigatorUserDocuments, *_navigatorUserApplications, *_navigatorUserEmployment, *_navigatorUserPassword;
    VCPage *_vcLogin;
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

- (VCPage *)getVCLogin{
    if(_vcLogin == nil)
        _vcLogin = [_storyBoard instantiateViewControllerWithIdentifier:@"loginPage"];
    
    return _vcLogin;
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


@end
