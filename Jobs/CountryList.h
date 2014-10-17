//
//  CountryList.h
//  Jobs
//
//  Created by Rick Royd Aban on 9/26/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountryList : NSObject

@property (strong, nonatomic) NSMutableDictionary *countryIds;
@property (strong, nonatomic) NSMutableArray *countries;
@property (strong, nonatomic) NSArray *aCountries, *bCountries, *cCountries, *dCountries, *eCountries, *fCountries, *gCountries, *hCountries, *iCountries, *jCountries, *kCountries, *lCountries, *mCountries, *nCountries, *oCountries, *pCountries, *qCountries, *rCountries, *sCountries, *tCountries, *uCountries, *vCountries, *wCountries, *yCountries, *zCountries;

+ (CountryList *)sharedCountryList;

@end
