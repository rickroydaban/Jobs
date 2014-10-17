//
//  VCUserDetails.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VCUserPage.h"
#import "VelosiPickerRowSelectionDelegate.h"

@interface VCUserDetails : VCUserPage<UITextFieldDelegate, UITextViewDelegate, VelosiPickerRowSelectionDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UIView *lvContainer;
@property (strong, nonatomic) IBOutlet UIView *bottomNavigator;
@end
