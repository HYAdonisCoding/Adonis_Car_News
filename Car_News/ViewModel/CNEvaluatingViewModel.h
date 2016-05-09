//
//  CNEvaluatingViewModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/3.
//  Copyright © 2016年 caohongyang. All rights reserved.
// 评测汽车

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

@interface CNEvaluatingViewModel : NSObject
/** 根据UI */
- (NSURL *)getEvaluatingIconURLForIndex: (NSInteger)index;
- (NSString *)getEvaluatingTitleForIndex: (NSInteger)index;
- (NSString *)getEvaluatingMediaNameForIndex: (NSInteger)index;
- (NSString *)getEvaluatingCommentNumberForIndex: (NSInteger)index;
- (NSInteger)getEvaluatingNewsIDForIndex: (NSInteger)index;
/** 根据Model */
/** 新闻 */
@property (nonatomic,strong) NSMutableArray<NewsListDataListModel *> *newsList;
//新闻页数
@property (nonatomic,assign) NSInteger pageNumber;
/** 新闻的个数 */
@property (nonatomic,assign) NSInteger rowNumber;
- (void)getNewsWithRequestMode: (RequestMode)requestMode andCategoryId:(NSInteger)categoryId completionHandler:(void(^)(NSError *error))completoinHandler;

@end
