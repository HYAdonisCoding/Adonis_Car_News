//
//  CNNewsAlbumModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNNewsAlbumDataModel,CNNewsAlbumDataShareToCheYouModel,CNNewsAlbumDataAlbumsModel;
@interface CNNewsAlbumModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) CNNewsAlbumDataModel *data;

@end
@interface CNNewsAlbumDataModel : NSObject

@property (nonatomic, strong) CNNewsAlbumDataShareToCheYouModel *shareToCheYou;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *sourceName;

@property (nonatomic, assign) NSInteger newsId;

@property (nonatomic, strong) NSArray<CNNewsAlbumDataAlbumsModel *> *albums;

@property (nonatomic, copy) NSString *publishTime;

@end

@interface CNNewsAlbumDataShareToCheYouModel : NSObject

@property (nonatomic, assign) NSInteger newsType;
//newslink->newsLink
@property (nonatomic, copy) NSString *newsLink;
//newsid->newsId
@property (nonatomic, assign) NSInteger newsId;
//newsimg->newsImg
@property (nonatomic, copy) NSString *newsImg;

@property (nonatomic, copy) NSString *picsImgsList;
//newstitle->newsTitle
@property (nonatomic, copy) NSString *newsTitle;

@end

@interface CNNewsAlbumDataAlbumsModel : NSObject
//id->ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *imageUrl;

@end

