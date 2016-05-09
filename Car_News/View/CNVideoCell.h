//
//  CNVideoCell.h
//  Car_News
//
//  Created by caohongyang on 16/5/9.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNVideoCell : UITableViewCell

/** 标题 */
@property (nonatomic,strong) UILabel *titleLabel;
/** 视频时长 */
@property (nonatomic,strong) UILabel *durationLabel;
/** 媒体 */
@property (nonatomic,strong) UILabel *sourceNameLabel;
/** 评论 */
@property (nonatomic,strong) UILabel *commentCountLabel;
/** 播放数 */
@property (nonatomic,strong) UILabel *totalVisitLabel;
/** 图片 */
@property (nonatomic,strong) UIImageView *coverImageView;

@end
