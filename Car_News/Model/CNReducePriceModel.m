//
//  CNReducePriceModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/12.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNReducePriceModel.h"

@implementation CNReducePriceModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data":[CNReducePriceDataModel class]};
}
@end
@implementation CNReducePriceDataModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"list":[CNReducePriceDataListModel class]};
}
@end


@implementation CNReducePriceDataListModel

@end


