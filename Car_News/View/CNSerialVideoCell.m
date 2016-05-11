//
//  CNSerialVideoCell.m
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNSerialVideoCell.h"
#import "UILabel+Auto.h"

@implementation CNSerialVideoCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self coverImageView];
        [self titleLabel];
        [self totalVisitLabel];
        [self durationLabel];
    }
    return self;
}
- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_coverImageView];
        UIImageView *playImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_banner_nor_"]];
        [self addSubview:playImageView];
        [playImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.coverImageView.mas_bottom).offset(-5);
            make.left.equalTo(self.coverImageView.mas_left).offset(5);
            make.size.equalTo(CGSizeMake(30, 30));
        }];
        [_coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            //make.height.equalTo(80);
        }];
    }
    return _coverImageView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel labelWithFrame:CGRectZero];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
        _titleLabel.numberOfLines = 2;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.coverImageView.mas_bottom).offset(5);
            make.left.right.equalTo(0);
            make.height.equalTo(40);
        }];
    }
    return _titleLabel;
}
- (UILabel *)totalVisitLabel {
    if (!_totalVisitLabel) {
        _totalVisitLabel = [UILabel labelWithFrame:CGRectZero];
        _totalVisitLabel.textColor = [UIColor darkGrayColor];
        [self addSubview:_totalVisitLabel];
        UIImageView *visitImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_big_bofan_nor"]];
        [self addSubview:visitImageView];
        visitImageView.backgroundColor = [UIColor greenColor];
        [visitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(20, 20));
            make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
            make.left.equalTo(0);
            make.bottom.equalTo(-10);
        }];
        [_totalVisitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
            make.left.equalTo(20);
            //make.height.equalTo(20);
            make.bottom.equalTo(-10);
        }];
    }
    return _totalVisitLabel;
}
- (UILabel *)durationLabel {
    if (!_durationLabel) {
        _durationLabel = [UILabel labelWithFrame:CGRectZero];
        _durationLabel.textColor = [UIColor darkGrayColor];
        [self addSubview:_durationLabel];
        [_durationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
            make.right.equalTo(-5);
            make.bottom.equalTo(-10);
            make.height.equalTo(20);
        }];
        UIImageView *timeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_yd_time_nor"]];
        [self addSubview:timeImageView];
        [timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(20, 20));
            make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
            make.right.equalTo(_durationLabel.mas_left).offset(-5);
            make.bottom.equalTo(-10);
        }];
    }
    return _durationLabel;
}


@end
