//
//  CNCityAlertController.h
//  Car_News
//
//  Created by caohongyang on 16/4/22.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNAlertController.h"
#import "CNCityListModel.h"
    
@interface CNCityAlertController : CNAlertController

/** 声明一个用于回传数据的Block */
@property (nonatomic,copy) void(^chooseBlock) (NSString *cityName, NSInteger cityId);
/** 传过来的数据模型 */
@property (nonatomic,strong) NSArray<CNCityListDataListModel *> *modelList;

@end
