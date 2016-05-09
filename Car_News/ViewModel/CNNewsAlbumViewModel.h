//
//  CNNewsAlbumViewModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

@interface CNNewsAlbumViewModel : NSObject

/** 图片数组 */
- (NSArray *)getAllAlbums;
/** 文字介绍 */
- (NSArray *)getAllDescriptions;
/** 数据 */
@property (nonatomic,strong) NSMutableArray<CNNewsAlbumDataAlbumsModel *> *albumList;
/** 获取数据 */
- (void)getNewsDetailAlbumsWithNewsId: (NSInteger)newsId LastModify: (NSString *)lastModify completionHandler: (void(^)(NSError *error))completionHandler;

@end
