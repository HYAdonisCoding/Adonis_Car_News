//
//  CNDetailAlbumViewController.m
//  Car_News
//
//  Created by caohongyang on 16/5/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNDetailAlbumViewController.h"
#import "CNNewsAlbumViewModel.h"
//#import <SDCycleScrollView.h>

@interface CNDetailAlbumViewController ()

@property (weak, nonatomic)  UIScrollView *scrollView;
/** 数据 */
@property (nonatomic,strong) CNNewsAlbumViewModel *newsAlbumVM;

@end

@implementation CNDetailAlbumViewController

#pragma mark -- Lazy Load
- (CNNewsAlbumViewModel *)newsAlbumVM {
    if (!_newsAlbumVM) {
        _newsAlbumVM = [CNNewsAlbumViewModel new];
    }
    return _newsAlbumVM;
}

/** 滚动视图 */
- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    /** 设置内容区域 */
    scrollView.contentSize = CGSizeMake(kScreenW * self.newsAlbumVM.albumList.count, 0);
    for (NSInteger i=0; i<self.newsAlbumVM.albumList.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        CGRect frame = CGRectZero;
        frame.size = CGSizeMake(scrollView.bounds.size.width, kScreenH - self.topLayoutGuide.length);
        frame.origin = CGPointMake(i * scrollView.bounds.size.width, 0);
        [imageView sd_setImageWithURL:[NSURL URLWithString:[self.newsAlbumVM getAllAlbums][i]] placeholderImage:[UIImage imageNamed:@"defalut_background2"]];
        imageView.frame = frame;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.center = CGPointMake(imageView.center.x, self.view.center.y);
        [scrollView addSubview:imageView];
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(i * scrollView.bounds.size.width , kScreenH * 0.67, kScreenW, kScreenH * 0.25)];
        textView.backgroundColor = kRGBColor(31, 34, 45, 1.0);
        textView.alpha = 0.8;
        textView.textColor = [UIColor whiteColor];
        //中心对齐
        textView.textAlignment = NSTextAlignmentCenter;
        //Helvetica-Oblique,TimesNewRomanPS-ItalicMT
        textView.font = [UIFont fontWithName:@"Helvetica" size:16];;
        textView.textAlignment = NSTextAlignmentLeft;
        //禁止编辑
        textView.editable = NO;
        textView.text = self.newsAlbumVM.albumList[i].content;
        [scrollView addSubview:textView];
        UITextView *headerTextView = [[UITextView alloc] initWithFrame:CGRectMake(i * scrollView.bounds.size.width , self.topLayoutGuide.length, kScreenW, 88)];
        headerTextView.backgroundColor = kRGBColor(31, 34, 45, 1.0);
        headerTextView.alpha = 0.8;
        headerTextView.textColor = [UIColor whiteColor];
        //中心对齐
        headerTextView.textAlignment = NSTextAlignmentCenter;
        //Helvetica-Oblique,TimesNewRomanPS-ItalicMT
        headerTextView.font = [UIFont fontWithName:@"Helvetica" size:20];;
        headerTextView.textAlignment = NSTextAlignmentLeft;
        //禁止编辑
        headerTextView.editable = NO;
        headerTextView.text = self.data.title;
        [scrollView addSubview:headerTextView];
    }
    /** 滚动视图边缘不可弹跳 */
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    //[scrollView flashScrollIndicators];
    [self.view addSubview:scrollView];
}
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"图片详情";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.newsAlbumVM getNewsDetailAlbumsWithNewsId:self.data.newsId LastModify:self.data.lastModify completionHandler:^(NSError *error) {
        if (error) {
            [self.view showWarning:error.localizedDescription];
        } else {
            [self setupScrollView];
        }
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

@end
