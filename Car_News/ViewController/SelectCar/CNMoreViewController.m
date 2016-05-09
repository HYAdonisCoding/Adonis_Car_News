//
//  CNMoreViewController.m
//  Car_News
//
//  Created by caohongyang on 16/4/25.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNMoreViewController.h"

@interface CNMoreViewController ()<UITableViewDelegate, UITableViewDataSource>

/** 表格 */
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation CNMoreViewController

#pragma mark -- Lazy Load
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = kRGBColor(31, 34, 45, 1.0);
        [self.view addSubview:_tableView];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}
#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = kRGBColor(31, 34, 45, 1.0);
    cell.textLabel.textColor = [UIColor whiteColor];
    switch (indexPath.row) {
        case 0: {
            cell.textLabel.text = @"销量排行";
            cell.imageView.image = [UIImage imageNamed:@"CarRanking"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        }
        case 1: {
            cell.textLabel.text = @"新车上市";
            cell.imageView.image = [UIImage imageNamed:@"NewCar"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        }
        case 2: {
            cell.textLabel.text = @"搜索";
            cell.imageView.image = [UIImage imageNamed:@"search"];
            break;
        }
           
        default:
            break;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate alertViewController:self selectRowNumber:indexPath.row];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    self.view.backgroundColor = kRGBColor(31, 34, 45, 1.0);
}


@end
