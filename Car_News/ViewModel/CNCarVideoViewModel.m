//
//  CNCarVideoViewModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/9.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCarVideoViewModel.h"

@implementation CNCarVideoViewModel

- (NSString *)getVideoTitleForIndex:(NSInteger)index {
    return self.videoList[index].title;
}
- (NSString *)getVideoDurationForIndex:(NSInteger)index {
    return self.videoList[index].duration;
}
- (NSString *)getVideoSourceNameForIndex:(NSInteger)index {
    return self.videoList[index].sourceName;
}
- (NSString *)getVideoTotalVisitForIndex:(NSInteger)index {
    return [NSString stringWithFormat:@"%ld",self.videoList[index].totalVisit];
}
- (NSString *)getVideoCommentCountForIndex:(NSInteger)index {
    return [NSString stringWithFormat:@"%ld",self.videoList[index].commentCount];
}
- (NSURL *)getVideoCoverImageForIndex:(NSInteger)index {
    return [NSURL URLWithString:[self.videoList[index].coverImg stringByReplacingOccurrencesOfString:@"{0}-{1}" withString:@"470-380"]];
}
- (NSMutableArray<CNCarVideoDataListModel *> *)videoList {
    if (!_videoList) {
        _videoList = [NSMutableArray array];
    }
    return _videoList;
}
- (void)getCarVideoRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completoinHandler {
    NSInteger tmpPageSize = 20;
    NSInteger tmpPageIndex = 1;
    if (requestMode == RequestModeMore) {
        tmpPageSize = _pageSize + 20;
        tmpPageIndex = _pageIndex + 1;
    }
    [CNNetManager getCarVideoListWithPageIndex:tmpPageIndex andPageIndex:tmpPageSize completionHandler:^(CNCarVideoModel *model, NSError *error) {
        if (!error) {
            _pageIndex = tmpPageIndex;
            _pageSize = tmpPageSize;
            if (requestMode == RequestModeRefresh) {
                [self.videoList removeAllObjects];
            }
            [self.videoList addObjectsFromArray:model.data.list];
        }
        completoinHandler(error);
    }];
}

@end
