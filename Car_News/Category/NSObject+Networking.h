//
//  NSObject+Networking.h
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface NSObject (Networking)
+ (id)GET: (NSString *)path parameters: (NSDictionary *)parameters progress: (void(^)(NSProgress *downloadProgress))downloadProgress completionHandler: (void(^)(id reponseObj, NSError *error))completionHandler;

+ (id)POST: (NSString *)path parameters: (NSDictionary *)parameters progress: (void(^)(NSProgress *downloadProgress))downloadProgress completionHandler: (void(^)(id reponseObj, NSError *error))completionHandler;
@end
