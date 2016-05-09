//
//  CNNewsAlbumListViewModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNNewsAlbumListViewModel.h"

@implementation CNNewsAlbumListViewModel

- (NSArray *)getArrayFromString: (NSString *)string {
    return [string componentsSeparatedByString:@";"];
}
- (NSURL *)getAlbumFirstWithIndex:(NSInteger)index {
    NSString *str = self.albumList[index].picCover;
    NSArray *array = [self getArrayFromString:str];
    if (array.count <= 0) {
        return nil;
    }
    return [NSURL URLWithString:array[0]];
}
- (NSURL *)getAlbumSecondWithIndex:(NSInteger)index {
    NSString *str = self.albumList[index].picCover;
    NSArray *array = [self getArrayFromString:str];
    if (array.count <= 1) {
        return nil;
    }
    return [NSURL URLWithString:array[1]];
}
- (NSURL *)getAlbumThirdWithIndex:(NSInteger)index {
    NSString *str = self.albumList[index].picCover;
    NSArray *array = [self getArrayFromString:str];
    if (array.count <= 2) {
        return nil;
    }
    return [NSURL URLWithString:array[2]];
}
- (NSString *)getAlbumTitleWithIndex:(NSInteger)index {
    return self.albumList[index].title;
}
- (NSString *)getAlbumSrcWithIndex:(NSInteger)index {
    return self.albumList[index].src;
}
- (NSInteger)getAlbumCommentCountWithIndex:(NSInteger)index {
    return self.albumList[index].commentCount;
}
- (NSMutableArray<CNAlbumListDataModel *> *)albumList {
    if (!_albumList) {
        _albumList = [NSMutableArray array];
    }
    return _albumList;
}
- (void)getAlbumListWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    NSInteger tmpPage = 1;
    NSInteger tmpLength = 20;
    if (requestMode == RequestModeMore) {
        tmpPage = _pageNumber + 1;
        tmpLength = _length + 20;
    }
    [CNNetManager getNewsAlbumListWithPage:tmpPage andLength:tmpLength completionHandler:^(CNAlbumListModel *model, NSError *error) {
        if (!error) {
            _pageNumber = tmpPage;
            _length = tmpLength;
            if (requestMode == RequestModeRefresh) {
                [self.albumList removeAllObjects];
            }
            [self.albumList addObjectsFromArray:model.data];
        }
        completionHandler(error);
    }];
}
@end
