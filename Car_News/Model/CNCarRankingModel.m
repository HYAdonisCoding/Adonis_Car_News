//
//  CNCarRankingModel.m
//  Car_News
//
//  Created by caohongyang on 16/4/19.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCarRankingModel.h"

@implementation CNCarRankingModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"data":[CNCarRankingDataModel class]};
}

@end
@implementation CNCarRankingDataModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"list":[CNCarRankingDataListModel class]};
}

@end


@implementation CNCarRankingDataListModel

@end


