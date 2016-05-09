//
//  NewsAdvertisementModel.m
//  AutoNews
//
//  Created by caohongyang on 16/4/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNNewsAdvertisementModel.h"

@implementation CNNewsAdvertisementModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"data":[NewsAdvertisementDataModel class]};
}
@end

@implementation NewsAdvertisementDataModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"list":[NewsAdvertisementDataListModel class]};
}

@end

@implementation NewsAdvertisementDataListModel



@end