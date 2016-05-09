//
//  CNCarVideoModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/9.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNCarVideoDataModel,CNCarVideoDataListModel;
@interface CNCarVideoModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) CNCarVideoDataModel *data;

@end
@interface CNCarVideoDataModel : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<CNCarVideoDataListModel *> *list;

@end

@interface CNCarVideoDataListModel : NSObject
//commentcount->commentCount
@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, assign) NSInteger type;
//totalvisit->totalVisit
@property (nonatomic, assign) NSInteger totalVisit;

@property (nonatomic, copy) NSString *title;
//publishtime->publishTime
@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *duration;
//sourcename->sourceName
@property (nonatomic, copy) NSString *sourceName;
//mp4link->mp4Link
@property (nonatomic, copy) NSString *mp4Link;
//videoid->videoId
@property (nonatomic, assign) NSInteger videoId;
//coverimg->coverImg
@property (nonatomic, copy) NSString *coverImg;
//modifytime->modifyTime
@property (nonatomic, copy) NSString *modifytime;

@end

