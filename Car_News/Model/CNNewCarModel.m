//
//  CNNewCarModel.m
//  Car_News
//
//  Created by caohongyang on 16/4/28.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNNewCarModel.h"

@interface CNNewCarModel() <YYModel>

@end

@implementation CNNewCarModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data":[CNNewCarDataModel class]};
}
@end
@implementation CNNewCarDataModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"masterBrandId": @"MasterBrandId", @"csId": @"CSId", @"allSpell": @"AllSpell", @"price": @"Price", @"img": @"Img", @"showName": @"ShowName", @"level": @"Level"};
}
@end


