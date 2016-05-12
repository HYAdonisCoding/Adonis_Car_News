//
//  CNReduceDetailViewController.m
//  Car_News
//
//  Created by caohongyang on 16/5/12.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNReduceDetailViewController.h"

@interface CNReduceDetailViewController() <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
@implementation CNReduceDetailViewController

#pragma mark -- UIWebViewDelegate

#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];
}

@end
