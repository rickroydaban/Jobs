//
//  Document.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Document : NSObject

@property (assign, nonatomic, readonly) int propType;
@property (strong, nonatomic, readonly) NSString *propId,
                                       *propName,
                                       *propExtension,
                                       *propFileSize,
                                       *propDateExpire;

- initWithID: (NSString *)documentID name:(NSString *)name extension:(NSString *)extension fileSize:(NSString *)fileSize dateExpire:(NSString *)dateExpire type:(int)type;

@end
