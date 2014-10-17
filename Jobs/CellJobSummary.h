//
//  CellJobSummary.h
//  Jobs
//
//  Created by Rick Royd Aban on 9/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellJobSummary : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *fieldTitle;
@property (strong, nonatomic) IBOutlet UILabel *fieldReference;
@property (strong, nonatomic) IBOutlet UILabel *fieldCountry;
@property (strong, nonatomic) IBOutlet UILabel *fieldAddDate;
@property (strong, nonatomic) IBOutlet UITextView *fieldDescription;

@end
