//
//  CNSerialVideoModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNSerialVideoDataModel,CNSerialVideoDataListModel;
@interface CNSerialVideoModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) CNSerialVideoDataModel *data;

@end
@interface CNSerialVideoDataModel : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<CNSerialVideoDataListModel *> *list;

@end

@interface CNSerialVideoDataListModel : NSObject

@property (nonatomic, copy) NSString *Title;

@property (nonatomic, copy) NSString *PlayLink;

@property (nonatomic, copy) NSString *ImageLink;

@property (nonatomic, assign) NSInteger VideoId;

@property (nonatomic, copy) NSString *CategoryName;

@property (nonatomic, assign) NSInteger VideoUnique;

@property (nonatomic, copy) NSString *LetvVideoId;

@property (nonatomic, copy) NSString *PublishTime;

@property (nonatomic, copy) NSString *Mp4Link;

@property (nonatomic, assign) NSInteger CommentCount;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *Duration;

@property (nonatomic, copy) NSString *RelativeVideoId;

@property (nonatomic, assign) NSInteger Row;

@property (nonatomic, copy) NSString *CategoryId;

@property (nonatomic, copy) NSString *Author;

@property (nonatomic, copy) NSString *ModifyTime;

@property (nonatomic, copy) NSString *SwfLink;

@property (nonatomic, assign) NSInteger TotalVisit;

@property (nonatomic, copy) NSString *YkVideoId;

@property (nonatomic, assign) NSInteger UserId;

@property (nonatomic, copy) NSString *CreatedOn;

@end

