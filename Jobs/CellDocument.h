//
//  CellDocument.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellDocument : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *propTitle;
@property (strong, nonatomic) IBOutlet UILabel *propDateExpire;
@property (strong, nonatomic) IBOutlet UILabel *propExtAndType;
@property (strong, nonatomic) IBOutlet UILabel *propFileSize;

@end
