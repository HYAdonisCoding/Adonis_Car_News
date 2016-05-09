//
//  SelectCarModel.h
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SelectCarDataModel,SelectCarHotMasterModel,SelectCarHotSerialModel;
@interface CNSelectCarModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) SelectCarDataModel *data;

@end
@interface SelectCarDataModel : NSObject

@property (nonatomic, strong) NSArray<SelectCarHotMasterModel *> *hotMaster;

@property (nonatomic, strong) NSArray<SelectCarHotSerialModel *> *hotSerial;

@end

@interface SelectCarHotMasterModel : NSObject

@property (nonatomic, assign) NSInteger sequence;

@property (nonatomic, copy) NSString *masterName;

@property (nonatomic, copy) NSString *masterId;
//pic_url->picURL
@property (nonatomic, copy) NSString *picURL;

@property (nonatomic, copy) NSString *pinyou;
//img_size->imgSize
@property (nonatomic, copy) NSString *imgSize;

@end

@interface SelectCarHotSerialModel : NSObject

@property (nonatomic, copy) NSString *pinyou;

@property (nonatomic, assign) NSInteger sequence;
//pic_url->picURL
@property (nonatomic, copy) NSString *picURL;
//img_size->imgSize
@property (nonatomic, copy) NSString *imgSize;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *serialName;

@property (nonatomic, copy) NSString *serialId;

@end

