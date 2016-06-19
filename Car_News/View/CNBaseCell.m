//
//  CNBaseCell.m
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNBaseCell.h"
#import "UILabel+Auto.h"

@implementation CNBaseCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self coverImageview];
        [self titleLabel];
        [self timeLabel];
        [self commentCountLabel];
    }
    return self;
}
- (UIImageView *)coverImageview {
    if (!_coverImageview) {
        _coverImageview = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_coverImageview];
        [_coverImageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.bottom.equalTo(-10);
            make.left.equalTo(20);
            make.size.equalTo(CGSizeMake(100, 80));
        }];
    }
    return _coverImageview;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel labelWithFrame:CGRectZero];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.numberOfLines = 2;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.height.equalTo(50);
            make.left.equalTo(self.coverImageview.mas_right).offset(10);
            make.right.equalTo(-20);
        }];
    }
    return _titleLabel;
}
- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel labelWithFrame:CGRectZero];
        _timeLabel.textColor = [UIColor darkGrayColor];
        [self addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-10);
            //make.height.equalTo(20);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
            make.left.equalTo(self.coverImageview.mas_right).offset(10);
        }];
    }
    return _timeLabel;
}
- (UILabel *)commentCountLabel {
    if (!_commentCountLabel) {
        _commentCountLabel = [UILabel labelWithFrame:CGRectZero];
        _commentCountLabel.textColor = [UIColor darkGrayColor];
        UIImageView *iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_1_H"]];
        [self addSubview:_commentCountLabel];
        [self addSubview:iconImageView];
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_commentCountLabel.mas_left).offset(-8);
            make.bottom.equalTo(-10);
            make.size.equalTo(CGSizeMake(20, 20));
        }];
        [_commentCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-10);
            //make.height.equalTo(20);
            make.right.equalTo(-20);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        }];
    }
    return _commentCountLabel;
}

@end
