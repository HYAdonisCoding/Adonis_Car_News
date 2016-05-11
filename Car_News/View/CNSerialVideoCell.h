//
//  CNSerialVideoCell.h
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNSerialVideoCell : UICollectionViewCell

/** 图片 */
@property (nonatomic,strong) UIImageView *coverImageView;
/** 标题 */
@property (nonatomic,strong) UILabel *titleLabel;
/** 时长 */
@property (nonatomic,strong) UILabel *durationLabel;
/** 观看人次 */
@property (nonatomic,strong) UILabel *totalVisitLabel;

@end
