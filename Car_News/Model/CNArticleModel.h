//
//  CNArticleModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNArticleDataModel,CNArticleDataListModel;
@interface CNArticleModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) CNArticleDataModel *data;

@end
@interface CNArticleDataModel : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<CNArticleDataListModel *> *list;

@end

@interface CNArticleDataListModel : NSObject

@property (nonatomic, assign) NSInteger newsId;

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, copy) NSString *picCover;

@property (nonatomic, copy) NSString *src;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *lastModify;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger viewCount;

@property (nonatomic, copy) NSString *filePath;

@property (nonatomic, copy) NSString *itemType;

@end

