//
//  CNSerialModel.m
//  Car_News
//
//  Created by caohongyang on 16/4/17.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNSerialModel.h"

@implementation CNSerialModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"data":[CNSerialDataModel class]};
}
@end
@implementation CNSerialDataModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"serialList":[CNSerialDataSerialListModel class]};
}
@end


@implementation CNSerialDataSerialListModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"picture":@"Picture"};
}
@end


