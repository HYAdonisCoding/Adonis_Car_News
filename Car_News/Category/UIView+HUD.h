//
//  UIView+HUD.h
//  AutoNews
//
//  Created by caohongyang on 16/4/1.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface UIView (HUD)
/** 显示文字提示 */
- (void)showWarning: (NSString *)words;
/** 显示忙提示 */
- (void)showBusyHUD;
/** 隐藏忙提示 */
- (void)hideBusyHUD;

@end
