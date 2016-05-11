//
//  CNArticleContentViewModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

@interface CNArticleContentViewModel : NSObject

/** 数据 */
@property (nonatomic,strong) NSMutableArray<CNArticleContentDataModelContentModel *> *contentList;
- (NSString *)getArticleContentTextAndURLForIndex: (NSInteger)index;
- (void)getArticleContentWithNewsId: (NSInteger)newsId LastModify: (NSString *)lastModify completionHandler: (void(^)(NSError *error))completionHandler;

@end
