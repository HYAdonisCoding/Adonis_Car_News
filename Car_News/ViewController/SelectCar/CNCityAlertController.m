//
//  CNCityAlertController.m
//  Car_News
//
//  Created by caohongyang on 16/4/22.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCityAlertController.h"

@interface CNCityAlertController() <UITableViewDelegate, UITableViewDataSource>

/** 表格 */
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation CNCityAlertController

#pragma mark -- Lazy Load 
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _tableView;
}
#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.modelList[indexPath.row].cityName;
    /** 选中后打对号 */
    NSString *currentCity = [[NSUserDefaults standardUserDefaults] objectForKey:kCurrentCityName];
    cell.accessoryType = [currentCity isEqualToString:cell.textLabel.text]? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /** 按下去高亮,松手后正常 */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    /** 保存城市名称 */
    [[NSUserDefaults standardUserDefaults] setObject:self.modelList[indexPath.row].cityName forKey:kCurrentCityName];
    /** 保存城市Id */
    [[NSUserDefaults standardUserDefaults] setObject:@(self.modelList[indexPath.row].cityId) forKey:kCurrentCityId];
    /** 同步数据 */
    [[NSUserDefaults standardUserDefaults] synchronize];
    /** 发送全局通知 */
    [[NSNotificationCenter defaultCenter] postNotificationName:kCurrentCityChangedNotification object:nil];
    /** 选中后打对号 */
    [tableView reloadData];
}
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
}

@end
