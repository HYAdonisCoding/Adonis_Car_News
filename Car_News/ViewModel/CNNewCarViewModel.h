//
//  CNNewCarViewModel.h
//  Car_News
//
//  Created by caohongyang on 16/4/28.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

@interface CNNewCarViewModel : NSObject

/** 车型列表 */
@property (nonatomic,strong) NSMutableArray<CNNewCarDataModel *> *carList;
/** 获取汽车名称 */
- (NSString *)getCarNameForIndex: (NSInteger)index;
/** 获取汽车价格 */
- (NSString *)getCarPriceForIndex: (NSInteger)index;
/** 获取汽车图片 */
- (NSURL *)getCarImageForIndex: (NSInteger)index;
/** 获取数据 */
- (void)getNewCarCompletionHandler: (void(^)(NSError *error))completionHandler;

@end
