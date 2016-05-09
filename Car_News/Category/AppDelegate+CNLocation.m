//
//  AppDelegate+CNLocation.m
//  Car_News
//
//  Created by caohongyang on 16/4/22.
//  Copyright © 2016年 caohongyang. All rights reserved.
//
/** 分类 和 继承的区别: 分类中不能添加属性 */

#import "AppDelegate+CNLocation.h"
#import <objc/runtime.h>//使用runtime来让分类也能添加属性

@implementation AppDelegate (CNLocation)

/** 黑魔法 */
- (void)setLocationManager:(CLLocationManager *)locationManager {
    /** @selector(locationManager)->指针地址 绑定了指针地址和locationManager变量 向self存储唯一标识locationManager */
    return objc_setAssociatedObject(self, @selector(locationManager), locationManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CLLocationManager *)locationManager {
    /** _cmd当前方法的指针 */
    return objc_getAssociatedObject(self, _cmd);
}
#pragma mark -- CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    /** 使用location[0]取第一个元素 如果数组是空,那么crash,数组越界 */
    CLLocation *locaiton = locations.firstObject;
    if (locaiton) {
        /** 定位代理置空,防止多次弹出警告 */
        manager.delegate = nil;
        /** 如果已经定位,就关掉定位服务 */
        [manager stopUpdatingLocation];
         /** 反地理编码 */
        [[CLGeocoder new] reverseGeocodeLocation:locaiton completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            CLPlacemark *placemark = placemarks.firstObject;
             /** 获取当前城市 */
            NSString *localCity = placemark.locality;
             /** 去掉 市 */
            localCity = [localCity stringByReplacingOccurrencesOfString:@"市" withString:@""];
            MYLog(@"%@",localCity);
            if (![kCurrentCity isEqualToString:localCity]) {
                NSString *message = [NSString stringWithFormat:@"当前城市发生变化,是否要切换到'%@'?",localCity];
                /** blocksKit 第三方的优化 */
                [UIAlertView bk_showAlertViewWithTitle:@"切换城市" message:message cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
                    /** 点击确定后 */
                    if (buttonIndex == 1) {
                        /** 保存新的城市名称 */
                        [[NSUserDefaults standardUserDefaults] setObject:localCity forKey:kCurrentCityName];
                        /** 同步到沙盒 */
                        [[NSUserDefaults standardUserDefaults] synchronize];
                        /** 发送城市变更通知 */
                        [[NSNotificationCenter defaultCenter] postNotificationName:kCurrentCityChangedNotification object:nil];
                    }
                }];
            }
        }];
    }
}
- (void)setupLocation {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 1000.0;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    /** 此方法只有iOS8以后才有,respondsToSelector:返回值是BOOL,为真就代表有某个方法 */
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    /** 设置初始城市 */
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (!kCurrentCity) {
            [[NSUserDefaults standardUserDefaults] setObject:@"北京" forKey:kCurrentCityName];
            [[NSUserDefaults standardUserDefaults] setObject:@201 forKey:kCurrentCityId];
            [[NSUserDefaults standardUserDefaults] synchronize];
            dispatch_async(dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:kCurrentCityChangedNotification object:nil];
            });
        }
    });
}

@end
