//
//  DetailNewsModel.h
//  AutoNews
//
//  Created by caohongyang on 16/4/5.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>


@class DetailNewsDataModel,DetailNewsDataShareDataModel,DetailNewsDataUserModel,DetailNewsDataUserIdentityModel,DetailNewsDataUserSelfMediaModel,DetailNewsDataContentModel,DetailNewsDataContentStyleModel;
@interface CNDetailNewsModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) DetailNewsDataModel *data;

@end

@interface DetailNewsDataModel : NSObject

@property (nonatomic, assign) NSInteger newsId;
//newstype->newsType
@property (nonatomic, assign) NSInteger newsType;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *src;

@property (nonatomic, strong) NSArray<DetailNewsDataContentModel *> *content;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *lastModify;

@property (nonatomic, strong) DetailNewsDataShareDataModel *shareData;

@property (nonatomic, strong) NSArray *carserialData;
//subsnewsid-subsNewsId
@property (nonatomic, assign) NSInteger subsNewsId;

@property (nonatomic, strong) DetailNewsDataUserModel *user;

@end

@interface DetailNewsDataShareDataModel : NSObject

@property (nonatomic, copy) NSString *newsLink;

@property (nonatomic, strong) NSArray *forums;

@property (nonatomic, assign) NSInteger newsId;

@property (nonatomic, copy) NSString *newsImg;

@property (nonatomic, copy) NSString *newsTitle;

@end

@interface DetailNewsDataUserModel : NSObject

@property (nonatomic, strong) DetailNewsDataUserSelfMediaModel *selfMedia;

@property (nonatomic, strong) DetailNewsDataUserIdentityModel *identity;

@property (nonatomic, copy) NSString *userAvatar;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, copy) NSString *userName;

@end

@interface DetailNewsDataUserIdentityModel : NSObject

@property (nonatomic, assign) NSInteger status;

@end

@interface DetailNewsDataUserSelfMediaModel : NSObject
//id->ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *summary;

@end

@interface DetailNewsDataContentModel : NSObject

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, strong) NSArray<DetailNewsDataContentStyleModel *> *style;

@end

@interface DetailNewsDataContentStyleModel : NSObject

@property (nonatomic, assign) NSInteger posStart;

@property (nonatomic, assign) NSInteger posEnd;

@property (nonatomic, strong) NSArray<NSNumber *> *fontStyle;

@end

