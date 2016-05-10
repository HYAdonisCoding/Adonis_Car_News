//
//  CNEvaluatingViewController.m
//  Car_News
//
//  Created by caohongyang on 16/5/3.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNEvaluatingViewController.h"
#import "CNEvaluatingViewModel.h"
#import "CNNewsCell.h"
#import "CNDetailTalkAboutViewController.h"

@interface CNEvaluatingViewController () <UITableViewDelegate, UITableViewDataSource>

/** 数据 */
@property (nonatomic,strong) CNEvaluatingViewModel *evaluatingVM;
/** 表格 */
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CNEvaluatingViewController

#pragma mark -- Lazy Load
- (CNEvaluatingViewModel *)evaluatingVM {
    if (!_evaluatingVM) {
        _evaluatingVM = [CNEvaluatingViewModel new];
    }
    return _evaluatingVM;
}

#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.evaluatingVM.newsList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CNNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    cell.titleLabel.text = [self.evaluatingVM getEvaluatingTitleForIndex:row];
    cell.mediaNameLabel.text = [self.evaluatingVM getEvaluatingMediaNameForIndex:row];
    cell.commentNumberLabel.text = [self.evaluatingVM getEvaluatingCommentNumberForIndex:row];
    [cell.iconImageView sd_setImageWithURL:[self.evaluatingVM getEvaluatingIconURLForIndex:row] placeholderImage:[UIImage imageNamed:@"defalut_background7"]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsListDataListModel *model = self.evaluatingVM.newsList[indexPath.row];
    CNDetailTalkAboutViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNDetailTalkAboutViewController class])];
    vc.data = model;
    vc.categoryId = self.categoryId;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    WK(weakSelf);
    [self.tableView addHeaderRefresh:^{
        [weakSelf.evaluatingVM getNewsWithRequestMode:RequestModeRefresh andCategoryId:self.categoryId completionHandler:^(NSError *error) {
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
        [weakSelf.evaluatingVM getNewsWithRequestMode:RequestModeMore andCategoryId:self.categoryId completionHandler:^(NSError *error) {
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
