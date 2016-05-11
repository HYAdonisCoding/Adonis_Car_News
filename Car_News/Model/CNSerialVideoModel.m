//
//  CNSerialVideoModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNSerialVideoModel.h"

@implementation CNSerialVideoModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data":[CNSerialVideoDataModel class]};
}
@end
@implementation CNSerialVideoDataModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"list":[CNSerialVideoDataListModel class]};
}
@end


@implementation CNSerialVideoDataListModel

@end


