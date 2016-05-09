//
//  CNNewCarViewController.m
//  Car_News
//
//  Created by caohongyang on 16/4/28.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNNewCarViewController.h"
#import "CNNewCarCell.h"
#import "CNNewCarViewModel.h"

@interface CNNewCarViewController() <UITableViewDelegate, UITableViewDataSource>

/** 数据 */
@property (nonatomic,strong) CNNewCarViewModel *carVM;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CNNewCarViewController

#pragma mark -- Lazy Load
- (CNNewCarViewModel *)carVM {
    if (!_carVM) {
        _carVM = [CNNewCarViewModel new];
    }
    return _carVM;
}
#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.carVM.carList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CNNewCarCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CNNewCarCell class]) forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    cell.nameLabel.text = [self.carVM getCarNameForIndex:row];
    cell.priceLabel.text = [self.carVM getCarPriceForIndex:row];
    [cell.carImageView sd_setImageWithURL:[self.carVM getCarImageForIndex:row] placeholderImage:[UIImage imageNamed:@"defalut_background8"]];
    return cell;
}
/** 表格可以自适应 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"上市新车";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // 1.先设定一个cell高度的估计值，这个值随意，只是为了让系统能够先预定tableView的整体高度
    //self.tableView.estimatedRowHeight = 80;
    // 2.设置tableView的实际行高要根据自动布局产生的高度决定
    //self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.carVM getNewCarCompletionHandler:^(NSError *error) {
        if (error) {
            [self.view showWarning:error.localizedDescription];
        } else {
            [self.tableView reloadData];
        }
        [self.tableView reloadData];
    }];
}
@end
