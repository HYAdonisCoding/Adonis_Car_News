//
//  CNSerialModel.h
//  Car_News
//
//  Created by caohongyang on 16/4/17.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNSerialDataModel,CNSerialDataSerialListModel;
@interface CNSerialModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) NSArray<CNSerialDataModel *> *data;

@end

@interface CNSerialDataModel : NSObject

@property (nonatomic, assign) NSInteger brandId;

@property (nonatomic, strong) NSArray<CNSerialDataSerialListModel *> *serialList;

@property (nonatomic, assign) BOOL foreign;

@property (nonatomic, copy) NSString *brandName;

@end

@interface CNSerialDataSerialListModel : NSObject

@property (nonatomic, assign) NSInteger uv;

@property (nonatomic, copy) NSString *dealerPrice;

@property (nonatomic, assign) NSInteger saleStatus;

@property (nonatomic, assign) NSInteger serialId;

@property (nonatomic, copy) NSString *serialName;
//Picture->picture
@property (nonatomic, copy) NSString *picture;

@end

