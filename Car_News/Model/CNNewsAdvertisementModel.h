//
//  NewsAdvertisementModel.h
//  AutoNews
//
//  Created by caohongyang on 16/4/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewsAdvertisementDataModel,NewsAdvertisementDataListModel;
@interface CNNewsAdvertisementModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) NewsAdvertisementDataModel *data;

@property (nonatomic, assign) BOOL success;

@end
@interface NewsAdvertisementDataModel : NSObject

@property (nonatomic, assign) NSInteger focusNum;

@property (nonatomic, strong) NSArray<NewsAdvertisementDataListModel *> *list;

@end

@interface NewsAdvertisementDataListModel : NSObject

@property (nonatomic, copy) NSString *mp4Link;

@property (nonatomic, assign) NSInteger videoId;

@property (nonatomic, copy) NSString *duration;

@property (nonatomic, copy) NSString *itemType;

@property (nonatomic, copy) NSString *lastModify;

@property (nonatomic, assign) NSInteger newsId;

@property (nonatomic, copy) NSString *picCover;

@property (nonatomic, copy) NSString *src;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger viewCount;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *filePath;

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, copy) NSString *dataVersion;

@end

