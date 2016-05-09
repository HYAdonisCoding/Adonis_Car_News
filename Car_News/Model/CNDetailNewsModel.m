//
//  DetailNewsModel.m
//  AutoNews
//
//  Created by caohongyang on 16/4/5.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNDetailNewsModel.h"

@implementation CNDetailNewsModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"data":[DetailNewsDataModel class]};
}
@end
/** -------------------------------------------------------------------------------- */




@implementation DetailNewsDataModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"user":[DetailNewsDataUserModel class],@"shareData":[DetailNewsDataShareDataModel class],@"content":[DetailNewsDataContentModel class]};
}
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"newsType":@"newstype",@"subsNewsId":@"subsnewsid"};
}
@end


@implementation DetailNewsDataShareDataModel

@end


@implementation DetailNewsDataUserModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"selfMedia":[DetailNewsDataUserSelfMediaModel class],@"identity":[DetailNewsDataUserIdentityModel class]};
}
@end


@implementation DetailNewsDataUserIdentityModel

@end


@implementation DetailNewsDataUserSelfMediaModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end


@implementation DetailNewsDataContentModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"style":[DetailNewsDataContentStyleModel class]};
}
@end


@implementation DetailNewsDataContentStyleModel

@end


