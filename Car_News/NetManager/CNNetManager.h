//
//  DPNetManager.h
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPRequest.h"
#import "CNNewsListModel.h"
#import "CNSelectCarModel.h"
#import "CNDetailNewsModel.h"
#import "CNNewsAdvertisementModel.h"
#import "CNCarsListModel.h"
#import "CNSerialModel.h"
#import "CNCarRankingModel.h"
#import "CNCityListModel.h"
#import "CNBrandIntroductionModel.h"
#import "CNNewCarModel.h"
#import "CNCarSearchModel.h"
#import "CNHotSearchModel.h"
#import "CNAlbumListModel.h"
#import "CNNewsAlbumModel.h"
#import "CNDetailTalkAboutModel.h"
#import "CNCarVideoModel.h"
#import "CNSerialVideoModel.h"
#import "CNTransferInfo.h"

@interface CNNetManager : NSObject

/** 用于请求图片资源列表 */
+ (void)getNewsAlbumListWithPage: (NSInteger)page andLength: (NSInteger)length completionHandler: (void(^)(CNAlbumListModel *model, NSError *error))completionHandler;
/** 用于请求新闻视频数据 */
+ (void)getCarVideoListWithPageIndex: (NSInteger)pageIndex andPageIndex: (NSInteger)pageSize completionHandler: (void(^)(CNCarVideoModel *model, NSError *error))completionHandler;
/** 用于请求车系视频数据 */
+ (void)getSerialVideoWithPage: (NSInteger)page andLength: (NSInteger)length completionHandler: (void(^)(CNSerialVideoModel *model, NSError *error))completionHandler;
/** 用于请求数据 categoryid: 1评测 2导购 3新车 */
+ (void)getCarEvaluatingWithPageSize: (NSInteger)pageSize andPageIndex: (NSInteger)pageIndex andCategoryId: (NSInteger)categoryId completionHandler: (void(^)(NewsListDataModel *model, NSError *error))completionHandler;;
/** 用于请求图片新闻详情 */
+ (void)getNewsDetailAlbumWithNewsId: (NSInteger)newsId lastModify: (NSString *)lastModify CompletionHandler: (void(^)(CNNewsAlbumModel *model,NSError *error))complteionHandler;
/** 用于请求搜索 */
+ (void)getCarSearchWithKeyword: (NSString *)keyword andPage: (NSInteger)page andSize: (NSInteger)size completionHandler: (void(^)(CNCarSearchModel *model, NSError *error))completionHandler;
/** 用于请求热门搜索 */
+ (void)getHotSearchCompletionHandler: (void(^)(CNHotSearchModel *model, NSError *error))completionHandler;
/** 用于请求上市新车 */
+ (void)getNewCarConpletionHandler: (void(^)(CNNewCarModel *model, NSError *error))conpletionHandler;
/** 用于请求品牌历史 */
+ (void)getBrandIntroductionWithMasterId: (NSInteger)masterId CompletionHandler: (void(^)(CNBrandIntroductionDataModel *model, NSError *error))completionHandler;
/** 用于请求城市列表 */
+ (void)getCityListCompletionHandler: (void(^)(CNCityListDataModel *model, NSError *error))completionHandler;
/** 用于请求汽车销量排行 */
+ (void)getCarRankingWithMonth: (NSString *)month andCarLevel: (NSInteger)carLevel andCityId: (NSInteger)cityId andPage: (NSInteger)page completionHandler: (void(^)(CNCarRankingDataModel *model, NSError *error))completionHandler;

/** 用于请求新闻列表  参数: 页数*/
+ (void)getNewsWithPage: (NSInteger)page completionHandler: (void(^)(NewsListDataModel *model, NSError *error))completionHandler;
/** 车系列表 */
+ (void)getCarSerialListWithMasterId: (NSInteger)masterId CompletionHandler: (void(^)(CNSerialModel *model,NSError *error))completionHandler;
/** 新闻详情 */
+ (void)getDetailNewsWithNewsID: (NSInteger)ID lastModify: (NSString *)lastModify completionHandler: (void(^)(DetailNewsDataModel *model, NSError *error))completionHandler;
/** 请求说车详情 */
+ (void)getDetailTalkAboutCarWithNewsID: (NSInteger)ID categoryId: (NSInteger)categoryId completionHandler: (void(^)(CNDetailTalkAboutModel *model, NSError *error))completionHandler;
+ (void)getSelectCarWithPage: (NSInteger)page completionHandler: (void(^)(SelectCarDataModel *model, NSError *error))completionHandler;
/** 请求广告轮换信息 */
+ (void)getNewsAdvertiseWithPage:(NSInteger)page andLength: (NSInteger)length CompletionHandler: (void(^)(NewsAdvertisementDataModel *model, NSError *error))completionHandler;
/** 请求车型列表 */
+ (void)getCarsListCompletionHandler: (void(^)(CNCarsListModel *model, NSError *error))completioinHandler;
@end
