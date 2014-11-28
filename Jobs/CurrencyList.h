//
//  CurrencyList.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/3/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

@interface CurrencyList : NSObject

@property (strong, nonatomic, readonly) NSMutableDictionary *propDictCurrencySymbolNames;
@property (strong, nonatomic, readonly) NSArray *propListCurrencySymbols, *propListCurrencyNames;

@end
