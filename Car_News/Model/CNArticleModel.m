//
//  CNArticleModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNArticleModel.h"

@implementation CNArticleModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data":[CNArticleDataModel class]};
}
@end
@implementation CNArticleDataModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"list":[CNArticleDataListModel class]};
}
@end


@implementation CNArticleDataListModel

@end


