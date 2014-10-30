//
//  Document.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "Document.h"

@implementation Document

- initWithID: (NSString *)documentID name:(NSString *)name extension:(NSString *)extension fileSize:(NSString *)fileSize dateExpire:(NSString *)dateExpire type:(int)type{
    
    self = [super init];
    if(self){
        _propId = documentID;
        _propName = name;
        _propExtension = extension;
        _propFileSize = fileSize;
        _propDateExpire = dateExpire;
        _propType = type;        
    }
    
    return self;
}

@end
