//
//  CNCityListViewModel.m
//  Car_News
//
//  Created by caohongyang on 16/4/21.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCityListViewModel.h"

@implementation CNCityListViewModel

- (NSString *)getCityIdForIndex:(NSInteger)index {
    return [NSString stringWithFormat:@"%ld",self.cityList[index].cityId];
}
- (NSString *)getCityNameForIndex:(NSInteger)index {
    return self.cityList[index].cityName;
}
- (NSString *)getCityEngNameForIndex:(NSInteger)index {
    return  self.cityList[index].engName;
}
- (NSMutableArray<CNCityListDataListModel *> *)cityList {
    if (!_cityList) {
        _cityList = @[].mutableCopy;
    }
    return _cityList;
}
- (void)getCityListCompletionHandler:(void (^)(NSError *))completionHandler {
    [CNNetManager getCityListCompletionHandler:^(CNCityListDataModel *model, NSError *error) {
        if (!error) {
            [self.cityList addObjectsFromArray:model.list];
        } else {
            MYLog(@"解析过程中:%@",error.userInfo);
        }
        completionHandler(error);
    }];
}
@end
