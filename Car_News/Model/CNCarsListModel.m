//
//  CarsListModel.m
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCarsListModel.h"

@implementation CNCarsListModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"data":[CarsListDataModel class]};
}
@end



@implementation CarsListDataModel

@end


