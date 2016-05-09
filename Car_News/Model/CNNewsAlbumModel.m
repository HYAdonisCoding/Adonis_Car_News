//
//  CNNewsAlbumModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNNewsAlbumModel.h"

@implementation CNNewsAlbumModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data":[CNNewsAlbumDataModel class]};
}
@end
@implementation CNNewsAlbumDataModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"albums":[CNNewsAlbumDataAlbumsModel class],@"shareToCheYou":[CNNewsAlbumDataShareToCheYouModel class]};
}
@end


@implementation CNNewsAlbumDataShareToCheYouModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"newsTitle": @"newstitle", @"newsImg": @"newsimg", @"newsId": @"newsid",@"newsLink":@"newslink"};
}
@end


@implementation CNNewsAlbumDataAlbumsModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID": @"id"};
}
@end


