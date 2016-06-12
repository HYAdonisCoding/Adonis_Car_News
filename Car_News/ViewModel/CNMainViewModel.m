//
//  MainViewModel.m
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNMainViewModel.h"

@implementation CNMainViewModel
- (NSInteger)rowNumber{
    return self.newsList.count;
}
- (NSURL *)iconURLForIndex:(NSInteger)index{
    return [NSURL URLWithString:self.newsList[index].picCover];
}
- (NSString *)titleForIndex:(NSInteger)index{
    return self.newsList[index].title;
}
- (NSString *)mediaNameForIndex:(NSInteger)index{
    return self.newsList[index].mediaName;
}
- (NSString *)commentNumberForIndex:(NSInteger)index{
    return [NSString stringWithFormat:@"%ld",self.newsList[index].commentCount];
}
- (NSInteger)newsIDForIndex:(NSInteger)index{
    return self.newsList[index].newsId;
}
- (NSMutableArray<NewsListDataListModel *> *)newsList{
    if (!_newsList) {
        _newsList = [NSMutableArray new];
    }
    return _newsList;
}
- (void)getNewsWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completoinHandler{
    NSInteger tmpPage = 1;
    if (requestMode == RequestModeMore) {
        tmpPage = _pageNumber + 1;
    }
    [CNNetManager getNewsWithPage:tmpPage completionHandler:^(NewsListDataModel *model, NSError *error) {
        if (!error) {
            _pageNumber = tmpPage;
            if (requestMode == RequestModeRefresh) {
                [self.newsList removeAllObjects];
            }
            [self.newsList addObjectsFromArray:model.list];
        }
        completoinHandler(error);
    }];
}
@end
