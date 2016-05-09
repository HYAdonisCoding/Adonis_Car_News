//
//  CNNewsAlbumListViewModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

@interface CNNewsAlbumListViewModel : NSObject
/** 根据UI */
/** 获取标题 */
- (NSString *)getAlbumTitleWithIndex: (NSInteger)index;
/** 获取图片1 */
- (NSURL *)getAlbumFirstWithIndex: (NSInteger)index;
/** 获取图片2 */
- (NSURL *)getAlbumSecondWithIndex: (NSInteger)index;
/** 获取图片3 */
- (NSURL *)getAlbumThirdWithIndex: (NSInteger)index;

/** 获取媒体 */
- (NSString *)getAlbumSrcWithIndex:(NSInteger)index;
/** 获取评论数 */
- (NSInteger)getAlbumCommentCountWithIndex: (NSInteger)index;
/** 根据Model  */
/** 图片列表 */
@property (nonatomic,strong) NSMutableArray<CNAlbumListDataModel *> *albumList;
/** 页数 */
@property (nonatomic,assign) NSInteger pageNumber;
/** 长度 */
@property (nonatomic,assign) NSInteger length;
/** 获取数据 */
- (void)getAlbumListWithRequestMode: (RequestMode)requestMode completionHandler: (void(^)(NSError *error))completionHandler;

@end
