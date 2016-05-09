//
//  SupportCityModel.m
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNSupportCityModel.h"

@implementation CNSupportCityModel

@end
@implementation SupportCityDataModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"cityList":[SupportCityCitylistModel class]};
}
@end


@implementation SupportCityCitylistModel

@end


