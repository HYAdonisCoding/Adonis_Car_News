//
//  NewsListModel.m
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNNewsListModel.h"

@implementation CNNewsListModel

@end
@implementation NewsListDataModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"list":[NewsListListModel class]};
}
@end


@implementation NewsListListModel

@end


