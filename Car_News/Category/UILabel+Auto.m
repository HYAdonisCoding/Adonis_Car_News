//
//  UILabel+Auto.m
//  AutoNews
//
//  Created by caohongyang on 16/4/13.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "UILabel+Auto.h"

@implementation UILabel (Auto)

+ (UILabel *)labelWithFrame:(CGRect)frame {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont fontWithName:@"Helvetica-Light" size:16];
    return label;
}
@end
