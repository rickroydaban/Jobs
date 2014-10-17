//
//  UserPageNavigators.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserPageNavigators : NSObject

+ (UserPageNavigators *)sharedNavigators;

- (UIViewController *)getSwitchingPage;
- (UIViewController *)getVCLogin;
- (UINavigationController *)getUserDetailNavigator;
- (UINavigationController *)getUserSearchesNavigator;
- (UINavigationController *)getUserDocumentsNavigator;
- (UINavigationController *)getUSerApplicationsNavigator;
- (UINavigationController *)getUserEmploymentsNavigator;
- (UINavigationController *)getUSerPasswordNavigator;

@end
