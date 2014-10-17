//
//  CurrencyList.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/3/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyList : NSObject

@property (strong, nonatomic, readonly) NSMutableDictionary *currencySymbolNamesDict;
@property (strong, nonatomic, readonly) NSArray *currencySymbolList, *currencyNameList;

@end
