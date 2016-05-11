//
//  CNTransferInfo.h
//  Car_News
//
//  Created by caohongyang on 16/4/27.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@class CNSerialDataSerialListModel;

@interface CNTransferInfo : NSObject

singleton_interface(CNTransferInfo)
/** 品牌ID */
@property (nonatomic,assign) NSInteger masterId;
/** 车系 */
@property (nonatomic,strong) CNSerialDataSerialListModel *model;

@end
