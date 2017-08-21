//
//  ANUserInfo.m
//  AutoNews
//
//  Created by caohongyang on 16/4/14.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNUserInfo.h"

@implementation CNUserInfo

/** 单例模式 */
singleton_implementation(CNUserInfo);

- (NSString *)jidStr {
    return [NSString stringWithFormat:@"%@@%@",self.userName,ANXMPPDOMAIN];
}

@end
