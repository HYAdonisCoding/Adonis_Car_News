//
//  CNDetailTalkAboutModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/5.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNDetailTalkAboutModel.h"

@implementation CNDetailTalkAboutModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data":[CNDetailTalkAboutDataModel class]};
}
@end
@implementation CNDetailTalkAboutDataModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data":[CNDetailTalkAboutDataContentModel class], @"shareData":[CNDetailTalkAboutDataShareDataModel class],@"user":[CNDetailTalkAboutDataUserModel class]};
}
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"carSerialData": @"carserialData", @"subsNewsId": @"subsnewsid"};
}
@end


@implementation CNDetailTalkAboutDataShareDataModel

@end


@implementation CNDetailTalkAboutDataUserModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"selfMedia":[CNDetailTalkAboutDataUserSelfMediaModel class], @"identity":[CNDetailTalkAboutDataUserIdentityModel class]};
}
@end


@implementation CNDetailTalkAboutDataUserIdentityModel

@end


@implementation CNDetailTalkAboutDataUserSelfMediaModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"Id": @"id"};
}
@end


@implementation CNDetailTalkAboutDataContentModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"style":[CNDetailTalkAboutDataContentStyleModel class]};
}
@end


@implementation CNDetailTalkAboutDataContentStyleModel

@end


