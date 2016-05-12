//
//  CNReducePriceViewModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/12.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

@interface CNReducePriceViewModel : NSObject

/** 数据列表 */
@property (nonatomic,strong) NSMutableArray<CNReducePriceDataListModel *> *priceList;
/** 页数 */
@property (nonatomic,assign) NSInteger page;
/** 行数 */
@property (nonatomic,assign) NSInteger length;
/** 获取车名 */
- (NSString *)getCarNameForIndex: (NSInteger)index;
/** 获取当前价格 */
- (NSString *)getActPriceForIndex: (NSInteger)index;
/** 获取原价格 */
- (NSString *)getReferPriceForIndex: (NSInteger)index;
/** 获取当前价格 */
- (NSString *)getFavPriceForIndex: (NSInteger)index;
/** 获取4S店名称 */
- (NSString *)getDealerNameForIndex: (NSInteger)index;
/** 获取销售状态 */
- (NSString *)getStoreStateForIndex: (NSInteger)index;
/** 获取销售区域 */
- (NSString *)getSaleRegionForIndex: (NSInteger)index;
/** 获取销售电话 */
- (NSString *)getCallCenterNumberForIndex: (NSInteger)index;
/** 获取总数据 */
- (void)getReducePriceDataWithSort: (NSInteger)sort andRequestMode: (RequestMode)requestMode completionHandler: (void(^)(NSError *error))completionHandler;

@end
