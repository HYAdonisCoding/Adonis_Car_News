//
//  CNHotSearchModel.h
//  Car_News
//
//  Created by caohongyang on 16/4/28.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNHotSearchDataModel;
@interface CNHotSearchModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) NSArray<CNHotSearchDataModel *> *data;

@end
@interface CNHotSearchDataModel : NSObject

@property (nonatomic, assign) NSInteger sequence;

@property (nonatomic, assign) NSInteger pinyou;

@property (nonatomic, copy) NSString *serialId;

@property (nonatomic, copy) NSString *serialName;

@property (nonatomic, copy) NSString *price;

@end

