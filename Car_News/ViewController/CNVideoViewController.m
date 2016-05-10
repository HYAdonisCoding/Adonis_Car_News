//
//  CNVideoViewController.m
//  Car_News
//
//  Created by caohongyang on 16/5/9.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNVideoViewController.h"
#import "CNVideoCell.h"
#import "CNCarVideoViewModel.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CNVideoViewController() <UITableViewDelegate, UITableViewDataSource>

/** 数据 */
@property (nonatomic,strong) CNCarVideoViewModel *carVideoVM;
/** 表格 */
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation CNVideoViewController

#pragma mark -- Lazy Load
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView .delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[CNVideoCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _tableView;
}
- (CNCarVideoViewModel *)carVideoVM {
    if (!_carVideoVM) {
        _carVideoVM = [CNCarVideoViewModel new];
    }
    return _carVideoVM;
}
#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.carVideoVM.videoList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CNVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    [cell.coverImageView sd_setImageWithURL:[self.carVideoVM getVideoCoverImageForIndex:row] placeholderImage:[UIImage imageNamed:@"defalut_background9"]];
    cell.titleLabel.text = [self.carVideoVM getVideoTitleForIndex:row];
    cell.durationLabel.text = [self.carVideoVM getVideoDurationForIndex:row];
    cell.totalVisitLabel.text = [self.carVideoVM getVideoTotalVisitForIndex:row];
    cell.sourceNameLabel.text = [self.carVideoVM getVideoSourceNameForIndex:row];
    cell.commentCountLabel.text = [self.carVideoVM getVideoCommentCountForIndex:row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CNCarVideoDataListModel *model = self.carVideoVM.videoList[row];
    if (model.mp4Link.length > 0) {//独家视屏
        [self playMovie:model.mp4Link];
        return;
    }//其他视屏
//    if (model.videoId && model.filePath.length > 0) {
//        //        NSString *path = [NSString stringWithFormat:@"http://v.bitauto.com/vplay/%ld.html",model.videoId];
//        NSString *path = [NSString stringWithFormat:@"http://h5.ycapp.yiche.com/newvideo/100%ld.html?appver=7.0&plat=1&lastmodify=%@",model.videoId,model.lastModify];
//        [self playMovieWithPath:path andTitle:model.title];
//        return;
//    }
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return UITableViewAutomaticDimension;
//}
#pragma mark -- Method 
- (void)playMovieWithPath: (NSString *)path andTitle: (NSString *)title {
    UIViewController *vc = [[UIViewController alloc] init];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:path]];
    [vc.view addSubview:webView];
    [webView loadRequest:request];
    vc.title = title;
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)playMovie:(NSString *)path{
    //视频URL
    NSURL *url = [NSURL URLWithString:path];
    //视频播放对象
    AVPlayer *player = [AVPlayer playerWithURL:url];
    // 此控制器的视图专门用来播放player中的视频
    AVPlayerViewController *vc = [[AVPlayerViewController alloc] init];
    vc.player = player;
    // 从一个vc展示另一个vc，使用present
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark --  Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    WK(weakSelf);
    [self.tableView addHeaderRefresh:^{
        [weakSelf.carVideoVM getCarVideoRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                [weakSelf.view showWarning:error.localizedDescription];
            } else {
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    [self.tableView addBackFooterRefresh:^{
        [weakSelf.carVideoVM getCarVideoRequestMode:RequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                [weakSelf.view showWarning:error.localizedDescription];
            } else {
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
    self.tableView.estimatedRowHeight = 248;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

@end
