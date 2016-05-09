//
//  CNCarRankingModel.h
//  Car_News
//
//  Created by caohongyang on 16/4/19.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNCarRankingDataModel,CNCarRankingDataListModel;
@interface CNCarRankingModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) CNCarRankingDataModel *data;

@end
@interface CNCarRankingDataModel : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<CNCarRankingDataListModel *> *list;

@end

@interface CNCarRankingDataListModel : NSObject

@property (nonatomic, copy) NSString *GrowthRate;

@property (nonatomic, assign) NSInteger Index;

@property (nonatomic, assign) CGFloat MaxPrice;

@property (nonatomic, assign) NSInteger SerialId;

@property (nonatomic, assign) NSInteger Rank;

@property (nonatomic, assign) CGFloat MinPrice;

@property (nonatomic, copy) NSString *RankGrowth;

@property (nonatomic, copy) NSString *ItemUrl;

@property (nonatomic, copy) NSString *WhiteCoverImg;

@property (nonatomic, copy) NSString *SerialName;

@end

