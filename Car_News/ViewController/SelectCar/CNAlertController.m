//
//  CNAlertController.m
//  Car_News
//
//  Created by caohongyang on 16/4/22.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNAlertController.h"

@interface CNAlertController() <UIPopoverPresentationControllerDelegate>

@end

@implementation CNAlertController

#pragma mark -- UIPopoverPresentationControllerDelegate
/** 要让弹出效果在iPhone下生效,必须实现此方法 */
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    return UIModalPresentationNone;
}
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    /** 设置弹出后的大小 */
    self.preferredContentSize = self.contentSize;
}

- (instancetype)initWithSourceView:(UIView *)sourceView bySourceRect:(CGRect)sourceRect andContentSize:(CGSize)contentSize andDirection:(UIPopoverArrowDirection)direction {
    self = [super init];
    if (self) {
        _sourceRect = sourceRect;
        _sourceView = sourceView;
        _contentSize = contentSize;
        _direction = direction;
        /** 设置当前控制器的弹出方式是:UIModalPresentationPopover */
        self.modalPresentationStyle = UIModalPresentationPopover;
        self.popoverPresentationController.permittedArrowDirections = _direction;
        self.popoverPresentationController.delegate = self;
        self.popoverPresentationController.sourceView = _sourceView;
        self.popoverPresentationController.sourceRect = _sourceRect;
    }
    return self;
}


@end
