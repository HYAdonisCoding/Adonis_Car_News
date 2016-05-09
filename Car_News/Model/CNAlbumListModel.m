//
//  CNAlbumListModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNAlbumListModel.h"

@interface CNAlbumListModel()

@end
@implementation CNAlbumListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data":[CNAlbumListDataModel class]};
}

@end
@implementation CNAlbumListDataModel

@end


