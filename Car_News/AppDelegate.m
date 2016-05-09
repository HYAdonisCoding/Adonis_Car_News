//
//  AppDelegate.m
//  Car_News
//
//  Created by caohongyang on 16/4/15.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "AppDelegate.h"
//#import "AppDelegate+CNLocation.h"
#import "AppDelegate+System.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
     [self configGlovalUI];
    //调用分类中的方法
//    [self setupLocation];   
    return YES;
}
//对UI进行统一配置
- (void)configGlovalUI {
    //设置tabBar 的颜色

//    self.window.tintColor = kRGBColor(41, 42, 45, 1.0);
    //设置导航栏背景色
    [[UINavigationBar appearance] setBarTintColor: kRGBColor(31, 34, 45, 1.0)];
    //设置导航栏的分割(黑色) 电池条自动变白
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackOpaque];
    //配置导航栏文字颜色
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    
    //配置导航栏标题文字样式
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:20]}];
    
    
}

@end
