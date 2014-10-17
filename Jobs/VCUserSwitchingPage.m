//
//  VCUserSwitchingPage.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/3/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#define USERACTIONLOGOUT @"Logout"
#define USERACTIONCLOSEACCOUNT @"Close My Account"
#define USERACTIONUPDATEINFO @"Save"

#import "VCUserSwitchingPage.h"
#import "DAKeyboardControl.h"

@interface VCUserSwitchingPage(){
    UIViewController *_currMainController;
}
@end

@implementation VCUserSwitchingPage

static VCUserSwitchingPage *sharedSwitchingPage;

+ (VCUserSwitchingPage *)sharedSwitchingPage{
    return sharedSwitchingPage;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    sharedSwitchingPage = self;
    [_currMainController didMoveToParentViewController:self];
    [self changePage:([self.appDelegate.offlineGateway isLoggedIn])?[self.appDelegate.userPageNavigators getUserDetailNavigator]:[self.appDelegate.userPageNavigators getVCLogin]];
    
    [self.view addKeyboardPanningWithActionHandler:^(CGRect keyboardFrameInView, BOOL opening, BOOL closing){
        if(closing)
            NSLog(@"closed in change password");
    }];
}

- (void)changePage:(UIViewController *)controller{
    if([controller isKindOfClass:[UINavigationController class]])
        [(UINavigationController *)controller setDelegate:self];
    
//    if(_currMainController == controller)
//        _currMainController = controller;
//    
    if (_currMainController == nil) {
        controller.view.frame = self.view.bounds;
        _currMainController = controller;
        [self addChildViewController:_currMainController];
        [self.view addSubview:_currMainController.view];
        [_currMainController didMoveToParentViewController:self];
    } else if (_currMainController != controller && controller !=nil) {
        controller.view.frame = self.view.bounds;
        [_currMainController willMoveToParentViewController:nil];
        [self addChildViewController:controller];
        self.view.userInteractionEnabled = NO;
        [self transitionFromViewController:_currMainController
                          toViewController:controller
                                  duration:0
                                   options:UIViewAnimationOptionTransitionNone
                                animations:^{}
                                completion:^(BOOL finished){
                                    self.view.userInteractionEnabled = YES;
                                    [_currMainController removeFromParentViewController];
                                    [controller didMoveToParentViewController:self];
                                    _currMainController = controller;
                                }
         ];
    }
}

@end
