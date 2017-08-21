//
//  ANUserInfo.h
//  AutoNews
//
//  Created by caohongyang on 16/4/14.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface CNUserInfo : NSObject

/** 单例模式 */
singleton_interface(ANUserInfo)
/** 用户名 */
@property (nonatomic,copy) NSString *userName;
/** 密码 */
@property (nonatomic,copy) NSString *userPassword;
/** 注册的用户名 */
@property (nonatomic,copy) NSString *userRegisterName;
/** 注册的密码 */
@property (nonatomic,copy) NSString *userRegisterPassword;
/** 提供一个获取当前用户jidStr 只读的 */
@property (nonatomic,copy) NSString *jidStr;
/** 区分注册还是登陆 */
@property (nonatomic,assign,getter=isLogin) BOOL login;


@end
