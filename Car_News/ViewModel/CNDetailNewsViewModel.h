//
//  DetailNewsViewModel.h
//  AutoNews
//
//  Created by caohongyang on 16/4/10.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

//typedef NS_ENUM(NSUInteger, RequestMode) {
//    RequestModeRefresh,
//    RequestModeMore,
//};

@interface CNDetailNewsViewModel : NSObject

/** 根据UI */
/** 网址 */
@property (nonatomic,strong) NSString *detailNewsURL;
/** 新闻正文 图片 */
- (NSString *)newsTextOrPictureForIndex: (NSInteger)index;

/** 根据Model */
/** 新闻行数 */
@property (nonatomic,strong) NSMutableArray<DetailNewsDataContentModel *> *newsLine;
- (void)getDetailNewsURLWithNewsListlistModel: (NewsListListModel *)model RequestMode: (RequestMode)requestMode completionHandler:(void(^)(NSError *error,id resobject))completoinHandler;


@end
