//
//  CNArticleViewModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

@interface CNArticleViewModel : NSObject

/** 数据列表 */
@property (nonatomic,strong) NSMutableArray<CNArticleDataListModel *> *articleList;
/** 页数 */
@property (nonatomic,assign) NSInteger page;
/** 行数 */
@property (nonatomic,assign) NSInteger length;
/** 获取图片 */
- (NSURL *)getArticleCoverImageForIndex: (NSInteger)index;
/** 获取标题 */
- (NSString *)getArticleTitleForIndex: (NSInteger)index;
/** 获取时间 */
- (NSString *)getArticlePublishTimeForIndex: (NSInteger)index;
/** 获取访问数量 */
- (NSString *)getArticleCommentCountForIndex: (NSInteger)index;
- (void)getSerialVideoRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *error))completionHandler;

@end
