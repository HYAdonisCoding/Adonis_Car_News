//
//  CNVideoCell.m
//  Car_News
//
//  Created by caohongyang on 16/5/9.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNVideoCell.h"
#import "UILabel+Auto.h"

#define kImageViewW 172
#define kImageViewH 96

@implementation CNVideoCell

- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        //_coverImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_coverImageView];
        [_coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.left.equalTo(20);
            make.right.equalTo(-20);
            make.height.equalTo((kScreenW-40)/kImageViewW * kImageViewH);
        }];
    }
    return _coverImageView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel labelWithFrame:CGRectZero];
        _titleLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:20];
        //_titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.left.and.right.equalTo(20);
            make.height.equalTo(20);
        }];
    }
    return _titleLabel;
}
- (UILabel *)durationLabel {
    if (!_durationLabel) {
        _durationLabel = [UILabel labelWithFrame:CGRectZero];
        //_durationLabel.textColor = [UIColor blackColor];
        [self addSubview:_durationLabel];
        [_durationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-20);
            make.height.equalTo(20);
            make.bottom.equalTo(self.coverImageView.mas_bottom).offset(-10);
        }];
    }
    return _durationLabel;
}
- (UILabel *)sourceNameLabel {
    if (!_sourceNameLabel) {
        _sourceNameLabel = [UILabel labelWithFrame:CGRectZero];
        _sourceNameLabel.textColor = [UIColor grayColor];
        [self addSubview:_sourceNameLabel];
        [_sourceNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.coverImageView.mas_bottom).offset(10);
            make.left.equalTo(20);
            make.height.equalTo(20);
            make.bottom.equalTo(-10);
        }];
    }
    return _sourceNameLabel;
}
- (UILabel *)totalVisitLabel {
    if (!_totalVisitLabel) {
        _totalVisitLabel = [UILabel labelWithFrame:CGRectZero];
        _totalVisitLabel.textColor = [UIColor grayColor];
        [self addSubview:_totalVisitLabel];
        [_totalVisitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-20);
            make.top.equalTo(self.coverImageView.mas_bottom).offset(10);
            make.bottom.equalTo(-10);
            make.height.equalTo(20);
        }];
    }
    return _totalVisitLabel;
}
- (UILabel *)commentCountLabel {
    if (!_commentCountLabel) {
        _commentCountLabel = [UILabel labelWithFrame:CGRectZero];
        _commentCountLabel.textColor = [UIColor grayColor];
        [self addSubview:_commentCountLabel];
        [_commentCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.coverImageView.mas_bottom).offset(10);
            make.right.equalTo(self.totalVisitLabel.mas_left).offset(-10);
            make.bottom.equalTo(-10);
            make.height.equalTo(20);
        }];
    }
    return _commentCountLabel;
}

@end
