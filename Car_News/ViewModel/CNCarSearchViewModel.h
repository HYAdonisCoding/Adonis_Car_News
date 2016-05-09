//
//  CNCarSearchViewModel.h
//  Car_News
//
//  Created by caohongyang on 16/4/28.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

@interface CNCarSearchViewModel : NSObject

/** 获取汽车图片 */
- (NSURL *)getcarIconImageForIndex: (NSInteger)index;
/** 获取汽车名称 */
- (NSString *)getCarNameForIndex: (NSInteger)index;
/** 获取汽车价格 */
- (NSString *)getCarPriceForIndex: (NSInteger)index;
/** 搜索结果 */
@property (nonatomic,strong) NSMutableArray<CNCarSearchCarlistModel *> *resultList;
/** 页码 */
@property (nonatomic,assign) NSInteger page;
/** 消息数 */
@property (nonatomic,assign) NSInteger size;
/** 请求数据 */
- (void)geCarSearchWithRequestMode: (RequestMode)requestMode andKeyword: (NSString *)keyword completionHandler:(void(^)(NSError *error))completoinHandler;
@end
