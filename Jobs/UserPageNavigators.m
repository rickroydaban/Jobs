//
//  UserPageNavigators.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "UserPageNavigators.h"
#import "VCLogin.h"
#import "VCUserSwitchingPage.h"

@interface UserPageNavigators(){
    UIStoryboard *_storyBoard;
    UINavigationController *_navigatorUserDetail, *_navigatorUserSearches, *_navigatorUserDocuments, *_navigatorUserApplications, *_navigatorUserEmployment, *_navigatorUserPassword;
    VCLogin *_vcLogin;
    VCUserSwitchingPage *_switchingPage;
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

- (UIViewController *)getSwitchingPage{
    if(_switchingPage == nil){
        _switchingPage = [_storyBoard instantiateViewControllerWithIdentifier:@"switchingPage"];
        _switchingPage.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    }
    return _switchingPage;
}

- (UIViewController *)getVCLogin{
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
