//
//  CNDetailTalkAboutViewController.m
//  Car_News
//
//  Created by caohongyang on 16/5/5.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNDetailTalkAboutViewController.h"
#import "CNDetailTalkAboutViewModel.h"

#define kTagForTextLable 200

@interface CNDetailTalkAboutViewController () <UITableViewDelegate, UITableViewDataSource>

/** 数据 */
@property (nonatomic,strong) CNDetailTalkAboutViewModel *detailTalkAboutVM;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CNDetailTalkAboutViewController

#pragma mark -- Lazy Load
- (CNDetailTalkAboutViewModel *)detailTalkAboutVM {
    if (!_detailTalkAboutVM) {
        _detailTalkAboutVM = [CNDetailTalkAboutViewModel new];
    }
    return _detailTalkAboutVM;
}
#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.detailTalkAboutVM.dataList.count ? self.detailTalkAboutVM.dataList.count : 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:kTagForTextLable];
    NSURL *imageUrl = [NSURL URLWithString:[self.detailTalkAboutVM getDetailtalkAboutTextOrPictureForIndex:indexPath.row]];
    if (imageUrl) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"defalut_background8"]];
        //原始图片的宽高
        CNDetailTalkAboutDataContentStyleModel * style = self.detailTalkAboutVM.dataList[indexPath.row].style.firstObject;
        NSInteger height = style.height;
        NSInteger width = style.width;
        /** 使用Label的富文本显示图片 */
        NSTextAttachment *attachment = [NSTextAttachment new];
        attachment.bounds = CGRectMake(0, 0, kScreenW - 40, (kScreenW - 40) * height / width);
        attachment.image = imageView.image;
        NSAttributedString *attributedStr = [NSAttributedString attributedStringWithAttachment:attachment];
        label.attributedText = attributedStr;
        
    }else {
        label.text = [self.detailTalkAboutVM getDetailtalkAboutTextOrPictureForIndex:indexPath.row];
    }
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.data.title;
}
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
//    return UITableViewAutomaticDimension;
//}
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"说车详情";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.tableView addHeaderRefresh:^{
        [self.detailTalkAboutVM getDetailTalkAboutCarWithNewsListlistModel:self.data categoryId: self.categoryId completionHandler:^(NSError *error) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    /** 更新界面 */
                    [self.tableView reloadData];
                });
            }
            [self.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}


@end
