//
//  NewsListModel.h
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewsListDataModel,NewsListListModel;
@interface CNNewsListModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) NewsListDataModel *data;

@end
@interface NewsListDataModel : NSObject

@property (nonatomic, strong) NSArray<NewsListListModel *> *list;

@end

@interface NewsListListModel : NSObject

@property (nonatomic, assign) NSInteger newsId;

@property (nonatomic, copy) NSString *picCover;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *mediaName;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *lastModify;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger commentCount;

@end

