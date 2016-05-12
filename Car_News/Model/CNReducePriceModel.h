//
//  CNReducePriceModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/12.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNReducePriceDataModel,CNReducePriceDataListModel;
@interface CNReducePriceModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) CNReducePriceDataModel *data;

@end
@interface CNReducePriceDataModel : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<CNReducePriceDataListModel *> *list;

@end

@interface CNReducePriceDataListModel : NSObject

@property (nonatomic, assign) NSInteger NewsID;

@property (nonatomic, copy) NSString *EndDateTime;

@property (nonatomic, assign) CGFloat ReferPrice;

@property (nonatomic, copy) NSString *StoreState;

@property (nonatomic, assign) NSInteger DealerBizMode;

@property (nonatomic, assign) CGFloat ActPrice;

@property (nonatomic, assign) NSInteger SerialID;

@property (nonatomic, copy) NSString *CarName;

@property (nonatomic, copy) NSString *DealerName;

@property (nonatomic, assign) NSInteger PrePrice;

@property (nonatomic, assign) NSInteger RemainDay;

@property (nonatomic, copy) NSString *PreInfo;

@property (nonatomic, copy) NSString *SaleRegion;

@property (nonatomic, assign) NSInteger IsPresent;

@property (nonatomic, assign) NSInteger VendorID;

@property (nonatomic, assign) NSInteger Is4S;

@property (nonatomic, copy) NSString *NewsUrl;

@property (nonatomic, assign) NSInteger CityID;

@property (nonatomic, copy) NSString *UpdateTime;

@property (nonatomic, copy) NSString *CarImage;

@property (nonatomic, assign) NSInteger Discount;

@property (nonatomic, copy) NSString *CallCenterNumber;

@property (nonatomic, assign) NSInteger DealerID;

@property (nonatomic, assign) NSInteger CarID;

@property (nonatomic, copy) NSString *AlbumImage;

@property (nonatomic, copy) NSString *StartDateTime;

@property (nonatomic, assign) CGFloat FavPrice;

@property (nonatomic, assign) NSInteger ProvinceID;

@end

