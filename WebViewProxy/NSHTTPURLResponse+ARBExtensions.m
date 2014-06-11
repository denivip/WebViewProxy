//
//  NSHTTPURLResponse+ARBExtensions.m
//  ARBUPnPWebViewExample
//
//  Created by Nikolay Morev on 10.06.14.
//  Copyright (c) 2014 Andreas Rabuser. All rights reserved.
//

#import "NSHTTPURLResponse+ARBExtensions.h"

@implementation NSHTTPURLResponse (ARBExtensions)

- (NSString *)arb_valueForHeaderField:(NSString *)headerField
{
    __block NSString *headerValue = nil;
    [[self allHeaderFields] enumerateKeysAndObjectsUsingBlock:^(NSString *field, NSString *value, BOOL *stop) {
        if ([field caseInsensitiveCompare:headerField] == NSOrderedSame) {
            headerValue = value;
            *stop = YES;
        }
    }];

    return headerValue;
}

- (NSString *)arb_mediaType
{
    NSString *contentType = [self arb_valueForHeaderField:@"Content-Type"];
    if (! contentType) return nil;

    NSCharacterSet *separators = [NSCharacterSet characterSetWithCharactersInString:@";\t "];
    NSArray *contentTypeComponents = [[contentType stringByTrimmingCharactersInSet:separators] componentsSeparatedByCharactersInSet:separators];
    NSString *mediaType = [contentTypeComponents firstObject];

    return mediaType;
}

@end
