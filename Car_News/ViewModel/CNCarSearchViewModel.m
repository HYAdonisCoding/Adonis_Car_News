//
//  CNCarSearchViewModel.m
//  Car_News
//
//  Created by caohongyang on 16/4/28.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCarSearchViewModel.h"

@implementation CNCarSearchViewModel

/** 获取汽车图片 */
- (NSURL *)getcarIconImageForIndex: (NSInteger)index {
    return [NSURL URLWithString:self.resultList[index].imgUrl];
}
/** 获取汽车名称 */
- (NSString *)getCarNameForIndex: (NSInteger)index{
    return self.resultList[index].title;
}
/** 获取汽车价格 */
- (NSString *)getCarPriceForIndex: (NSInteger)index {
    return [NSString stringWithFormat:@"%@",self.resultList[index].guidePrice];
}
/** 搜索结果 */
- (NSMutableArray<CNCarSearchCarlistModel *> *)resultList{
    if (!_resultList) {
        _resultList = [NSMutableArray array];
    }
    return _resultList;
}
/** 请求数据 */
- (void)geCarSearchWithRequestMode: (RequestMode)requestMode andKeyword: (NSString *)keyword completionHandler:(void(^)(NSError *error))completoinHandler {
    NSInteger tmpPage = 1;
    NSInteger tmpSize = 20;
    if (requestMode == RequestModeMore) {
        tmpPage = _page + 1;
        tmpSize = _size + 20;
    }
    [CNNetManager getCarSearchWithKeyword:keyword andPage:tmpPage andSize:tmpSize completionHandler:^(CNCarSearchModel *model, NSError *error) {
        if (!error) {
            _page = tmpPage;
            _size = tmpSize;
            if (requestMode == RequestModeRefresh) {
                [self.resultList removeAllObjects];
            }
            [self.resultList addObjectsFromArray:model.carList];
        }
        completoinHandler(error);
    }];
}

@end
