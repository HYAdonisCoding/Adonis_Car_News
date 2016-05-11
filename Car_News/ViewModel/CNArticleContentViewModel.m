//
//  CNArticleContentViewModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNArticleContentViewModel.h"

@implementation CNArticleContentViewModel

- (NSMutableArray<CNArticleContentDataModelContentModel *> *)contentList {
    if (!_contentList) {
        _contentList = [NSMutableArray array];
    }
    return _contentList;
}
- (NSString *)getArticleContentTextAndURLForIndex:(NSInteger)index {
    return self.contentList[index].content;
}
- (void)getArticleContentWithNewsId:(NSInteger)newsId LastModify:(NSString *)lastModify completionHandler:(void (^)(NSError *))completionHandler {
    [CNNetManager getSerialArticleContentWithNewsId:newsId lastModify:lastModify completionHandler:^(CNArticleContentModel *model, NSError *error) {
        if (!error) {
            [self.contentList addObjectsFromArray:model.data.content];
        }
        completionHandler(error);
    }];
}
@end
