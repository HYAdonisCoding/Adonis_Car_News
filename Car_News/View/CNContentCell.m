//
//  CNContentCell.m
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNContentCell.h"
#import "UILabel+Auto.h"

@implementation CNContentCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self label];
    }
    return self;
}
- (UILabel *)label {
    if (!_label) {
        _label = [UILabel labelWithFrame:CGRectZero];
        _label.textColor = [UIColor blackColor];
        _label.numberOfLines = 0;
        _label.font = [UIFont fontWithName:@"Helvetica" size:18];
        [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(10);
            make.right.bottom.equalTo(-10);
        }];
    }
    return _label;
}

@end
