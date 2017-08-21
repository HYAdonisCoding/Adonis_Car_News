//
//  CNCarVideoModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/9.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCarVideoModel.h"

@implementation CNCarVideoModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data":[CNCarVideoDataModel class]};
}

@end

@implementation CNCarVideoDataModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list":[CNCarVideoDataListModel class]};
}

@end


@implementation CNCarVideoDataListModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"commentCount": @"commentcount", @"totalVisit": @"totalvisit",@"publishTime": @"publishtime", @"sourceName": @"sourcename",@"mp4Link": @"mp4link", @"videoId": @"videoid",@"coverImg": @"coverimg", @"modifyTime": @"modifytime"};
}
@end


