//
//  CNArticleViewModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNArticleViewModel.h"

@implementation CNArticleViewModel

- (NSMutableArray<CNArticleDataListModel *> *)articleList {
    if (!_articleList) {
        _articleList = [NSMutableArray array];
    }
    return _articleList;
}
- (NSString *)getArticleTitleForIndex:(NSInteger)index {
    return self.articleList[index].title;
}
- (NSURL *)getArticleCoverImageForIndex:(NSInteger)index {
    return [NSURL URLWithString:[self.articleList[index].picCover stringByReplacingOccurrencesOfString:@"{0}-{1}" withString:@"270-180"]];
}
- (NSString *)getArticleCommentCountForIndex:(NSInteger)index {
    return [NSString stringWithFormat:@"%ld",self.articleList[index].commentCount];
}
- (NSString *)getArticlePublishTimeForIndex:(NSInteger)index {
    return self.articleList[index].publishTime;
}
- (void)getSerialVideoRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    NSInteger tmpPage = 1;
    NSInteger tmpLength = 20;
    if (requestMode == RequestModeMore) {
        tmpPage = _page + 1;
        tmpLength = _length + 20;
    }
    [CNNetManager getSerialArticleWithPage:tmpPage andLength:tmpLength completionHandler:^(CNArticleModel *model, NSError *error) {
        if (!error) {
            _page = tmpPage;
            _length = tmpLength;
            if (requestMode == RequestModeRefresh) {
                [self.articleList removeAllObjects];
            }
            [self.articleList addObjectsFromArray:model.data.list];
        }
        completionHandler(error);
    }];
}

@end
