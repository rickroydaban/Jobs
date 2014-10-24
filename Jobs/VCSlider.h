//
//  VCSlider.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/23/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCPage.h"

@interface VCSlider : VCPage<UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *sidebarLv;
@property (strong, nonatomic) IBOutlet UIView *mainPage;

@end
