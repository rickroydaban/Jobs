//
//  Document.m
//  Jobs
//
//  Created by Rick Royd Aban on 10/29/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//

#import "Document.h"

@interface Document(){
    NSMutableDictionary *_dictionary;
}
@end

@implementation Document

- (id)initWithDictionary:(NSDictionary *)d{

    self = [super init];
    if(self){
        _dictionary = [d mutableCopy];
    }
    
    return self;
}

- (NSString *)getDocumentID{
    return [_dictionary objectForKey:@"DocID"];
}

- (NSString *)getName{
    return [_dictionary objectForKey:@"DocName"];
}

- (NSString *)getDateExpire{
    return [((AppDelegate*)[[UIApplication sharedApplication] delegate]).propGatewayOnline deserializeJsonDateString:[_dictionary objectForKey:@"DateExpiry"]];
}

- (NSString *)getExtension{
    return [_dictionary objectForKey:@"Ext"];
}

- (NSString *)getFileSize{
    float fileSize = [[_dictionary objectForKey:@"FileSize"] floatValue];
    return [NSString stringWithFormat:@"%.0f",fileSize/1024];
}

- (int)getType{
    return [[_dictionary objectForKey:@"DocType"] intValue];
}

- (NSString *)jsonFromName:(NSString *)name type:(int)type dateExpiry:(NSString *)dateExpiry{
    [_dictionary setValue:name forKey:@"DocName"];
    [_dictionary setValue:@(type) forKey:@"DocType"];
    [_dictionary setValue:dateExpiry forKey:@"DateExpiry"];
    
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:_dictionary options:0 error:nil] encoding:NSUTF8StringEncoding];
}

@end
