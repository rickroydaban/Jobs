//
//  VCUserDetails.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/2/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VCPage.h"
#import "VelosiPickerRowSelectionDelegate.h"

@interface VCUserDetails : VCPage<UITextFieldDelegate, UITextViewDelegate, VelosiPickerRowSelectionDelegate>

@property (strong, nonatomic) IBOutlet UIView *lvContainer;
@property (strong, nonatomic) IBOutlet UIView *bottomNavigator;

@property (strong, nonatomic) NSMutableArray *locationprefs, *languages;

@end
