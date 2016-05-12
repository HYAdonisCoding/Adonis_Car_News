//
//  CNReducePriceCell.h
//  Car_News
//
//  Created by caohongyang on 16/5/12.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNReducePriceCell : UITableViewCell

/** 车名 */
@property (nonatomic,strong) UILabel *carNameLabel;
/** 现价 */
@property (nonatomic,strong) UILabel *actPriceLabel;
/** 原价 */
@property (nonatomic,strong) UILabel *referPriceLabel;
/** 降价 */
@property (nonatomic,strong) UILabel *favPriceLabel;
/** 4S店名称 */
@property (nonatomic,strong) UILabel *dealerNameLabel;
/** 在售状态 */
@property (nonatomic,strong) UILabel *storeStateLabel;
/** 在售区域 */
@property (nonatomic,strong) UILabel *saleRegionLabel;
/** 电话 */
@property (nonatomic,strong) UILabel *callCenterNumberLabel;
/** 询底价 */
@property (nonatomic,strong) UILabel *consultLabel;

@end
