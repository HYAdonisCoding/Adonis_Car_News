//
//  CNReducePriceCell.m
//  Car_News
//
//  Created by caohongyang on 16/5/12.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNReducePriceCell.h"
#import "UILabel+Auto.h"

@implementation CNReducePriceCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self carNameLabel];
        [self actPriceLabel];
        [self referPriceLabel];
        [self favPriceLabel];
        [self dealerNameLabel];
        [self storeStateLabel];
        [self saleRegionLabel];
        [self callCenterNumberLabel];
        [self consultLabel];
    }
    return self;
}
- (UILabel *)carNameLabel {
    if (!_carNameLabel) {
        _carNameLabel = [UILabel labelWithFrame:CGRectZero];
        _carNameLabel.textColor = [UIColor blackColor];//-LightOblique
        _carNameLabel.font = [UIFont fontWithName:@"Helvetica-Oblique" size:20];
        [self addSubview:_carNameLabel];
        [_carNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(5);
            make.left.equalTo(20);
            make.right.equalTo(-20);
        }];
    }
    return _carNameLabel;
}
- (UILabel *)actPriceLabel {
    if (!_actPriceLabel) {
        _actPriceLabel = [UILabel labelWithFrame:CGRectZero];
        _actPriceLabel.textColor = [UIColor redColor];
        [self addSubview:_actPriceLabel];
        [_actPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.carNameLabel.mas_bottom).offset(5);
            make.left.equalTo(40);
        }];
    }
    return _actPriceLabel;
}
- (UILabel *)referPriceLabel {
    if (!_referPriceLabel) {
        _referPriceLabel = [UILabel labelWithFrame:CGRectZero];
        _referPriceLabel.textColor = [UIColor lightGrayColor];
        _referPriceLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        [self addSubview:_referPriceLabel];
        [_referPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.carNameLabel.mas_bottom).offset(5);
            make.left.equalTo(self.actPriceLabel.mas_right).offset(20);
        }];
    }
    return _referPriceLabel;
}
- (UILabel *)favPriceLabel {
    if (!_favPriceLabel) {
        _favPriceLabel = [UILabel labelWithFrame:CGRectZero];
        _favPriceLabel.textColor = [UIColor greenColor];
        _favPriceLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        [self addSubview:_favPriceLabel];
        [_favPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.carNameLabel.mas_bottom).offset(5);
            make.left.equalTo(self.referPriceLabel.mas_right).offset(20);
        }];
    }
    return _favPriceLabel;
}
- (UILabel *)dealerNameLabel {
    if (!_dealerNameLabel) {
        _dealerNameLabel = [UILabel labelWithFrame:CGRectZero];
        _dealerNameLabel.textColor = [UIColor darkGrayColor];
        [self addSubview:_dealerNameLabel];
        [_dealerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.actPriceLabel.mas_bottom).offset(5);
            make.left.equalTo(40);
        }];
    }
    return _dealerNameLabel;
}
- (UILabel *)storeStateLabel {
    if (!_storeStateLabel) {
        _storeStateLabel = [UILabel labelWithFrame:CGRectZero];
        _storeStateLabel.textColor = [UIColor darkGrayColor];
        _storeStateLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        [self addSubview:_storeStateLabel];
        [_storeStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.actPriceLabel.mas_bottom).offset(5);
            make.left.equalTo(self.dealerNameLabel.mas_right).offset(20);
        }];
    }
    return _storeStateLabel;
}
- (UILabel *)saleRegionLabel {
    if (!_saleRegionLabel) {
        _saleRegionLabel = [UILabel labelWithFrame:CGRectZero];
        _saleRegionLabel.textColor = [UIColor darkGrayColor];
        _saleRegionLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        [self addSubview:_saleRegionLabel];
        [_saleRegionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.actPriceLabel.mas_bottom).offset(5);
            make.left.equalTo(self.storeStateLabel.mas_right).offset(20);
        }];
    }
    return _saleRegionLabel;
}
- (UILabel *)callCenterNumberLabel {
    if (!_callCenterNumberLabel) {
        _callCenterNumberLabel = [UILabel labelWithFrame:CGRectZero];
        _callCenterNumberLabel.textColor = [UIColor darkGrayColor];
        _callCenterNumberLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_callCenterNumberLabel];
        [_callCenterNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.dealerNameLabel.mas_bottom).offset(5);
            make.left.equalTo(20);
            make.right.equalTo(self.consultLabel.mas_left);
            make.width.equalTo(self.consultLabel.mas_width);
            make.bottom.equalTo(-10);
        }];
    }
    return _callCenterNumberLabel;
}
- (UILabel *)consultLabel {
    if (!_consultLabel) {
        _consultLabel = [UILabel labelWithFrame:CGRectZero];
        _consultLabel.textColor = [UIColor blueColor];
        _consultLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_consultLabel];
        [_consultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.dealerNameLabel.mas_bottom).offset(5);
            make.right.equalTo(-20);
            make.bottom.equalTo(-10);
        }];
    }
    return _consultLabel;
}

@end
