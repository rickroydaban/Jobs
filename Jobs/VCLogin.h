//
//  VCLogin.h
//  Jobs
//
//  Created by Rick Royd Aban on 9/26/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCUserPage.h"

@interface VCLogin : VCUserPage<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *fieldUsername;
@property (strong, nonatomic) IBOutlet UITextField *fieldPassword;


@end
