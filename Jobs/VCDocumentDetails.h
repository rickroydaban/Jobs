//
//  VCDocumentDetails.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/30/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Document.h"
#import "VelosiPickerRowSelectionDelegate.h"

@interface VCDocumentDetails : UITableViewController<UITextFieldDelegate, VelosiPickerRowSelectionDelegate>

@property (strong, nonatomic) Document *propDocument;

@property (strong, nonatomic) IBOutlet UITextField *propName;
@property (strong, nonatomic) IBOutlet UITextField *propType;
@property (strong, nonatomic) IBOutlet UITextField *propDateExpiry;

@end
