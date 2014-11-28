//
//  VCEmploymentDetail.h
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCDetail.h"
#import "Employment.h"

@interface VCEmploymentDetail : VCDetail

@property (strong, nonatomic) IBOutlet UITextField *propFieldEmployer;
@property (strong, nonatomic) IBOutlet UITextField *propFieldJobTitle;
@property (strong, nonatomic) IBOutlet UITextField *propFieldDateStart;
@property (strong, nonatomic) IBOutlet UITextField *propFieldDateEnd;
@property (strong, nonatomic) IBOutlet UITextView *propFieldDescription;

@property (strong, nonatomic) Employment *propEmployment;

@end
