//
//  CNCarRankingViewModel.h
//  Car_News
//
//  Created by caohongyang on 16/4/20.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

@interface CNCarRankingViewModel : NSObject

/** 获取汽车图片 */
- (NSURL *)getcarIconImageForIndex: (NSInteger)index;
/** 获取汽车名称 */
- (NSString *)getCarNameForIndex: (NSInteger)index;
/** 获取汽车价格 */
- (NSString *)getCarPriceForIndex: (NSInteger)index;
/** 获取汽车销量 */
- (NSString *)getCarSalesNumberForIndex: (NSInteger)index;
/** 获取汽车模型数组 */
@property (nonatomic,strong) NSMutableArray<CNCarRankingDataListModel *> *rankingList;
/** 页数 */
@property (nonatomic,assign) NSInteger pageNumber;
/** 时间 */
@property (nonatomic, copy) NSString *date;
/** 城市 */
@property (nonatomic,assign) NSInteger cityId;


/** 获取汽车模型 */
- (void)getCarRankingWithRequestMode: (RequestMode)requestMode  andCarLevel: (NSInteger)carLevel completionHandler: (void(^)(NSError *error))completionHandler;




@end
