//
//  AppDelegate+CNLocation.h
//  Car_News
//
//  Created by caohongyang on 16/4/22.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "AppDelegate.h"

/** Xcode7之后的新特性,好处是不需要BulidPhaze里面去引入类库(只适用于系统类库) */
@import CoreLocation;

@interface AppDelegate (CNLocation) <CLLocationManagerDelegate>

/** 定位服务 */
@property (nonatomic,strong) CLLocationManager *locationManager;
/** 开启定位服务 */
- (void)setupLocation;

@end
