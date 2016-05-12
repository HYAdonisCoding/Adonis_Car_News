//
//  CNAlertViewModel.m
//  Car_News
//
//  Created by caohongyang on 16/4/17.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNAlertViewModel.h"

@implementation CNAlertViewModel

- (NSURL *)getIconURLForIndex:(NSInteger)index {
    NSString *picture = [self.serialList[index].picture stringByReplacingOccurrencesOfString:@"{0}" withString:@"3"];
    return [NSURL URLWithString: picture];
}
- (NSString *)getSerialNameForIndex:(NSInteger)index {
    return self.serialList[index].serialName;
}
- (NSString *)getDealerPriceForIndex:(NSInteger)index {
    return self.serialList[index].dealerPrice;
}

- (NSString *)getBrandNameForIndex:(NSInteger)index {
    NSString *brandName = self.data[index].brandName;
    return brandName;
}

- (NSMutableArray<CNSerialDataSerialListModel *> *)serialList {
    if (!_serialList) {
        _serialList = [NSMutableArray array];
    }
    return _serialList;
}
- (NSMutableArray<CNSerialDataModel *> *)data {
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
}
- (void)getSerialListWithMasterId:(NSInteger)masterId CompletionHandler:(void (^)(NSError *))completionHandler{
    [CNNetManager getCarSerialListWithMasterId:masterId CompletionHandler:^(CNSerialModel *model, NSError *error) {
        if (!error) {
            //self.data = [NSMutableArray array];
            for (NSInteger i=0; i<model.data.count; i++) {
                CNSerialDataModel *dataModel = model.data[i];
                [self.data addObject:dataModel];
                for (NSInteger j=0; j<dataModel.serialList.count; j++) {
                    CNSerialDataSerialListModel *listModel = dataModel.serialList[j];
                    [self.serialList addObject:listModel];
                    
                }
               
            }
            
        } else {
            MYLog(@"读取数据有误：%@",error.userInfo);
        }
        completionHandler(error);
    }];
}

@end
