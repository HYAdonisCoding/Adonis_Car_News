//
//  CNCarSerialListWMPageViewController.m
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCarSerialListWMPageViewController.h"
#import "CNSerialVideoViewController.h"
#import "CNTransferInfo.h"
#import "CNSerialModel.h"
#import "CNSelectCarModel.h"
#import "CNHotSearchModel.h"
#import "CNArticleViewController.h"
#import "CNReducePriceViewController.h"

@implementation CNCarSerialListWMPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *name = [CNTransferInfo sharedCNTransferInfo].serialName;
//    if (!name) {/** 热门车型 */
//        name = [CNTransferInfo sharedCNTransferInfo].data.serialName;
//        if (!name) {/** 热门搜索 */
//            name = [CNTransferInfo sharedCNTransferInfo].dataModel.serialName;
//            if (!name) {
//                name = [CNTransferInfo sharedCNTransferInfo].serialName;
//            }
//        }
//    }
    self.navigationItem.title = name;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goBackCarList)];
}
- (void)goBackCarList {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return 6;
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    switch (index) {
        case 0:{
            CNSerialVideoViewController *vc = [[CNSerialVideoViewController alloc] init];
            return vc;
        }
        case 1:{
            CNSerialVideoViewController *vc = [[CNSerialVideoViewController alloc] init];
            return vc;
        }
        case 2:{
            CNReducePriceViewController *vc = [[CNReducePriceViewController alloc] init];
            return vc;
        }
        case 3:{
            CNSerialVideoViewController *vc = [[CNSerialVideoViewController alloc] init];
            return vc;
        }
        case 4:{
            CNArticleViewController *vc = [[CNArticleViewController alloc] init];
            return vc;
        }
        case 5:{
            CNSerialVideoViewController *vc = [[CNSerialVideoViewController alloc] init];
            return vc;
        }
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
        default:
            break;
    }
    return title;
}
@end
