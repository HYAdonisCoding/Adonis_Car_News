//
//  CNNewCarViewModel.m
//  Car_News
//
//  Created by caohongyang on 16/4/28.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNNewCarViewModel.h"

@implementation CNNewCarViewModel

/** 获取汽车名称 */
- (NSString *)getCarNameForIndex: (NSInteger)index {
    return self.carList[index].showName;
}
/** 获取汽车价格 */
- (NSString *)getCarPriceForIndex: (NSInteger)index {
    return self.carList[index].price;
}
/** 获取汽车图片 */
- (NSURL *)getCarImageForIndex: (NSInteger)index {
    return [NSURL URLWithString:self.carList[index].img];
}
- (NSMutableArray<CNNewCarDataModel *> *)carList {
    if (!_carList) {
        _carList = [NSMutableArray array];
    }
    return _carList;
}
/** 获取数据 */
- (void)getNewCarCompletionHandler: (void(^)(NSError *error))completionHandler {
    [CNNetManager getNewCarConpletionHandler:^(CNNewCarModel *model, NSError *error) {
        if (!error) {
            [self.carList addObjectsFromArray:model.data];
        }
        completionHandler(error);
    }];
}
@end
