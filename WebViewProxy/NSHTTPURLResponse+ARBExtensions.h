//
//  NSHTTPURLResponse+ARBExtensions.h
//  ARBUPnPWebViewExample
//
//  Created by Nikolay Morev on 10.06.14.
//  Copyright (c) 2014 Andreas Rabuser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSHTTPURLResponse (ARBExtensions)

//! Case insensitive match.
- (NSString *)arb_valueForHeaderField:(NSString *)headerField;

- (NSString *)arb_mediaType;

@end
