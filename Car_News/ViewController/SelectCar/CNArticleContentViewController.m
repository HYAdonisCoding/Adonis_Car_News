//
//  CNArticleContentViewController.m
//  Car_News
//
//  Created by caohongyang on 16/5/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNArticleContentViewController.h"
#import "CNArticleContentViewModel.h"
#import "CNContentCell.h"

@interface CNArticleContentViewController() <UITableViewDelegate,UITableViewDataSource>

/** 表格 */
@property (nonatomic,strong) UITableView *tableView;
/** 数据 */
@property (nonatomic,strong) CNArticleContentViewModel *articleContentVM;

@end
@implementation CNArticleContentViewController

#pragma mark -- Lazy Load
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[CNContentCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _tableView;
}
- (CNArticleContentViewModel *)articleContentVM {
    if (!_articleContentVM) {
        _articleContentVM = [CNArticleContentViewModel new];
    }
    return _articleContentVM;
}
#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.articleContentVM.contentList.count ? self.articleContentVM.contentList.count : 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CNContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSURL *url = [NSURL URLWithString:[self.articleContentVM getArticleContentTextAndURLForIndex:indexPath.row]];
    if (url) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"defalut_background8"]];
        //原始图片的宽高
        CNArticleContentDataModelContentStyleModel * style = self.articleContentVM.contentList[indexPath.row].style.firstObject;
        NSInteger height = style.height;
        NSInteger width = style.width;
        /** 使用Label的富文本显示图片 */
        NSTextAttachment *attachment = [NSTextAttachment new];
        attachment.bounds = CGRectMake(0, 0, kScreenW - 20, (kScreenW - 20) * height / width);
        attachment.image = imageView.image;
        NSAttributedString *attributedStr = [NSAttributedString attributedStringWithAttachment:attachment];
        cell.label.attributedText = attributedStr;
    } else {
        cell.label.text = [self.articleContentVM getArticleContentTextAndURLForIndex:indexPath.row];
    }
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.model.title;
}

#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"文章内容";
    /** 返回按钮设置成白色 */
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    WK(weakSelf);
    [self.tableView addHeaderRefresh:^{
        [weakSelf.articleContentVM getArticleContentWithNewsId:weakSelf.model.newsId LastModify:weakSelf.model.lastModify completionHandler:^(NSError *error) {
            if (error) {
                [weakSelf.view showWarning:error.localizedDescription];
            } else {
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    self.tableView.estimatedRowHeight = 80;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

@end
