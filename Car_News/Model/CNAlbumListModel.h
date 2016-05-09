//
//  CNAlbumListModel.h
//  Car_News
//
//  Created by caohongyang on 16/5/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNAlbumListDataModel;
@interface CNAlbumListModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) NSArray<CNAlbumListDataModel *> *data;

@end
@interface CNAlbumListDataModel : NSObject

@property (nonatomic, copy) NSString *itemType;

@property (nonatomic, copy) NSString *lastModify;

@property (nonatomic, assign) NSInteger imageCount;

@property (nonatomic, assign) NSInteger newsId;

@property (nonatomic, copy) NSString *picCover;

@property (nonatomic, copy) NSString *src;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *filePath;

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, copy) NSString *dataVersion;

@end

