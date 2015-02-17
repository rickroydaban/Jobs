//
//  VCSlider.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//
#import <MessageUI/MFMailComposeViewController.h>

@interface VCSlider : UIViewController<UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UIAlertViewDelegate, MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *propLvSidebar;
@property (strong, nonatomic) IBOutlet UIView *propMainPage;

//default methods
- (void)toggleSidebar;
- (void)reloadSidebarItems;

//custom methods
- (void)changeToProfileSidebarItemsAfterLoginSuccess;
- (void)showJobApplicationListOnPushNotificationReceived;

@end
