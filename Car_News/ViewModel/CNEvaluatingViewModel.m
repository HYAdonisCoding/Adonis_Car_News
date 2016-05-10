//
//  CNEvaluatingViewModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/3.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNEvaluatingViewModel.h"

@implementation CNEvaluatingViewModel
- (NSString *)getEvaluatingTitleForIndex:(NSInteger)index {
    return self.newsList[index].title;
}
- (NSInteger)getEvaluatingNewsIDForIndex:(NSInteger)index {
    return self.newsList[index].newsId;
}
- (NSURL *)getEvaluatingIconURLForIndex:(NSInteger)index {
    return [NSURL URLWithString:[self.newsList[index].picCover stringByReplacingOccurrencesOfString:@"{0}-{1}" withString:@"270-180"]];
}
- (NSString *)getEvaluatingMediaNameForIndex:(NSInteger)index {
    return self.newsList[index].publishTime;
}
- (NSString *)getEvaluatingCommentNumberForIndex:(NSInteger)index {
    return [NSString stringWithFormat:@"%ld",self.newsList[index].commentCount];
}
- (NSMutableArray<NewsListDataListModel *> *)newsList {
    if (!_newsList) {
        _newsList = [NSMutableArray array];
    }
    return _newsList;
}
- (void)getNewsWithRequestMode:(RequestMode)requestMode andCategoryId:(NSInteger)categoryId completionHandler:(void (^)(NSError *))completoinHandler {
    NSInteger tmpPageSize = 20;
    NSInteger tmpPageIndex = 1;
    if (requestMode == RequestModeMore) {
        tmpPageSize = _rowNumber + 20;
        tmpPageIndex = _pageNumber + 1;
    }/** 用于请求数据 categoryid: 1评测 2导购 3新车 */
    [CNNetManager getCarEvaluatingWithPageSize:tmpPageSize andPageIndex:tmpPageIndex andCategoryId:categoryId completionHandler:^(NewsListDataModel *model, NSError *error) {
        if (!error) {
            _pageNumber = tmpPageIndex;
            _rowNumber = tmpPageSize;
            if (requestMode == RequestModeRefresh) {
                [self.newsList removeAllObjects];
            }
            [self.newsList addObjectsFromArray:model.list];
            //MYLog(@"%@",self.newsList);
        }
        completoinHandler(error);
    }];
}
@end
