//
//  DPNetManager.m
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNNetManager.h"

@implementation CNNetManager

/** 用于请求品牌历史 */
+ (void)getBrandIntroductionWithMasterId:(NSInteger)masterId CompletionHandler:(void (^)(CNBrandIntroductionDataModel *, NSError *))completionHandler {
    NSString *brandPath = @"http://api.ycapp.yiche.com/car/getmasterbrandstory";
    NSDictionary *params = @{@"masterid":@(masterId)};
    NSString *path = [DPRequest serializeURL:brandPath params:params];
    [self GET:path parameters:nil progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([CNBrandIntroductionDataModel parseJSON:reponseObj[@"data"]], error);
    }];
}
/** 用于请求图片资源列表 */
+ (void)getNewsAlbumListWithPage:(NSInteger)page andLength:(NSInteger)length completionHandler:(void (^)(CNAlbumListModel *, NSError *))completionHandler {
    NSString *albumPath = @"http://api.ycapp.yiche.com/AppNews/GetAppNewsAlbumList";
    NSDictionary *params = @{@"page":@(page), @"length":@(length),@"platform":@1};
    [self GET:albumPath parameters:params progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([CNAlbumListModel parseJSON:reponseObj], error);
    }];
}
/** 用于请求热门搜索 */
+ (void)getHotSearchCompletionHandler:(void (^)(CNHotSearchModel *, NSError *))completionHandler {
    NSString *hot = @"http://api.ycapp.yiche.com/yicheapp/getsearchpagead";
    NSDictionary *params = @{@"platform":@1};
    NSString *path = [DPRequest serializeURL:hot params:params];
    [self GET:path parameters:nil progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([CNHotSearchModel parseJSON:reponseObj], error);
    }];
}
/** 用于请求搜索 */
+ (void)getCarSearchWithKeyword:(NSString *)keyword andPage:(NSInteger)page andSize: (NSInteger)size completionHandler:(void (^)(CNCarSearchModel *, NSError *))completionHandler {
    NSString *searchPath = @"http://api.cheyisou.com/APP/BSearchCarForApp.ashx";
    //将内容转换成UTF8
    //NSString *cKeyword = [keyword stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet controlCharacterSet]];
    NSDictionary *params = @{@"keyword":keyword,@"page":@(page),@"size":@(size)};
//    NSString *path = [DPRequest serializeURL:searchPath params:params];
    [self GET:searchPath parameters:params progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([CNCarSearchModel parseJSON:reponseObj], error);
    }];
}
/** 用于请求上市新车 */
+ (void)getNewCarConpletionHandler:(void (^)(CNNewCarModel *, NSError *))conpletionHandler {
    NSString *newCarPath = @"http://api.ycapp.yiche.com/car/getserialinfoforNew";
    NSString *path = [DPRequest serializeURL:newCarPath params:nil];
    [self GET:path parameters:nil progress:nil completionHandler:^(id reponseObj, NSError *error) {
        conpletionHandler([CNNewCarModel parseJSON:reponseObj], error);
    }];
}
/** 用于请求城市列表 */
+ (void)getCityListCompletionHandler:(void (^)(CNCityListDataModel *, NSError *))completionHandler {
    NSString *cityList = @"http://api.ycapp.yiche.com/yicheapp/getcitylist";
    NSString *path = [DPRequest serializeURL:cityList params:nil];
    [self GET:path parameters:nil progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([CNCityListDataModel parseJSON:reponseObj[@"data"]], error);
    }];
}
/** 用于请求汽车销量排行 */
+ (void)getCarRankingWithMonth:(NSString *)month andCarLevel:(NSInteger)carLevel andCityId:(NSInteger)cityId andPage:(NSInteger)page completionHandler:(void (^)(CNCarRankingDataModel *, NSError *))completionHandler {
    NSString *rankingPath = @"http://api.ycapp.yiche.com/indexdata/GetSerialSaleDataList";
    NSDictionary *params = @{@"month":month,@"length":@(20),@"carlevel":@(carLevel),@"cityid":@(cityId),@"page":@(page)};
    NSString *path = [DPRequest serializeURL:rankingPath params:params];
    [self GET:path parameters:nil progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([CNCarRankingDataModel parseJSON:reponseObj[@"data"]], error);
    }];
}
/** 说车 */
+ (void)getNewsWithPage:(NSInteger)page completionHandler:(void (^)(NewsListDataModel *, NSError *))completionHandler{
    NSString *newsList = @"http://api.ycapp.yiche.com/media/getnewslist";
     NSDictionary *parameters = @{@"page":@(page)};
    NSString *path = [DPRequest serializeURL:newsList params:parameters];
   
    [self GET:path parameters:nil progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([NewsListDataModel parseJSON:reponseObj[@"data"]], error);
    }];
}
/** 用于请求数据 categoryid: 1评测 2导购 3新车 */
+ (void)getCarEvaluatingWithPageSize:(NSInteger)pageSize andPageIndex:(NSInteger)pageIndex andCategoryId:(NSInteger)categoryId completionHandler:(void (^)(NewsListDataModel *, NSError *))completionHandler {
    NSString *path = @"http://api.ycapp.yiche.com/news/getnewslist";
    NSDictionary *params = @{@"pagesize":@(pageSize),@"pageindex":@(pageIndex),@"categoryid":@(categoryId)};
    [self GET:path parameters:params progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([NewsListDataModel parseJSON:reponseObj[@"data"]], error);
    }];
}
/** 车系列表 */
+ (void)getCarSerialListWithMasterId:(NSInteger)masterId CompletionHandler:(void (^)(CNSerialModel *, NSError *))completionHandler{
    NSString *serial = @"http://api.ycapp.yiche.com/car/getseriallist";
    NSDictionary *params = @{@"masterid":@(masterId),@"allserial":@"true"};
    NSString *path = [DPRequest serializeURL:serial params:params];
    [self GET:path parameters:nil progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([CNSerialModel parseJSON:reponseObj],error);
    }];
}
/** 请求车型列表 */
+ (void)getCarsListCompletionHandler:(void (^)(CNCarsListModel *, NSError *))completioinHandler {
    NSString *carsListPath = @"http://cheyouapi.ycapp.yiche.com/cheyou/getmasterbrandlist?allmasterbrand=true";
    NSString *path = [DPRequest serializeURL:carsListPath params:nil];
    [self GET:path parameters:nil progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completioinHandler([CNCarsListModel parseJSON:reponseObj],error);
    }];
}
/** 要闻 */
+ (void)getNewsAdvertiseWithPage:(NSInteger)page andLength: (NSInteger)length CompletionHandler:(void (^)(NewsAdvertisementDataModel *, NSError *))completionHandler {
    //NSString *ad = @"http://api.ycapp.yiche.com/appnews/toutiaov64/?length=20&page=1&platform=1";
    NSString *hardNews = @"http://api.ycapp.yiche.com/appnews/toutiaov64/";
    NSDictionary *params = @{@"length":@(length),@"page":@(page),@"platform":@1};
    NSString *path = [DPRequest serializeURL:hardNews params:params];
    [self GET:path parameters:nil progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([NewsAdvertisementDataModel parseJSON:reponseObj[@"data"]], error);
    }];
}

/** 选车 */
+ (void)getSelectCarWithPage:(NSInteger)page completionHandler:(void (^)(SelectCarDataModel *, NSError *))completionHandler{
    NSString *selectCar  = @"http://api.ycapp.yiche.com/yicheapp/getselectcarpagead";
    NSDictionary *parameters = @{@"page":@(page)};
    NSString *path = [DPRequest serializeURL:selectCar params:parameters];
    
    [self GET:path parameters:nil progress:nil completionHandler:^(id reponseObj, NSError *error) {
        
        completionHandler([SelectCarDataModel parseJSON:reponseObj[@"data"]],error);
    }];
}
/** 新闻详情 */
+ (void)getDetailNewsWithNewsID:(NSInteger)ID lastModify:(NSString *)lastModify completionHandler:(void (^)(DetailNewsDataModel *, NSError *))completionHandler {
    NSString *detailNews = @"http://api.ycapp.yiche.com/appnews/GetStructNews";
//    NSDictionary *params = @{@"newsId":@(ID), @"ts":lastModify, @"version":@(7.0)};
    NSDictionary *params = @{@"newsId":@(ID)};
    NSString *path = [DPRequest serializeURL:detailNews params:params];
    [self GET:path parameters:nil progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([DetailNewsDataModel parseJSON:reponseObj[@"data"]],error);
    }];
}
/** 请求说车详情 */
+(void)getDetailTalkAboutCarWithNewsID:(NSInteger)ID categoryId: (NSInteger)categoryId completionHandler:(void (^)(CNDetailTalkAboutModel *, NSError *))completionHandler {
    NSString *path = nil;
    if (categoryId == 0) {
        path = @"http://api.ycapp.yiche.com/media/GetStructMedia";
    } else {
        path = @"http://api.ycapp.yiche.com/news/GetStructYCNews";
    }
//    NSDate *currentdate = [[NSDate alloc] init];
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    //NSDictionary *params = @{@"newsId":@(ID),@"plat":@1,@"ts":lastModify};
    NSDictionary *params = @{@"newsId":@(ID),@"plat":@1};
    [self GET:path parameters:params progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([CNDetailTalkAboutModel parseJSON:reponseObj], error);
    }];
}
/** 用于请求图片新闻详情 */
+ (void)getNewsDetailAlbumWithNewsId:(NSInteger)newsId lastModify:(NSString *)lastModify CompletionHandler:(void (^)(CNNewsAlbumModel *, NSError *))complteionHandler {
    NSString *path = @"http://api.ycapp.yiche.com/appnews/GetNewsAlbum";
    NSDictionary *params = @{@"newsid":@(newsId), @"lastmodify":lastModify};
    [self GET:path parameters:params progress:nil completionHandler:^(id reponseObj, NSError *error) {
        complteionHandler([CNNewsAlbumModel parseJSON:reponseObj], error);
    }];
}
/** 用于请求视频数据 */
+ (void)getCarVideoListWithPageIndex:(NSInteger)pageIndex andPageIndex:(NSInteger)pageSize completionHandler:(void (^)(CNCarVideoModel *, NSError *))completionHandler {
    NSString *path = @"http://api.ycapp.yiche.com/video/GetAppVideoList/";
    NSDictionary *params = @{@"pagesize": @(pageSize),@"pageindex": @(pageIndex),@"plat": @1};
    [self GET:path parameters:params progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([CNCarVideoModel parseJSON:reponseObj],error);
    }];
}
/** 用于请求车系视频数据 */
+ (void)getSerialVideoWithPage:(NSInteger)page andLength: (NSInteger)length completionHandler:(void (^)(CNSerialVideoModel *, NSError *))completionHandler {
    NSString *path = @"http://api.ycapp.yiche.com/video/getvideolistbyserialid";
    NSDictionary *params = @{@"serialid":@([CNTransferInfo sharedCNTransferInfo].model.serialId),@"page":@(page),@"length":@(length)};
    [self GET:path parameters:params progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([CNSerialVideoModel parseJSON:reponseObj], error);
    }];
}
/** 用于请求车系文章数据 */
+ (void)getSerialArticleWithPage:(NSInteger)page andLength:(NSInteger)length completionHandler:(void (^)(CNArticleModel *, NSError *))completionHandler {
    NSString *path = @"http://api.ycapp.yiche.com/news/getnewslist";
    NSDictionary *params = @{@"serialid":@([CNTransferInfo sharedCNTransferInfo].model.serialId),@"pagesize":@(length),@"pageindex":@(page),@"categoryid":@8};
    [self GET:path parameters:params progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([CNArticleModel parseJSON:reponseObj], error);
    }];
}
/** 用于请求车系文章内容数据 */
+ (void)getSerialArticleContentWithNewsId:(NSInteger)newsId lastModify:(NSString *)lastModify completionHandler:(void (^)(CNArticleContentModel *, NSError *))completionHandler {
    NSString *path = @"http://api.ycapp.yiche.com/news/GetStructYCNews";
    NSDictionary *params = @{@"newsId":@(newsId),@"ts":lastModify};
    [self GET:path parameters:params progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([CNArticleContentModel parseJSON:reponseObj], error);
    }];
}
/** 用于请求车系降价数据 */
+ (void)getSerialReducePriceWithSort: (NSInteger)sort andPage:(NSInteger)page andLength:(NSInteger)length completionHandler:(void (^)(CNReducePriceModel *, NSError *))completionHandler {
    NSString *path = @"http://api.ycapp.yiche.com/vendor/getpromotionlist";
    if (!sort) {
        sort = 0;
    }
    NSDictionary *params = @{@"serialid":@([CNTransferInfo sharedCNTransferInfo].model.serialId),@"pagesize":@(length),@"pageindex":@(page),@"skip":@1,@"cityid":kCurrentCityId,@"sort":@(sort)};
    [self GET:path parameters:params progress:nil completionHandler:^(id reponseObj, NSError *error) {
        completionHandler([CNReducePriceModel parseJSON:reponseObj], error);
    }];
}

@end
