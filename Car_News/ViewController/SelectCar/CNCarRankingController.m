//
//  CNCarRankingController.m
//  Car_News
//
//  Created by caohongyang on 16/4/27.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCarRankingController.h"
#import "CNCarRankingCell.h"
#import "CNCarRankingViewModel.h"

#define kTag 100

@interface CNCarRankingController()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 数据 */
@property (nonatomic,strong) CNCarRankingViewModel *carRankingVM;

@end
@implementation CNCarRankingController

#pragma mark -- Lazy Load
- (CNCarRankingViewModel *)carRankingVM {
    if (!_carRankingVM) {
        _carRankingVM = [CNCarRankingViewModel new];
    }
    return _carRankingVM;
}
#pragma mark -- Method
- (void)headerRefresh {
    [self.tableView addHeaderRefresh:^{
        [self.carRankingVM getCarRankingWithRequestMode:RequestModeRefresh  andCarLevel: self.carLevel completionHandler:^(NSError *error) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            } else {
                [self.tableView reloadData];
            }
            [self.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
}
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"销量排行";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.carLevel = 3;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // 1.先设定一个cell高度的估计值，这个值随意，只是为了让系统能够先预定tableView的整体高度
    //self.tableView.estimatedRowHeight = 100;
    // 2.设置tableView的实际行高要根据自动布局产生的高度决定
    //self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self headerRefresh];
    [self.tableView addBackFooterRefresh:^{
        [self.carRankingVM getCarRankingWithRequestMode:RequestModeMore andCarLevel: self.carLevel completionHandler:^(NSError *error) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            } else {
                [self.tableView reloadData];
            }
            [self.tableView endFooterRefresh];
        }];
    }];
    
}
#pragma mark -- UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:kTag];
    switch (indexPath.item) {
        case 0:
            label.text = @"紧凑型车";
            break;
        case 1:
            label.text = @"微型车";
            break;
        case 2:
            label.text = @"小型车";
            break;
        case 3:
            label.text = @"中型车";
            break;
        case 4:
            label.text = @"中大型车";
            break;
        case 5:
            label.text = @"SUV";
            break;
        case 6:
            label.text = @"MPV";
            break;
        default:
            break;
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MYLog(@"选中了第：%ld项",indexPath.item);
    NSInteger carLevel = 0;
    switch (indexPath.item) {
        case 0:
            carLevel = 3;
            break;
        case 1:
            carLevel = 2;
            break;
        case 2:
            carLevel = 1;
            break;
        case 3:
            carLevel = 4;
            break;
        case 4:
            carLevel = 5;
            break;
        case 5:
            carLevel = 7;
            break;
        case 6:
            carLevel = 6;
            break;
        default:
            break;
    }
    self.carLevel = carLevel;
    [self headerRefresh];
}
//- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//}
#pragma mark - Table view data source
/** 表格可以自适应 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.carRankingVM.rankingList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CNCarRankingCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CNCarRankingCell class]) forIndexPath:indexPath];
    if (indexPath.row < 3) {
        cell.numberLabel.textColor = [UIColor redColor];
    } else {
        cell.numberLabel.textColor = [UIColor whiteColor];
    }
    NSInteger row = indexPath.row;
    cell.nameLabel.text = [self.carRankingVM getCarNameForIndex:row];
    cell.priceLabel.text = [self.carRankingVM getCarPriceForIndex:row];
    cell.salesVolumeLabel.text = [self.carRankingVM getCarSalesNumberForIndex:row];
    [cell.iconImageView sd_setImageWithURL:[self.carRankingVM getcarIconImageForIndex:row] placeholderImage:[UIImage imageNamed:@"defalut_background4"]];
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld",row + 1];
    
    return cell;
}

@end
