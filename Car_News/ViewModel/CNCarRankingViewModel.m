//
//  CNCarRankingViewModel.m
//  Car_News
//
//  Created by caohongyang on 16/4/20.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCarRankingViewModel.h"

@implementation CNCarRankingViewModel

/** 获取汽车图片 */
- (NSURL *)getcarIconImageForIndex: (NSInteger)index{
    return [NSURL URLWithString: [self.rankingList[index].WhiteCoverImg stringByReplacingOccurrencesOfString:@"{0}" withString:@"1"]];
}
/** 获取汽车名称 */
- (NSString *)getCarNameForIndex: (NSInteger)index{
    return self.rankingList[index].SerialName;
}
/** 获取汽车价格 */
- (NSString *)getCarPriceForIndex: (NSInteger)index{
    return [NSString stringWithFormat:@"%.2f-%.2f万",self.rankingList[index].MinPrice,self.rankingList[index].MaxPrice];
}
/** 获取汽车销量 */
- (NSString *)getCarSalesNumberForIndex: (NSInteger)index{
    return [NSString stringWithFormat:@"全国销量:%ld辆",self.rankingList[index].Index];
}
- (NSMutableArray<CNCarRankingDataListModel *> *)rankingList {
    if (!_rankingList) {
        _rankingList = [NSMutableArray array];
    }
    return _rankingList;
}
- (NSString *)date {
    NSCalendar *myCal = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    //获取现在的日期
    NSDate *currentDate = [[NSDate alloc] init];
    unsigned units = NSMonthCalendarUnit | NSDayCalendarUnit | NSYearCalendarUnit;
    NSDateComponents *comp = [myCal components:units fromDate:currentDate];
    NSInteger year = [comp year];
    NSInteger month = [comp month];
    if (month == 2) {
        comp.month = 12;
        comp.year = year - 1;
    } else {
        comp.month = month - 2;
    }
    comp.day = 01;
    NSString *dateTime = [NSString stringWithFormat:@"%ld-%02ld-%02ld",comp.year,comp.month,comp.day];
    return dateTime;
}
/** 获取汽车模型 */
- (void)getCarRankingWithRequestMode:(RequestMode)requestMode andCarLevel: (NSInteger)carLevel completionHandler:(void (^)(NSError *))completionHandler {
    NSInteger tmpPage = 1;
    if (requestMode == RequestModeMore) {
        tmpPage = _pageNumber + 1;
    }
    self.cityId = kCityId;
    [CNNetManager getCarRankingWithMonth:self.date andCarLevel:carLevel andCityId:self.cityId andPage:tmpPage completionHandler:^(CNCarRankingDataModel *model, NSError *error) {
        if (!error) {
            _pageNumber = tmpPage;
            if (requestMode == RequestModeRefresh) {
                [self.rankingList removeAllObjects];
            }
            [self.rankingList addObjectsFromArray:model.list];
        }
        completionHandler(error);
    }];
}

@end
