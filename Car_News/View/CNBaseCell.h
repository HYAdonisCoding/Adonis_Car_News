//
//  CNBaseCell.h
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNBaseCell : UITableViewCell

/** 图片 */
@property (nonatomic,strong) UIImageView *coverImageview;
/** 标题 */
@property (nonatomic,strong) UILabel *titleLabel;
/** 时间 */
@property (nonatomic,strong) UILabel *timeLabel;
/** 评论数 */
@property (nonatomic,strong) UILabel *commentCountLabel;
@end
