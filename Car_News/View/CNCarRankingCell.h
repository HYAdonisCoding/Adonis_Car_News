//
//  CNCarRankingCell.h
//  Car_News
//
//  Created by caohongyang on 16/4/19.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNCarRankingCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *salesVolumeLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end
