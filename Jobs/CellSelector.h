//
//  CellSelector.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/17/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CellSelector <NSObject>

- (void)cellSelectorSelectedCell:(UITableViewCell *)sender withObject:(id)data;

@end
