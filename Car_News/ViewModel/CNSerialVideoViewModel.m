//
//  CNSerislVideoViewModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNSerialVideoViewModel.h"

@implementation CNSerialVideoViewModel

- (NSMutableArray<CNSerialVideoDataListModel *> *)videoList {
    if (!_videoList) {
        _videoList = [NSMutableArray array];
    }
    return _videoList;
}
- (NSString *)getVideoTitleForIndex:(NSInteger)index {
    return self.videoList[index].Title;
}
- (NSString *)getVideoDurationForIndex:(NSInteger)index {
    return self.videoList[index].Duration;
}
- (NSString *)getVideoTotalVisitForIndex:(NSInteger)index {
    return [NSString stringWithFormat:@"%.1ld万",self.videoList[index].TotalVisit/1000];
}
- (NSURL *)getVideoCoverImageForIndex:(NSInteger)index {
    return [NSURL URLWithString:[self.videoList[index].ImageLink stringByReplacingOccurrencesOfString:@"{0}-{1}" withString:@"270-180"]];
}
- (void)getSerialVideoRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    NSInteger tmpPage = 1;
    NSInteger tmpLength = 20;
    if (requestMode == RequestModeMore) {
        tmpPage = _page + 1;
        tmpLength = tmpLength + 20;
    }
    [CNNetManager getSerialVideoWithPage:tmpPage andLength:tmpLength completionHandler:^(CNSerialVideoModel *model, NSError *error) {
        if (!error) {
            _page = tmpPage;
            _length = tmpLength;
            if (requestMode == RequestModeRefresh) {
                [self.videoList removeAllObjects];
            }
            [self.videoList addObjectsFromArray:model.data.list];
        }
        completionHandler(error);
    }];
}
@end
