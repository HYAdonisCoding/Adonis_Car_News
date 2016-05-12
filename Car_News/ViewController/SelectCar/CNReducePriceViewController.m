//
//  CNReducePriceViewController.m
//  Car_News
//
//  Created by caohongyang on 16/5/12.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNReducePriceViewController.h"
#import "CNReducePriceCell.h"
#import "CNReducePriceViewModel.h"
#import "CNReduceDetailViewController.h"

@interface CNReducePriceViewController() <UITableViewDelegate, UITableViewDataSource>

/** 表格 */
@property (nonatomic,strong) UITableView *tableView;
/** 数据源 */
@property (nonatomic,strong) CNReducePriceViewModel *reducePriceVM;

@end
@implementation CNReducePriceViewController
#pragma mark -- Lazy Load
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[CNReducePriceCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _tableView;
}
- (CNReducePriceViewModel *)reducePriceVM {
    if (!_reducePriceVM) {
        _reducePriceVM = [CNReducePriceViewModel new];
    }
    return _reducePriceVM;
}
#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.reducePriceVM.priceList.count ? self.reducePriceVM.priceList.count : 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CNReducePriceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    cell.carNameLabel.text = [self.reducePriceVM getCarNameForIndex:row];
    cell.actPriceLabel.text = [self.reducePriceVM getActPriceForIndex:row];
    cell.referPriceLabel.text = [self.reducePriceVM getReferPriceForIndex:row];
    cell.favPriceLabel.text = [self.reducePriceVM getFavPriceForIndex:row];
    cell.dealerNameLabel.text = [self.reducePriceVM getDealerNameForIndex:row];
    cell.storeStateLabel.text = [self.reducePriceVM getStoreStateForIndex:row];
    cell.saleRegionLabel.text = [self.reducePriceVM getSaleRegionForIndex:row];
    cell.callCenterNumberLabel.text = [self.reducePriceVM getCallCenterNumberForIndex:row];
    cell.consultLabel.text = @"询底价";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSURL *url = [NSURL URLWithString:self.reducePriceVM.priceList[indexPath.row].NewsUrl];
    UIStoryboard *storyboard = [UIApplication sharedApplication].keyWindow.rootViewController.storyboard;
    CNReduceDetailViewController *vc = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNReduceDetailViewController class])];
    vc.url = url;
    vc.title = @"降价详情";
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    WK(weakSelf);
    [self.tableView addHeaderRefresh:^{
        [weakSelf.reducePriceVM getReducePriceDataWithSort:weakSelf.sort andRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
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
        [weakSelf.reducePriceVM getReducePriceDataWithSort:weakSelf.sort andRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                [weakSelf.view showWarning:error.localizedDescription];
            } else {
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

@end
