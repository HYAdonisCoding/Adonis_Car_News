//
//  CNCarSerialCell.h
//  Car_News
//
//  Created by caohongyang on 16/4/18.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNCarSerialCell : UITableViewCell

/** 车型图片 */
@property (nonatomic,strong) UIImageView *iconImageView;
/** 车型名称 */
@property (nonatomic,strong) UILabel *nameLabel;
/** 价格区间 */
@property (nonatomic,strong) UILabel *dealerPriceLabel;

@end
