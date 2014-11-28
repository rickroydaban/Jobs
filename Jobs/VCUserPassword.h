//
//  VCUserPassword.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"
#import "VCList.h"

@interface VCUserPassword : VCList<UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *fieldOldPassword;
@property (strong, nonatomic) IBOutlet UITextField *fieldNewPassword;
@property (strong, nonatomic) IBOutlet UITextField *fieldConfirmPassword;

@end
