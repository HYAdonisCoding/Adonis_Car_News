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

@interface CNSerialVideoViewController() <UICollectionViewDelegate, UICollectionViewDataSource>

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
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[CNSerialVideoCell class] forCellWithReuseIdentifier:@"cell"];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _collectionView;
}
#pragma mark -- UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.serialVideoVM.videoList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CNSerialVideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    [cell.coverImageView sd_setImageWithURL:[self.serialVideoVM getVideoCoverImageForIndex:row] placeholderImage:[UIImage imageNamed:@"defalut_background8"]];
    cell.titleLabel.text = [self.serialVideoVM getVideoTitleForIndex:row];
    cell.totalVisitLabel.text = [self.serialVideoVM getVideoTotalVisitForIndex:row];
    cell.durationLabel.text = [self.serialVideoVM getVideoDurationForIndex:row];
    return cell;
}
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
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
