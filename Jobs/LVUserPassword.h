//
//  LVUserPassword.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LVUserPassword : UITableViewController

@property (strong, nonatomic) IBOutlet UITextField *fieldOldPassword;
@property (strong, nonatomic) IBOutlet UITextField *fieldNewPassword;
@property (strong, nonatomic) IBOutlet UITextField *fieldConfirmPassword;

@end
