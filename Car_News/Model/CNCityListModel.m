//
//  CNCityListModel.m
//  Car_News
//
//  Created by caohongyang on 16/4/21.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCityListModel.h"

@implementation CNCityListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data":[CNCityListDataModel class]};
}

@end

@implementation CNCityListDataModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list":[CNCityListDataListModel class]};
}

@end

@implementation CNCityListDataListModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"engName": @"EngName", @"cityLevel": @"CityLevel", @"parentId": @"ParentId", @"cityId": @"CityId", @"cityName": @"CityName"};
}

@end


