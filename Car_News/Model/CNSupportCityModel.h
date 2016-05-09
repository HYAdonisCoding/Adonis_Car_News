//
//  SupportCityModel.h
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SupportCityDataModel,SupportCityCitylistModel;
@interface CNSupportCityModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) SupportCityDataModel *data;

@end
@interface SupportCityDataModel : NSObject

@property (nonatomic, strong) NSArray<SupportCityCitylistModel *> *cityList;

@end

@interface SupportCityCitylistModel : NSObject

@property (nonatomic, assign) NSInteger CityID;

@property (nonatomic, copy) NSString *CityDomain;

@property (nonatomic, assign) NSInteger AreaOrder;

@property (nonatomic, copy) NSString *CityName;

@property (nonatomic, assign) NSInteger Order;

@property (nonatomic, assign) NSInteger IsCharge;

@property (nonatomic, assign) NSInteger Commission;

@property (nonatomic, copy) NSString *Area;

@end

