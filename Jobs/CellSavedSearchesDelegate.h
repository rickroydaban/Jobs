//
//  CellSavedSearchesDelegate.h
//  Jobs
//
//  Created by Rick Royd Aban on 11/14/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellSavedSearches.h"
@protocol CellSavedSearchDelegate <NSObject>

- (void)cellSavedSearchChangeStatus:(id)sender;

@end
