//
//  CNCarSerialListWMPageViewController.m
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCarSerialListWMPageViewController.h"
#import "CNSerialVideoViewController.h"

@implementation CNCarSerialListWMPageViewController

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return 7;
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    switch (index) {
        case 0:
            return nil;
            
        case 1:
            
            return nil;
        case 2:
            return nil;
        case 3:
            return nil;
        case 4:
            return nil;
        case 5:
            return nil;
        case 6:
            return nil;
        default:
            return nil;
    }
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    NSString *title = nil;
    switch (index) {
        case 0:
            title = @"综述";
            break;
        case 1:
            title = @"参数";
            break;
        case 2:
            title = @"降价";
            break;
        case 3:
            title = @"口碑";
            break;
        case 4:
            title = @"文章";
            break;
        case 5:
            title = @"视频";
            break;
        case 6:
            title = @"社区";
            break;
        default:
            break;
    }
    return title;
}
@end
