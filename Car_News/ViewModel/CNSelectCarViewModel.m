//
//  SelectCarViewModel.m
//  AutoNews
//
//  Created by caohongyang on 16/4/4.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNSelectCarViewModel.h"

@implementation CNSelectCarViewModel
#pragma mark -- HotMaster
- (NSInteger)rowNumberOfHotMaster{
    return self.hotMaster.count;
}

- (NSURL *)hotMasterIconURLForIndex:(NSInteger)index{
    return [NSURL URLWithString:self.hotMaster[index].picURL];
}
- (NSString *)hotMasterTitleForIndex:(NSInteger)index{
    return self.hotMaster[index].masterName;
}
- (NSMutableArray<SelectCarHotMasterModel *> *)hotMaster{
    if (!_hotMaster) {
        _hotMaster = [NSMutableArray new];
    }
    return _hotMaster;
}
- (void)getMasterSelectWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completoinHandler{
    NSInteger tmpPage = 1;
    if (requestMode == RequestModeMore) {
        tmpPage = _masterPageNumber + 1;
    }
    [CNNetManager getSelectCarWithPage:tmpPage completionHandler:^(SelectCarDataModel *model, NSError *error) {
        if (!error) {
            _masterPageNumber = tmpPage;
            if (requestMode == RequestModeRefresh) {
                [self.hotMaster removeAllObjects];
            }
            [self.hotMaster addObjectsFromArray:model.hotMaster];
        }
        completoinHandler(error);
    }];
}

#pragma mark -- HotSerial
- (NSString *)hotSerialPriceForIndex:(NSInteger)index{
    return self.hotSerial[index].price;
}
- (NSString *)hotSerialTitleForIndex:(NSInteger)index{
    return self.hotSerial[index].serialName;
}
- (NSURL *)hotSerialIconURLForIndex:(NSInteger)index {
    return [NSURL URLWithString:self.hotSerial[index].picURL];
}

- (NSMutableArray<SelectCarHotSerialModel *> *)hotSerial{
    if (!_hotSerial) {
        _hotSerial = [NSMutableArray new];
    }
    return _hotSerial;
}

- (void)getSerialSelectWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completoinHandler{
    NSInteger tmpPage = 1;
    if (requestMode == RequestModeMore) {
        tmpPage = _serialPageNumber + 1;
    }
    [CNNetManager getSelectCarWithPage:tmpPage completionHandler:^(SelectCarDataModel *model, NSError *error) {
        if ((!error)) {
            _serialPageNumber = tmpPage;
            if (requestMode == RequestModeRefresh) {
                [self.hotSerial removeAllObjects];
            }
            [self.hotSerial addObjectsFromArray:model.hotSerial];
        }
        completoinHandler(error);
    }];
}
#pragma mark -- 车型列表
- (NSURL *)logoURLOfCarForIndex:(NSInteger)index {
    return [NSURL URLWithString:self.carsList[index].logoUrl];
}
- (NSString *)nameOfCarForIndex:(NSInteger)index {
    return self.carsList[index].name;
}
- (NSString *)initialOfCarForIndex:(NSInteger)index {
    return self.carsList[index].initial;
}
- (NSMutableArray<CarsListDataModel *> *)carsList {
    if (!_carsList) {
        _carsList = [NSMutableArray array];
    }
    return _carsList;
}
/** 请求列表 */
- (void)getCarslistCompetionHandler:(void (^)(NSError *))completionHandler {
    [CNNetManager getCarsListCompletionHandler:^(CNCarsListModel *model, NSError *error) {
        if (!error) {
            [self.carsList addObjectsFromArray:model.data];
        }
        completionHandler(error);
    } ];
}
@end
