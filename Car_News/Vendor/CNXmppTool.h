//
//  ANXmppTool.h
//  AutoNews
//
//  Created by caohongyang on 16/4/14.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMPPFramework.h"
#import "Singleton.h"

/** 注册登陆状态 */
typedef enum{
    ANXMPPResultTypeRegisterSuccess,
    ANXMPPResultTypeRegisterFailed,
    ANXMPPResultTypeRegisterNetError,
    ANXMPPResultTypeLoginSuccess,
    ANXMPPResultTypeLoginFailed,
    ANXMPPResultTypeLoginNetError,
} ANXMPPResultType;

/** 注册Block */
typedef void(^ANXMPPRegisterResultBlock) (ANXMPPResultType type);
/** 登陆Block */
typedef void(^ANXMPPLoginResultBlock)(ANXMPPResultType type);

@interface CNXmppTool : NSObject

/** 单例模式 */
singleton_interface(ANXmppTool)
/** 和服务器交互的最主要对象 */
@property (nonatomic,strong) XMPPStream *xmppStream;
/** 登陆方法 */
- (void)userLogin: (ANXMPPLoginResultBlock)block;
/** 注册方法 */
- (void)userRegister: (ANXMPPRegisterResultBlock)block;
/** 电子名片模块 */
@property (nonatomic,strong) XMPPvCardTempModule *xmppvCard;
/** 电子名片模块对应的存储 */
@property (nonatomic,strong) XMPPvCardCoreDataStorage *xmppvCardDtorage;
/** 头像模块 */
@property (nonatomic,strong) XMPPvCardAvatarModule *xmppvCardAvatar;
/** 花名册模块 */
@property (nonatomic,strong) XMPPRoster *xmppRoster;
/** 花名册存储模块 */
@property (nonatomic,strong) XMPPRosterCoreDataStorage *xmppRosterStorage;
/** 聊天消息模块 */
@property (nonatomic,strong) XMPPMessageArchiving *xmppMsgArch;
/** 聊天消息存储模块 */
@property (nonatomic,strong) XMPPMessageArchivingCoreDataStorage *xmppMsgArchCoreDataStorage;

@end
