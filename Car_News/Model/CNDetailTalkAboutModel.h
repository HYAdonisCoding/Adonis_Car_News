//
//  CNDetailTalkAboutModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/5.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNDetailTalkAboutDataModel,CNDetailTalkAboutDataShareDataModel,CNDetailTalkAboutDataUserModel,CNDetailTalkAboutDataUserIdentityModel,CNDetailTalkAboutDataUserSelfMediaModel,CNDetailTalkAboutDataContentModel,CNDetailTalkAboutDataContentStyleModel;
@interface CNDetailTalkAboutModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) CNDetailTalkAboutDataModel *data;

@end
@interface CNDetailTalkAboutDataModel : NSObject

@property (nonatomic, assign) NSInteger newsId;

@property (nonatomic, assign) NSInteger newstype;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *src;

@property (nonatomic, strong) NSArray<CNDetailTalkAboutDataContentModel *> *content;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *lastModify;

@property (nonatomic, strong) CNDetailTalkAboutDataShareDataModel *shareData;
//carserialData->carSerialData
@property (nonatomic, strong) NSArray *carSerialData;
//subsnewsid->subsNewsId
@property (nonatomic, assign) NSInteger subsNewsId;

@property (nonatomic, strong) CNDetailTalkAboutDataUserModel *user;

@end

@interface CNDetailTalkAboutDataShareDataModel : NSObject

@property (nonatomic, assign) NSInteger newsType;

@property (nonatomic, copy) NSString *newsLink;

@property (nonatomic, strong) NSArray *forums;

@property (nonatomic, assign) NSInteger newsId;

@property (nonatomic, copy) NSString *newsImg;

@property (nonatomic, copy) NSString *newsTitle;

@end

@interface CNDetailTalkAboutDataUserModel : NSObject

@property (nonatomic, strong) CNDetailTalkAboutDataUserSelfMediaModel *selfMedia;

@property (nonatomic, strong) CNDetailTalkAboutDataUserIdentityModel *identity;

@property (nonatomic, copy) NSString *userAvatar;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, copy) NSString *userName;

@end

@interface CNDetailTalkAboutDataUserIdentityModel : NSObject

@property (nonatomic, assign) NSInteger status;

@end

@interface CNDetailTalkAboutDataUserSelfMediaModel : NSObject
//id->Id
@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *summary;

@end

@interface CNDetailTalkAboutDataContentModel : NSObject

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, strong) NSArray<CNDetailTalkAboutDataContentStyleModel *> *style;

@end

@interface CNDetailTalkAboutDataContentStyleModel : NSObject

@property (nonatomic, assign) NSInteger posStart;

@property (nonatomic, assign) NSInteger posEnd;

@property (nonatomic, assign) NSInteger height;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, strong) NSArray<NSNumber *> *fontStyle;

@end

