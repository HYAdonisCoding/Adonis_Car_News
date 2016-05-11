//
//  CNSerislVideoViewController.m
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNSerialVideoViewController.h"
#import "CNSerialVideoCell.h"
#import "CNSerialVideoViewModel.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CNSerialVideoViewController() <UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
/** 数据源 */
@property (nonatomic,strong) CNSerialVideoViewModel *serialVideoVM;

@end

@implementation CNSerialVideoViewController

#pragma mark -- Lazy Load
- (CNSerialVideoViewModel *)serialVideoVM {
    if (!_serialVideoVM) {
        _serialVideoVM = [CNSerialVideoViewModel new];
    }
    return _serialVideoVM;
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CNSerialVideoCell class] forCellWithReuseIdentifier:@"cell"];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _collectionView;
}
#pragma mark -- UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.serialVideoVM.videoList.count ? self.serialVideoVM.videoList.count : 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CNSerialVideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    if (!cell) {
        MYLog(@"无法创建CNSerialVideoCell");
    }
    [cell.coverImageView sd_setImageWithURL:[self.serialVideoVM getVideoCoverImageForIndex:row] placeholderImage:[UIImage imageNamed:@"defalut_background8"]];
    cell.titleLabel.text = [self.serialVideoVM getVideoTitleForIndex:row];
    cell.totalVisitLabel.text = [self.serialVideoVM getVideoTotalVisitForIndex:row];
    cell.durationLabel.text = [self.serialVideoVM getVideoDurationForIndex:row];
    return cell;
}
//定义每个UICollectionView 的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 20, 10, 20);//top left bottom rightCell边界范围
}
//定义每个UICollectionView 的大小（返回CGSize：宽度和高度）
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((kScreenW - 40 - 30)/2, 160);
}
//定义每个UICollectionView 的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}
//定义每个UICollectionView 纵向的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MYLog(@"选中了%ld",indexPath.row);
    NSString *path = self.serialVideoVM.videoList[indexPath.row].Mp4Link;
    [self playMovie:path];
}
#pragma mark -- Method
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
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    WK(weakSelf);
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.serialVideoVM getSerialVideoRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                [weakSelf.view showWarning:error.localizedDescription];
            } else {
                [weakSelf.collectionView reloadData];
            }
            [weakSelf.collectionView endHeaderRefresh];
        }];
    }];
    [self.collectionView beginHeaderRefresh];
    [self.collectionView addBackFooterRefresh:^{
        [weakSelf.serialVideoVM getSerialVideoRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                [weakSelf.view showWarning:error.localizedDescription];
            } else {
                [weakSelf.collectionView reloadData];
            }
            [weakSelf.collectionView endFooterRefresh];
        }];
    }];
}


@end
