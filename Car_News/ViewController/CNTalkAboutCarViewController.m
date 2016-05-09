//
//  CNTalkAboutCarViewController.m
//  Car_News
//
//  Created by caohongyang on 16/5/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNTalkAboutCarViewController.h"
#import "CNMainViewModel.h"
#import "CNNewsCell.h"
#import "CNDetailTalkAboutViewController.h"

@interface CNTalkAboutCarViewController () <UITableViewDelegate, UITableViewDataSource>
/** 数据 */
@property (nonatomic,strong) CNMainViewModel *talkAboutVM;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation CNTalkAboutCarViewController

#pragma mark -- Lazy Load
- (CNMainViewModel *)talkAboutVM {
    if (!_talkAboutVM) {
        _talkAboutVM = [CNMainViewModel new];
    }
    return _talkAboutVM;
}

#pragma mark -- UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.talkAboutVM.newsList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CNNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CNNewsCell class]) forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    [cell.iconImageView sd_setImageWithURL:[self.talkAboutVM iconURLForIndex:row] placeholderImage:[UIImage imageNamed:@"defalut_background1"]];
    cell.titleLabel.text = [self.talkAboutVM titleForIndex:row];
    cell.mediaNameLabel.text = [self.talkAboutVM mediaNameForIndex:row];
    cell.commentNumberLabel.text = [self.talkAboutVM commentNumberForIndex:row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"talkAbout" sender:self.talkAboutVM.newsList[indexPath.row]];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id destVC = segue.destinationViewController;
    if ([destVC isKindOfClass:[CNDetailTalkAboutViewController class]]) {
        CNDetailTalkAboutViewController *vc = (CNDetailTalkAboutViewController *)destVC;
        vc.data = sender;
    }
}
/** 表格可以自适应 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView addHeaderRefresh:^{
        [self.talkAboutVM getNewsWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            } else {
                [self.tableView reloadData];
            }
            [self.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    [self.tableView addBackFooterRefresh:^{
        [self.talkAboutVM getNewsWithRequestMode:RequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            } else {
                [self.tableView reloadData];
            }
            [self.tableView endHeaderRefresh];
        }];
    }];
}

@end
