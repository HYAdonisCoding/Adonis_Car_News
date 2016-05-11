//
//  CNArticleContentModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNArticleContentModel.h"

@implementation CNArticleContentModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data":[CNArticleContentDataModel class]};
}
@end
@implementation CNArticleContentDataModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"content":[CNArticleContentDataModelContentModel class],@"shareData":[CNArticleContentDataModelShareDataModel class],@"carserialData":[CNArticleContentDataModelCarserialDataModel class]};
}
@end


@implementation CNArticleContentDataModelShareDataModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"forums":[CNArticleContentDataModelShareDataForumsModel class]};
}
@end


@implementation CNArticleContentDataModelShareDataForumsModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"Id": @"id"};
}
@end


@implementation CNArticleContentDataModelContentModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"style":[CNArticleContentDataModelContentStyleModel class]};
}

@end

@implementation CNArticleContentDataModelContentStyleModel

@end

@implementation CNArticleContentDataModelCarserialDataModel

@end


