//
//  CNCarSerialCell.m
//  Car_News
//
//  Created by caohongyang on 16/4/18.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCarSerialCell.h"
#import "UILabel+Auto.h"

@implementation CNCarSerialCell

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.bottom.equalTo(10);
            make.size.equalTo(CGSizeMake(80, 60));
        }];
    }
    return _iconImageView;
}
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel labelWithFrame:CGRectZero];
        _nameLabel.textColor = [UIColor blackColor];
        [self addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.left.equalTo(self.iconImageView.mas_right).offset(20);
        }];
    }
    return _nameLabel;
}
- (UILabel *)dealerPriceLabel {
    if (!_dealerPriceLabel) {
        _dealerPriceLabel = [UILabel labelWithFrame:CGRectZero];
        _dealerPriceLabel.textColor = [UIColor redColor];
        [self addSubview:_dealerPriceLabel];
        [_dealerPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameLabel.bottom).offset(10);
            make.bottom.equalTo(10);
            make.left.equalTo(self.iconImageView.mas_right).offset(20);
        }];
    }
    return _dealerPriceLabel;
}
@end
