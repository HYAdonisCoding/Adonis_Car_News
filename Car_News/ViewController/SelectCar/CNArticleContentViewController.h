//
//  CNArticleContentViewController.h
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNArticleDataListModel;

@interface CNArticleContentViewController : UIViewController

/** 数据源 */
@property (nonatomic,strong) CNArticleDataListModel *model;

@end
