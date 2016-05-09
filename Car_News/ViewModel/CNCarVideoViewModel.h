//
//  CNCarVideoViewModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/9.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

@interface CNCarVideoViewModel : NSObject

/** 数据 */
@property (nonatomic,strong) NSMutableArray<CNCarVideoDataListModel *> *videoList;
- (NSURL *)getVideoCoverImageForIndex: (NSInteger)index;
- (NSString *)getVideoTitleForIndex: (NSInteger)index;
- (NSString *)getVideoDurationForIndex: (NSInteger)index;
- (NSString *)getVideoSourceNameForIndex: (NSInteger)index;
- (NSString *)getVideoCommentCountForIndex: (NSInteger)index;
- (NSString *)getVideoTotalVisitForIndex: (NSInteger)index;
/** 页数 */
@property (nonatomic,assign) NSInteger pageIndex;
/** 新闻述 */
@property (nonatomic,assign) NSInteger pageSize;
- (void)getCarVideoRequestMode: (RequestMode)requestMode completionHandler:(void(^)(NSError *error))completoinHandler;


@end
