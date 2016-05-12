//
//  CNDetailTalkAboutViewModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/5.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

@interface CNDetailTalkAboutViewModel : NSObject

/** 新闻正文 图片 */
- (NSString *)getDetailtalkAboutTextOrPictureForIndex: (NSInteger)index;
/** 数据组 */
@property (nonatomic,strong) NSMutableArray<CNDetailTalkAboutDataContentModel *> *dataList;
/** 获取数据 */
- (void)getDetailTalkAboutCarWithNewsListlistModel: (NewsListDataListModel *)modelIn categoryId:(NSInteger)categoryId completionHandler:(void(^)(NSError *error))completoinHandler;

@end
