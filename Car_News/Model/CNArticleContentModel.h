//
//  CNArticleContentModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNArticleContentDataModel,CNArticleContentDataModelShareDataModel,CNArticleContentDataModelShareDataForumsModel,CNArticleContentDataModelContentModel,CNArticleContentDataModelCarserialDataModel,CNArticleContentDataModelContentStyleModel;
@interface CNArticleContentModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) CNArticleContentDataModel *data;

@end
@interface CNArticleContentDataModel : NSObject

@property (nonatomic, assign) NSInteger newsId;

@property (nonatomic, assign) NSInteger newstype;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *src;

@property (nonatomic, strong) NSArray<CNArticleContentDataModelContentModel *> *content;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *lastModify;

@property (nonatomic, strong) CNArticleContentDataModelShareDataModel *shareData;

@property (nonatomic, strong) NSArray<CNArticleContentDataModelCarserialDataModel *> *carserialData;

@property (nonatomic, assign) NSInteger subsnewsid;

@end

@interface CNArticleContentDataModelShareDataModel : NSObject

@property (nonatomic, assign) NSInteger newsType;

@property (nonatomic, copy) NSString *newsLink;

@property (nonatomic, strong) NSArray<CNArticleContentDataModelShareDataForumsModel *> *forums;

@property (nonatomic, assign) NSInteger newsId;

@property (nonatomic, copy) NSString *newsImg;

@property (nonatomic, copy) NSString *newsTitle;

@end

@interface CNArticleContentDataModelShareDataForumsModel : NSObject
//id->Id
@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *name;

@end

@interface CNArticleContentDataModelContentModel : NSObject

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSArray<CNArticleContentDataModelContentStyleModel *> *style;

@end
@interface CNArticleContentDataModelContentStyleModel : NSObject

@property (nonatomic, assign) NSInteger height;

@property (nonatomic, assign) NSString *link;

@property (nonatomic, assign) NSInteger width;

@end

@interface CNArticleContentDataModelCarserialDataModel : NSObject

@property (nonatomic, copy) NSString *coverurl;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, assign) NSInteger serialid;

@end

