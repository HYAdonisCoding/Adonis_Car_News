//
//  CNMoreViewController.h
//  Car_News
//
//  Created by caohongyang on 16/4/25.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNAlertController.h"

@protocol CNAlertViewDelegate <NSObject>

- (void)alertViewController: (UIViewController *)alertView selectRowNumber: (NSInteger)number;

@end

@interface CNMoreViewController : CNAlertController

/** 代理 */
@property (nonatomic,weak) id<CNAlertViewDelegate> delegate;

@end
