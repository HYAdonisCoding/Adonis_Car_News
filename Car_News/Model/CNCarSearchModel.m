//
//  CNCarSearchModel.m
//  Car_News
//
//  Created by caohongyang on 16/4/28.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCarSearchModel.h"

@implementation CNCarSearchModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"keyword": @"Keyword", @"resultCount": @"ResultCount", @"carList": @"CarList"};
}//, @"carList": @"CarList"
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"carList":[CNCarSearchCarlistModel class]};
}

@end
@implementation CNCarSearchCarlistModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"imgUrl": @"ImgUrl", @"csId": @"Csid", @"guidePrice": @"GuidePrice", @"csSaleStatus": @"CsSaleStatus", @"brandName": @"BrandName", @"csSpell": @"CsSpell", @"brandId": @"BrandId", @"title": @"Title", @"csLevel": @"CsLevel", @"refPrice": @"RefPrice"};
}

@end


