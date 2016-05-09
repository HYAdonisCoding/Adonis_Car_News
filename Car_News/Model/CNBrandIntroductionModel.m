//
//  CNBrandIntroductionModel.m
//  Car_News
//
//  Created by caohongyang on 16/4/26.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNBrandIntroductionModel.h"

@interface CNBrandIntroductionModel() <YYModel>

@end

@implementation CNBrandIntroductionModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data":[CNBrandIntroductionDataModel class]};
}
@end

@implementation CNBrandIntroductionDataModel

@end


