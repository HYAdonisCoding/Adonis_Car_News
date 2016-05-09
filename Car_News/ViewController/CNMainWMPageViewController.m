//
//  CNMainWMPageViewController.m
//  Car_News
//
//  Created by caohongyang on 16/5/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNMainWMPageViewController.h"
#import "CNMainViewController.h"
#import "CNAlbumViewController.h"
#import "CNTalkAboutCarViewController.h"
#import "CNEvaluatingViewController.h"

@interface CNMainWMPageViewController ()

@end

@implementation CNMainWMPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.menuHeight = 35;
        self.menuItemWidth = 80;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.titles = @[@"新闻",@"图片",@"说车",@"评测",@"新车",@"视频",@"导购"];
    }
    return self;
}
#pragma mark 返回index对应的标题
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return [self.titles objectAtIndex:index];
}
#pragma mark 返回子页面的个数
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return [self.titles count];
}
#pragma mark 返回某个index对应的页面，该页面从Storyboard中获取
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    switch (index) {
        case 0: {//"新闻"
            CNMainViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNMainViewController class])];
            return vc;
        }
        case 1: {//"图片"
            CNAlbumViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNAlbumViewController class])];
            return vc;
        }
        case 2: {//"说车"
            CNTalkAboutCarViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNTalkAboutCarViewController class])];
            return vc;
        }
        case 3: {//"评测"
            CNEvaluatingViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNEvaluatingViewController class])];
            return vc;
        }
        case 4: {//"新车"
            CNTalkAboutCarViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNTalkAboutCarViewController class])];
            return vc;
        }
        case 5: {//"视频"
            CNTalkAboutCarViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNTalkAboutCarViewController class])];
            return vc;
        }
        case 6: {//"导购"
            CNTalkAboutCarViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNTalkAboutCarViewController class])];
            return vc;
        }
        default:
            return nil;
    }
    return nil;
}

@end
