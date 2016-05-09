//
//  CNAlbumListCell.m
//  Car_News
//
//  Created by caohongyang on 16/5/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNAlbumListCell.h"
#import "UILabel+Auto.h"

@implementation CNAlbumListCell
///*
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel labelWithFrame:CGRectZero];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.top.equalTo(10);
            make.height.equalTo(20);
            make.right.right.equalTo(-20);
            make.bottom.equalTo(self.firstImageView.mas_top).offset(-10);
        }];
    }
    return _titleLabel;
}
- (UIImageView *)firstImageView {
    if (!_firstImageView) {
        _firstImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_firstImageView];
        [_firstImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(60);
            make.width.equalTo(self.secondImageView.mas_width);
            make.width.equalTo(self.thirdImageView.mas_width);
            make.left.equalTo(20);
            make.right.equalTo(self.secondImageView.mas_left).offset(-5);
            
        }];
    }
    return _firstImageView;
}
- (UIImageView *)secondImageView {
    if (!_secondImageView) {
        _secondImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_secondImageView];
        [_secondImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.firstImageView.mas_height);
            make.right.equalTo(self.thirdImageView.mas_left).offset(-5);
            make.top.equalTo(self.firstImageView.mas_top);
        }];
    }
    return _secondImageView;
}
- (UIImageView *)thirdImageView {
    if (!_thirdImageView) {
        _thirdImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_thirdImageView];
        [_thirdImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.firstImageView.mas_height);
            make.right.equalTo(-20);
            make.top.equalTo(self.firstImageView.mas_top);
        }];
    }
    return _thirdImageView;
}
- (UILabel *)mediaLabel {
    if (!_mediaLabel) {
        _mediaLabel = [UILabel labelWithFrame:CGRectZero];
        [self addSubview:_mediaLabel];
        _mediaLabel.textColor = [UIColor blackColor];
        [_mediaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.firstImageView.mas_bottom).offset(10);
            make.left.equalTo(20);
            make.height.equalTo(20);
            make.bottom.equalTo(-10);
            make.right.equalTo(self.iconImageView.left);
        }];
    }
    return _mediaLabel;
}
- (UILabel *)commentLabel {
    if (!_commentLabel) {
        _commentLabel = [UILabel labelWithFrame:CGRectZero];
        _commentLabel.textColor = [UIColor blackColor];
        [self addSubview:_commentLabel];
        [_commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mediaLabel.mas_top);
            make.right.equalTo(-20);
            make.bottom.equalTo(-10);
            make.height.equalTo(20);
        }];
    }
    return _commentLabel;
}
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _iconImageView.image = [UIImage imageNamed:@"tabbar_1_H"];
        [self addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.width.and.height.equalTo(22);
            make.right.equalTo(self.commentLabel.mas_left).offset(-10);
            make.top.equalTo(self.thirdImageView.mas_bottom).offset(9);
            make.bottom.equalTo(-9);
        }];
    }
    return _iconImageView;
}
//*/
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
