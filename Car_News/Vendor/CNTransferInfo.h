//
//  CNTransferInfo.h
//  Car_News
//
//  Created by caohongyang on 16/4/27.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@class CNSerialDataSerialListModel,SelectCarHotSerialModel,CNHotSearchDataModel;

@interface CNTransferInfo : NSObject

singleton_interface(CNTransferInfo)
/** 品牌ID */
@property (nonatomic,assign) NSInteger masterId;
/** 车系 */
@property (nonatomic,strong) CNSerialDataSerialListModel *model;
/** 热门 */
@property (nonatomic,strong) SelectCarHotSerialModel *data;
/** 热门搜索 */
@property (nonatomic,strong) CNHotSearchDataModel *dataModel;

@end
