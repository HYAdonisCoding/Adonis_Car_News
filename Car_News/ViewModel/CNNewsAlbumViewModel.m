//
//  CNNewsAlbumViewModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNNewsAlbumViewModel.h"

@implementation CNNewsAlbumViewModel

- (NSArray *)getAllAlbums {
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<self.albumList.count; i++) {
        [array addObject:self.albumList[i].imageUrl];
    }
    return array;
}
- (NSArray *)getAllDescriptions {
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<self.albumList.count; i++) {
        [array addObject:self.albumList[i].content];
    }
    return array;
}
- (NSMutableArray<CNNewsAlbumDataAlbumsModel *> *)albumList {
    if (!_albumList) {
        _albumList = [NSMutableArray array];
    }
    return _albumList;
}
- (void)getNewsDetailAlbumsWithNewsId:(NSInteger)newsId LastModify:(NSString *)lastModify completionHandler:(void (^)(NSError *))completionHandler {
    [CNNetManager getNewsDetailAlbumWithNewsId:newsId lastModify:lastModify CompletionHandler:^(CNNewsAlbumModel *model, NSError *error) {
        if (!error) {
            [self.albumList addObjectsFromArray:model.data.albums];
        }
        completionHandler(error);
    }];
}

@end
