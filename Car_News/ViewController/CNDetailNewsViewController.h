//
//  DetailNewsViewController.h
//  AutoNews
//
//  Created by caohongyang on 16/4/10.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewsAdvertisementDataListModel;

@interface CNDetailNewsViewController : UIViewController

/** 新闻ID */
@property (nonatomic,assign) NewsAdvertisementDataListModel *model;


@end
