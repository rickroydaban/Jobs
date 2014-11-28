//
//  VCHome.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/27/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "VCPage.h"
#import "LanguageChangeDelegate.h"

@interface VCHome : VCPage<UITableViewDataSource, UITableViewDelegate, LanguageChangeDelegate>

@property (strong, nonatomic) IBOutlet UITableView *propLV;
@property (strong, nonatomic) NSMutableArray *propListVacancies;

@end
