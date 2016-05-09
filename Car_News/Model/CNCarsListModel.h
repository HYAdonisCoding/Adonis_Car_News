//
//  CarsListModel.h
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CarsListDataModel;
@interface CNCarsListModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) NSArray<CarsListDataModel *> *data;

@end

@interface CarsListDataModel : NSObject

@property (nonatomic, copy) NSString *logoUrl;

@property (nonatomic, assign) NSInteger uv;

@property (nonatomic, assign) NSInteger masterId;

@property (nonatomic, assign) NSInteger saleStatus;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *initial;

@end

