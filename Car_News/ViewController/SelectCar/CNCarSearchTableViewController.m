//
//  CNCarSearchTableViewController.m
//  Car_News
//
//  Created by caohongyang on 16/4/28.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCarSearchTableViewController.h"
#import "CNNewCarCell.h"
#import "CNCarSearchViewModel.h"
#import "CNCarSerialListWMPageViewController.h"
#import "CNTransferInfo.h"

@interface CNCarSearchTableViewController ()

/** 数据 */
@property (nonatomic,strong) CNCarSearchViewModel *carSearchVM;
@end

@implementation CNCarSearchTableViewController

#pragma mark -- Lazy Load
- (CNCarSearchViewModel *)carSearchVM {
    if (!_carSearchVM) {
        _carSearchVM = [CNCarSearchViewModel new];
    }
    return _carSearchVM;
}
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"%@",self.keyword];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.tableView.estimatedRowHeight = 70;
    WK(weakSelf);
    [self.tableView addHeaderRefresh:^{
        [weakSelf.carSearchVM geCarSearchWithRequestMode:RequestModeRefresh andKeyword:weakSelf.keyword completionHandler:^(NSError *error) {
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
        [weakSelf.carSearchVM geCarSearchWithRequestMode:RequestModeRefresh andKeyword:weakSelf.keyword completionHandler:^(NSError *error) {
            if (error) {
                [weakSelf.view showWarning:error.localizedDescription];
            } else {
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.carSearchVM.resultList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CNNewCarCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CNNewCarCell class]) forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    cell.nameLabel.text = [self.carSearchVM getCarNameForIndex:row];
    cell.priceLabel.text = [self.carSearchVM getCarPriceForIndex:row];
    [cell.carImageView sd_setImageWithURL:[self.carSearchVM getcarIconImageForIndex:row] placeholderImage:[UIImage imageNamed:@"defalut_background4"]];
    return cell;
}
/** 表格可以自适应 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CNCarSerialListWMPageViewController *vc = [[CNCarSerialListWMPageViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    [CNTransferInfo sharedCNTransferInfo].serialName = [self.carSearchVM getCarNameForIndex:indexPath.row];
    [CNTransferInfo sharedCNTransferInfo].serialId = self.carSearchVM.resultList[indexPath.row].csId;
    [self presentViewController:navi animated:YES completion:nil];
}

@end
