//
//  CNAlbumViewController.m
//  Car_News
//
//  Created by caohongyang on 16/5/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNAlbumViewController.h"
#import "CNNewsAlbumListViewModel.h"
#import "CNAlbumListCell.h"
#import "CNDetailAlbumViewController.h"

@interface CNAlbumViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 数据 */
@property (nonatomic,strong) CNNewsAlbumListViewModel *newsAlbumListVM;
@end

@implementation CNAlbumViewController

#pragma mark -- Lazy Load
- (CNNewsAlbumListViewModel *)newsAlbumListVM {
    if (!_newsAlbumListVM) {
        _newsAlbumListVM = [CNNewsAlbumListViewModel new];
    }
    return _newsAlbumListVM;
}
#pragma mark --  UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsAlbumListVM.albumList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CNAlbumListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CNAlbumListCell class]) forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    cell.titleLabel.text = [self.newsAlbumListVM getAlbumTitleWithIndex:row];
    cell.mediaLabel.text = [self.newsAlbumListVM getAlbumSrcWithIndex:row];
    cell.commentLabel.text = [NSString stringWithFormat:@"%ld",[self.newsAlbumListVM getAlbumCommentCountWithIndex:row]];
    [cell.firstImageView sd_setImageWithURL:[self.newsAlbumListVM getAlbumFirstWithIndex:row] placeholderImage:[UIImage imageNamed:@"defalut_background3"]];
    [cell.secondImageView sd_setImageWithURL:[self.newsAlbumListVM getAlbumSecondWithIndex:row] placeholderImage:[UIImage imageNamed:@"defalut_background3"]];
    [cell.thirdImageView sd_setImageWithURL:[self.newsAlbumListVM getAlbumThirdWithIndex:row] placeholderImage:[UIImage imageNamed:@"defalut_background3"]];
    return cell;
}
/** 表格可以自适应 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
/** 推出下一级界面，并传值 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"detail" sender:self.newsAlbumListVM.albumList[indexPath.row]];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id destVC = segue.destinationViewController;
    if ([destVC isKindOfClass:[CNDetailAlbumViewController class]]) {
        CNDetailAlbumViewController *vc = (CNDetailAlbumViewController *)destVC;
        vc.data = sender;
    }
}
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView addHeaderRefresh:^{
        [self.newsAlbumListVM getAlbumListWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
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
        [self.newsAlbumListVM getAlbumListWithRequestMode:RequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            } else {
                [self.tableView reloadData];
            }
            [self.tableView endFooterRefresh];
        }];
    }];
}




@end
