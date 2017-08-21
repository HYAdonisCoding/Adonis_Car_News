//
//  NSObject+Parse.m
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)

- (NSString *)description{
    return [self modelDescription];
}

+ (id)parseJSON:(id)json{
    if ([json isKindOfClass:[NSDictionary class]]) {
        return  [self modelWithJSON:json];
    }
    if ([json isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:[self class] json:json];
    }
    return json;
}

@end
