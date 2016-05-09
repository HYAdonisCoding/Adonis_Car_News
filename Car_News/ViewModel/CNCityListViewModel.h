//
//  CNCityListViewModel.h
//  Car_News
//
//  Created by caohongyang on 16/4/21.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

@interface CNCityListViewModel : NSObject

/** 城市名称 */
- (NSString *)getCityNameForIndex: (NSInteger)index;
/** 城市拼音 */
- (NSString *)getCityEngNameForIndex: (NSInteger)index;
/** 城市ID */
- (NSString *)getCityIdForIndex: (NSInteger)index;
/** 城市列表 */
@property (nonatomic,strong) NSMutableArray<CNCityListDataListModel *> *cityList;
- (void)getCityListCompletionHandler: (void(^)(NSError *error))completionHandler;
@end
