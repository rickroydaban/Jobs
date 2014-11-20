//
//  UserPageNavigators.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class VCPage;

@interface UserPageNavigators : NSObject

+ (UserPageNavigators *)sharedNavigators;

- (void)logout;
- (VCPage *)getVCHome;
- (VCPage *)getVCSearchPage;
- (UINavigationController *)getLoginNavigator;
- (UINavigationController *)getUserDetailNavigator;
- (UINavigationController *)getUserSearchesNavigator;
- (UINavigationController *)getUserDocumentsNavigator;
- (UINavigationController *)getUSerApplicationsNavigator;
- (UINavigationController *)getUserEmploymentsNavigator;
- (UINavigationController *)getUSerPasswordNavigator;

- (UINavigationController *)getVCAboutUs;
- (UINavigationController *)getVCCVHelp;
- (UINavigationController *)getVCNews;
- (UINavigationController *)getVCTerms;
- (UINavigationController *)getVCPrivacy;
- (UINavigationController *)getVCCopyRight;
- (UINavigationController *)getVCDisclaimer;
- (UINavigationController *)getVCSecurityPolicy;

@end
