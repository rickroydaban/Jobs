//
//  VCUserSwitchingPage.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/3/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"

@interface VCUserSwitchingPage : VCPage<UINavigationControllerDelegate>

+ (VCUserSwitchingPage *)sharedSwitchingPage;
- (void)changePage:(UIViewController *)controller;
@end
