//
//  SelectCarViewModel.h
//  AutoNews
//
//  Created by caohongyang on 16/4/4.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

//typedef NS_ENUM(NSUInteger, RequestMode) {
//    RequestModelRefresh,
//    RequestModeMore,
//};

@interface CNSelectCarViewModel : NSObject
/** 根据UI */
//热门推荐
@property (nonatomic,assign) NSInteger rowNumberOfHotMaster;
- (NSURL *)hotMasterIconURLForIndex: (NSInteger)index;
- (NSString *)hotMasterTitleForIndex: (NSInteger)index;
//条件选车
@property (nonatomic,assign) NSInteger rowNumberOfHotSerial;
- (NSURL *)hotSerialIconURLForIndex: (NSInteger)index;
- (NSString *)hotSerialTitleForIndex: (NSInteger)index;
- (NSString *)hotSerialPriceForIndex: (NSInteger)index;
//车型列表
/** 车型数量 */
@property (nonatomic,assign) NSInteger allCarsNumber;
- (NSURL *)logoURLOfCarForIndex: (NSInteger)index;
- (NSString *)nameOfCarForIndex: (NSInteger)index;
- (NSString *)initialOfCarForIndex: (NSInteger)index;

/** 根据Model */
//热门推荐
@property (nonatomic,strong) NSMutableArray<SelectCarHotMasterModel *> *hotMaster;
@property (nonatomic,assign) NSInteger masterPageNumber;
- (void)getMasterSelectWithRequestMode: (RequestMode)requestMode completionHandler:(void(^)(NSError *error))completoinHandler;
/** 条件选车 */
@property (nonatomic,strong) NSMutableArray<SelectCarHotSerialModel *> *hotSerial;
@property (nonatomic,assign) NSInteger serialPageNumber;
- (void)getSerialSelectWithRequestMode: (RequestMode)requestMode completionHandler:(void(^)(NSError *error))completoinHandler;
/** 车型列表 */
/** 车型数组 */
@property (nonatomic,strong) NSMutableArray<CarsListDataModel *> *carsList;
- (void)getCarslistCompetionHandler: (void(^)(NSError *error))completionHandler;
@end
