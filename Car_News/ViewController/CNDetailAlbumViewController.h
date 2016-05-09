//
//  CNDetailAlbumViewController.h
//  Car_News
//
//  Created by caohongyang on 16/5/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CNAlbumListDataModel;

@interface CNDetailAlbumViewController : UIViewController

/** 新闻标识 */
@property (nonatomic,strong) CNAlbumListDataModel *data;

@end
