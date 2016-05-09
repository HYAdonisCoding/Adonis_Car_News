//
//  CNAlertViewModel.h
//  Car_News
//
//  Created by caohongyang on 16/4/17.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

@interface CNAlertViewModel : NSObject

/** 根据UI */
- (NSString *)getDealerPriceForIndex: (NSInteger)index;
- (NSString *)getSerialNameForIndex: (NSInteger)index;
- (NSURL *)getIconURLForIndex: (NSInteger)index;

- (NSString *)getBrandNameForIndex: (NSInteger)index;
/** 数据 */
@property (nonatomic,strong) NSMutableArray<CNSerialDataModel *> *data;
/** 列表 */
@property (nonatomic,strong) NSMutableArray<CNSerialDataSerialListModel *> *serialList;

/** 根据Model */
- (void)getSerialListWithMasterId: (NSInteger)masterId CompletionHandler: (void(^)(NSError *error))completionHandler;

@end
