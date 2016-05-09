//
//  CNCityListViewController.h
//  Car_News
//
//  Created by caohongyang on 16/4/21.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CNCityListModel.h"

/** Xcode7之后的新特性,好处是不需要BulidPhaze里面去引入类库(只适用于系统类库) */
@import CoreLocation;

@interface CNCityListViewController : UITableViewController

/** 定位服务 */
@property (nonatomic,strong) CLLocationManager *locationManager;
/** 开启定位服务 */
- (void)setupLocation;

@end
