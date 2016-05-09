//
//  CNAlertController.h
//  Car_News
//
//  Created by caohongyang on 16/4/22.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNAlertController : UIViewController

/** 弹出的控制器要知道从哪个视图,哪个位置,弹出来多大的内容 */
- (instancetype)initWithSourceView: (UIView *)sourceView bySourceRect: (CGRect)sourceRect andContentSize: (CGSize)contentSize andDirection: (UIPopoverArrowDirection)direction;
/** 弹出的内容多大 */
@property (nonatomic,readonly) CGSize contentSize;
/** 哪个位置弹出来的 */
@property (nonatomic,readonly) CGRect sourceRect;
/** 哪个视图弹出来的 */
@property (nonatomic,readonly) UIView *sourceView;
/** 推出方向 */
@property (nonatomic,assign) NSInteger direction;

@end
