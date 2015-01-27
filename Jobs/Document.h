//
//  Document.h
//  Jobs
//
//  Created by Rick Royd Aban on 10/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

@interface Document : NSObject

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (NSString *)getDocumentID;
- (NSString *)getName;
- (NSString *)getExtension;
- (NSString *)getFileSize;
- (NSString *)getDateExpire;

- (int)getType;
- (NSString *)jsonFromName:(NSString *)name type:(int)type dateExpiry:(NSString *)dateExpiry;

@end
