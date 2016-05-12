//
//  CNReducePriceViewModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/12.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNReducePriceViewModel.h"


@implementation CNReducePriceViewModel

/** 获取车名 */
- (NSString *)getCarNameForIndex: (NSInteger)index {
    return self.priceList[index].CarName;
}
/** 获取当前价格 */
- (NSString *)getActPriceForIndex: (NSInteger)index {
    return [NSString stringWithFormat:@"%.2f万",self.priceList[index].ActPrice];
}
/** 获取原价格 */
- (NSString *)getReferPriceForIndex: (NSInteger)index {
    return [NSString stringWithFormat:@"%.2f万",self.priceList[index].ReferPrice];
}
/** 获取当前价格 */
- (NSString *)getFavPriceForIndex: (NSInteger)index {
    return [NSString stringWithFormat:@"%.2f万",self.priceList[index].FavPrice];
}
/** 获取4S店名称 */
- (NSString *)getDealerNameForIndex: (NSInteger)index {
    return self.priceList[index].DealerName;
}
/** 获取销售状态 */
- (NSString *)getStoreStateForIndex: (NSInteger)index {
    return self.priceList[index].StoreState;
}
/** 获取销售区域 */
- (NSString *)getSaleRegionForIndex: (NSInteger)index {
    return self.priceList[index].SaleRegion;
}
/** 获取销售电话 */
- (NSString *)getCallCenterNumberForIndex: (NSInteger)index {
    return self.priceList[index].CallCenterNumber;
}
- (NSMutableArray<CNReducePriceDataListModel *> *)priceList {
    if (!_priceList) {
        _priceList = [NSMutableArray array];
    }
    return _priceList;
}
- (void)getReducePriceDataWithSort:(NSInteger)sort andRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    NSInteger tmpPage = 1;
    NSInteger tmpLength = 20;
    if (requestMode == RequestModeMore) {
        tmpPage = _page + 1;
        tmpLength = _length + 20;
    }
    [CNNetManager getSerialReducePriceWithSort:sort andPage:tmpPage andLength:tmpLength completionHandler:^(CNReducePriceModel *model, NSError *error) {
        if (!error) {
            _page = tmpPage;
            _length = tmpLength;
            if (requestMode == RequestModeRefresh) {
                [self.priceList removeAllObjects];
            }
            [self.priceList addObjectsFromArray:model.data.list];
        }
        completionHandler(error);
    }];
}

@end
