//
//  DetailNewsViewController.m
//  AutoNews
//
//  Created by caohongyang on 16/4/10.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNDetailNewsViewController.h"
#import "CNDetailNewsViewModel.h"


#define kTagForImageView 100
#define kTagForTextLable 200

@interface CNDetailNewsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 新闻详情 */
@property (nonatomic,strong) CNDetailNewsViewModel *detailNewsVM;
@end

@implementation CNDetailNewsViewController
#pragma mark -- UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.detailNewsVM.newsLine.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textCell" forIndexPath:indexPath];
    NSURL *datailNewsContent = [NSURL URLWithString:self.detailNewsVM.newsLine[indexPath.row].content];
    UILabel *textLabel = (UILabel *)[cell.contentView viewWithTag:kTagForTextLable];
    if (datailNewsContent) {
        UIImageView *newsImageView = [UIImageView new];
        [newsImageView sd_setImageWithURL:datailNewsContent placeholderImage:[UIImage imageNamed:@"defaultImage.jpg"]];
        //原始图片的宽高
        DetailNewsDataContentStyleModel *style = self.detailNewsVM.newsLine[indexPath.row].style.firstObject;
        NSInteger height = style.height;
        NSInteger width = style.width;
        /** 使用Label的富文本显示图片 */
        NSTextAttachment *attachment = [NSTextAttachment new];
        attachment.bounds = CGRectMake(0, 0, kScreenW - 20, width ? (kScreenW - 20) * height / width : height);
        newsImageView.frame = attachment.bounds;
        NSAttributedString *attributedStr = [NSAttributedString attributedStringWithAttachment:attachment];
        textLabel.attributedText = attributedStr;
        [textLabel addSubview:newsImageView];
    } else {
        [textLabel removeAllSubviews];
        [textLabel setText:self.detailNewsVM.newsLine[indexPath.row].content];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /**  按下去高亮,松手后正常 */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/** 表格可以自适应 */
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewAutomaticDimension;
//}
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
//    return UITableViewAutomaticDimension;
//}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.model.title;
}
#pragma mark -- Lazy Load
- (CNDetailNewsViewModel *)detailNewsVM {
    if (!_detailNewsVM) {
        _detailNewsVM = [CNDetailNewsViewModel new];

    }
    return _detailNewsVM;
}
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"新闻详情";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    if (self.model) {
        [self.detailNewsVM getDetailNewsURLWithNewsListlistModel:self.model RequestMode:RequestModeRefresh completionHandler:^(NSError *error, id resobject) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            }else{
                [self.tableView reloadData];
                dispatch_async(dispatch_get_main_queue(), ^{
                    /** 更新界面 */
                    [self.tableView reloadData];
                });
            }
        }];
    }    
    // 为了让tableView自适应高度需要设置如下两个属性：
    // 1.先设定一个cell高度的估计值，这个值随意，只是为了让系统能够先预定tableView的整体高度
    self.tableView.estimatedRowHeight = 140;
    // 2.设置tableView的实际行高要根据自动布局产生的高度决定
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableHeaderView.height = UITableViewAutomaticDimension;
}
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

@end
