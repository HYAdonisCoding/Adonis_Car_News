//
//  CNHotSearchModel.m
//  Car_News
//
//  Created by caohongyang on 16/4/28.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNHotSearchModel.h"

@implementation CNHotSearchModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data":[CNHotSearchDataModel class]};
}
@end
@implementation CNHotSearchDataModel

@end


