//
//  UIView+HUD.m
//  AutoNews
//
//  Created by caohongyang on 16/4/1.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "UIView+HUD.h"

#define kShowWarningDelayDuration 1
#define kTimeoutDuration 30

@implementation UIView (HUD)
- (void)showWarning:(NSString *)words{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = words;
        [hud hide:YES afterDelay:kShowWarningDelayDuration];
    });
}
- (void)showBusyHUD{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        [[MBProgressHUD showHUDAddedTo:self animated:YES] hide:YES afterDelay:kTimeoutDuration];
    });
}
- (void)hideBusyHUD{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
    });
}
@end
