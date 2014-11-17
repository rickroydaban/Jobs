//
//  Application.h
//  Jobs
//
//  Created by Rick Royd Aban on 11/10/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Application : NSObject

@property (assign, nonatomic) int propID;
@property (strong, nonatomic) NSString *propTitle;
@property (strong, nonatomic) NSString *propJobID;
@property (strong, nonatomic) NSString *propJobRef;
@property (strong, nonatomic) NSString *propStatus;
@property (strong, nonatomic) NSString *propDateAdded;

- (Application *)initWithID:(int)applicationID title:(NSString *)title jobID:(NSString *)jobID jobRef:(NSString *)jobRef status:(NSString *)status dateAdded:(NSString *)dateAdded;

@end
