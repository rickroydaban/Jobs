//
//  LanguageChanger.m
//  Jobs
//
//  Created by Rick Royd Aban on 11/28/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "LanguageChanger.h"
#import "LanguageChangeDelegate.h"
#import <UIKit/UIKit.h>


@interface LanguageChanger(){
    NSMutableArray *_observables;
}
@end

@implementation LanguageChanger

- (instancetype)init{
    self = [super init];
    
    if(self) {
        _observables = [NSMutableArray array];
    }
    
    return self;
}

- (void)addObservable:(NSObject<LanguageChangeDelegate> *)delegate{
    [_observables addObject:delegate];
}

- (void)applyLanguageChanges{
    for(NSObject<LanguageChangeDelegate> *delegate in _observables)
        delegate.onLanguageChanged;
}

@end
