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
    return cell;
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
}

@end
