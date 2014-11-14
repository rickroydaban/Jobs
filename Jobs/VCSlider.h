//
//  VCSlider.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCSlider : UIViewController<UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UIAlertViewDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *propLvSidebar;
@property (strong, nonatomic) IBOutlet UIView *propMainPage;

- (void)login;
- (void)toggleSidebar;
- (void)reloadSidebar;

@end
