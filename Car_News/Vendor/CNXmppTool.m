//
//  ANXmppTool.m
//  AutoNews
//
//  Created by caohongyang on 16/4/14.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNXmppTool.h"
#import "CNUserInfo.h"

@interface CNXmppTool ()<XMPPStreamDelegate> {
    /** 定义一个成员变量 */
    ANXMPPRegisterResultBlock _registerBlock;
    ANXMPPLoginResultBlock _loginBlock;
}
/** 设置流 对流对象进行赋值并设置代理 */
- (void)setupXmppStream;
/** 连接服务器 */
- (void)connectToSever;
/** 发送密码请求授权 */
- (void)sendPassword;
/** 发送在线消息 */
- (void)sendOnline;

@end

@implementation CNXmppTool

#pragma mark -- Methods
singleton_implementation(CNXmppTool)
/** 设置流 对流对象进行赋值并设置代理 */
- (void)setupXmppStream {
    
}
/** 连接服务器 */
- (void)connectToSever {
    
}
/** 发送密码请求授权 */
- (void)sendPassword {
    
}
/** 发送在线消息 */
- (void)sendOnline {
    
}
- (void)userLogin:(ANXMPPLoginResultBlock)block {
    
}
- (void)userRegister:(ANXMPPRegisterResultBlock)block {
    
}
#pragma mark -- XMPPStreamDelegate
/** 连接成功 */
- (void)xmppStreamDidConnect:(XMPPStream *)sender {
    
}
/** 连接失败 */
- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error {
    
}
/** 授权成功 */
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
    
}
/** 授权失败 */
- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error {
    
}
/** 注册成功 */
- (void)xmppStreamDidRegister:(XMPPStream *)sender {
    
}
/** 注册失败 */
- (void)xmppStream:(XMPPStream *)sender didNotRegister:(DDXMLElement *)error {
    
}
@end
