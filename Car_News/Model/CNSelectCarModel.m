//
//  SelectCarModel.m
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNSelectCarModel.h"

@implementation CNSelectCarModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"data":[SelectCarDataModel class]};
}
@end
@implementation SelectCarDataModel
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"hotMaster":[SelectCarHotMasterModel class], @"hotSerial":[SelectCarHotSerialModel class]};
}
@end


@implementation SelectCarHotMasterModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"picURL": @"pic_url", @"imgSize": @"img_size"};
}
@end


@implementation SelectCarHotSerialModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"picURL": @"pic_url", @"imgSize": @"img_size"};
}
@end


