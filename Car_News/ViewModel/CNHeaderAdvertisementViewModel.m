//
//  HeaderAdvertisementViewModel.m
//  AutoNews
//
//  Created by caohongyang on 16/4/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNHeaderAdvertisementViewModel.h"

@implementation CNHeaderAdvertisementViewModel
- (NSURL *)advertisementIconForIndex:(NSInteger)index {
    return [NSURL URLWithString:self.advertisementNumber[index].picCover];
}
- (NSString *)advertisementTitleForIndex:(NSInteger)index {
    return self.advertisementNumber[index].title;
}
- (NSString *)advertisementMediaNameForIndex:(NSInteger)index {
    return self.advertisementNumber[index].src;
}
- (NSString *)advertisementCommentNumberForIndex:(NSInteger)index {
    return [NSString stringWithFormat:@"%ld",self.advertisementNumber[index].commentCount];
}
- (NSMutableArray<NewsAdvertisementDataListModel *> *)advertisementNumber {
    if (!_advertisementNumber) {
        _advertisementNumber = [NSMutableArray array];
    }
    return _advertisementNumber;
}
- (void)getNewsAdvertisementDataListWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *error,id resObject))completoinHandler {
    NSInteger tmpPage = 1;
    NSInteger tmpLength = 20;
    if (requestMode == RequestModeMore) {
        tmpPage = _pageNumber + 1;
        tmpLength = _pageLength + 20;
    }
    [CNNetManager getNewsAdvertiseWithPage:tmpPage andLength: tmpLength CompletionHandler:^(NewsAdvertisementDataModel *model, NSError *error) {
        if (!error) {
            _pageNumber = tmpPage;
            _pageLength = tmpLength;
            if (requestMode == RequestModeRefresh) {
                [self.advertisementNumber removeAllObjects];
            }
            [self.advertisementNumber addObjectsFromArray:model.list];
            completoinHandler(nil,self.advertisementNumber);
            return ;
        }
        completoinHandler(error,nil);
    }];
}


@end
