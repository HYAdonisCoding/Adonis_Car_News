//
//  CNAlertViewController.h
//  Car_News
//
//  Created by caohongyang on 16/4/17.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CarsListDataModel;

@interface CNAlertViewController : UIViewController

- (instancetype)initWithSourceView: (UIView *)sourceView sourceRect: (CGRect)sourceRect;
/** 哪个位置弹出来的 */
@property (nonatomic,readonly) CGRect sourceRect;
/** 哪个视图 */
@property (nonatomic,readonly) UIView *sourceView;
/** 接口 */
@property (nonatomic,strong) CarsListDataModel *dataModel;
@end
