//
//  MainViewController.m
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNMainViewController.h"
#import "CNNewsListModel.h"
#import "CNNewsCell.h"
#import "CNMainViewModel.h"
#import "CNDetailNewsViewController.h"
#import "CNDetailTalkAboutViewController.h"
#import "CNHeaderAdvertisementViewModel.h"
#import <SDCycleScrollView.h>
#import "UILabel+Auto.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface CNMainViewController() <UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

#pragma mark -- 控件
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *headerView;

#pragma mark -- 属性
/** 新闻列表 */
@property (nonatomic,strong) CNNewsListModel *newsListVM;
/** 新闻 */
@property (nonatomic,strong) CNMainViewModel *mainVM;
/** 轮滑广告 */
@property (nonatomic,strong) CNHeaderAdvertisementViewModel *headerAdVM;
/** 数据库 */
@property (nonatomic,strong) FMDatabase *database;

@end

@implementation CNMainViewController

#pragma mark -- SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    MYLog(@"选中了%ld",index);
    CNDetailNewsViewController *detailNewsVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNDetailNewsViewController class])];
    /** 数据 */
    detailNewsVC.model = self.headerAdVM.advertisementNumber[index];
    /** 推出新闻详情详情 */
    [self.navigationController pushViewController:detailNewsVC animated:YES];
}

#pragma mark -- Lazy Load 懒加载
- (CNHeaderAdvertisementViewModel *)headerAdVM {
    if (!_headerAdVM) {
        _headerAdVM = [CNHeaderAdvertisementViewModel new];
    }
    return _headerAdVM;
}
- (CNNewsListModel *)newsListVM{
    if (!_newsListVM) {
        _newsListVM = [CNNewsListModel new];
    }
    return _newsListVM;
}
- (CNMainViewModel *)mainVM{
    if (!_mainVM) {
        _mainVM = [CNMainViewModel new];
    }
    return _mainVM;
}
- (FMDatabase *)database {
    if (!_database) {
        //1.创建数据库
        NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *dbPath = [documentPath stringByAppendingPathComponent:@"VehiclePressInfo.db"];
        //仅仅是创建数据库文件，并没有打开
        _database = [FMDatabase databaseWithPath:dbPath];
        [_database open];
    }
    return _database;
}
#pragma mark -- UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.headerAdVM.advertisementNumber.count - 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CNNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger row = indexPath.row + 4;
    cell.titleLabel.text = [self.headerAdVM advertisementTitleForIndex:row];
    cell.commentNumberLabel.text = [self.headerAdVM advertisementCommentNumberForIndex:row];
    cell.mediaNameLabel.text = [self.headerAdVM advertisementMediaNameForIndex:row];
    [cell.iconImageView sd_setImageWithURL:[self.headerAdVM advertisementIconForIndex:row]];// placeholderImage:[UIImage imageNamed:@"defalut_background1"]];
    
    /** 去掉Cell的左侧空隙 */
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row + 4;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NewsAdvertisementDataListModel *model = self.headerAdVM.advertisementNumber[row];
    if (model.mp4Link.length > 0) {//独家视屏
        [self playMovie:model.mp4Link];
        return;
    }//其他视屏
    if (model.videoId && model.filePath.length > 0) {
//        NSString *path = [NSString stringWithFormat:@"http://v.bitauto.com/vplay/%ld.html",model.videoId];
        NSString *path = [NSString stringWithFormat:@"http://h5.ycapp.yiche.com/newvideo/100%ld.html?appver=7.0&plat=1&lastmodify=%@",model.videoId,model.lastModify];
        [self playMovieWithPath:path andTitle:model.title];
        return;
    }
    CNDetailNewsViewController *detailNewsVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNDetailNewsViewController class])];
    /** 数据 */
    detailNewsVC.model = model;
    /** 推出新闻详情详情 */
    [self.navigationController pushViewController:detailNewsVC animated:YES];    
}
#pragma mark -- Methods 方法
- (void)playMovieWithPath: (NSString *)path andTitle: (NSString *)title {
    UIViewController *vc = [[UIViewController alloc] init];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:path]];
    [vc.view addSubview:webView];
    [webView loadRequest:request];
    vc.title = @"新闻详情";
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)playMovie:(NSString *)path{
    //视频URL
    NSURL *url = [NSURL URLWithString:path];
    //视频播放对象
    AVPlayer *player = [AVPlayer playerWithURL:url];
    // 此控制器的视图专门用来播放player中的视频
    AVPlayerViewController *vc = [[AVPlayerViewController alloc]init];
    vc.player = player;
    // 从一个vc展示另一个vc，使用present
    [self presentViewController:vc animated:YES completion:nil];
}
/** 头部广告视图 */
- (void)setupAdvertisementView{
    NSMutableArray *iconArray = [NSMutableArray array];
    NSMutableArray *titleArray = [NSMutableArray array];
    for (NSInteger i=0; i<4; i++) {
        [titleArray addObject:[self.headerAdVM advertisementTitleForIndex:i]];
        /** 获取图片 */
        [iconArray addObject:[self.headerAdVM advertisementIconForIndex:i]];
    }
    SDCycleScrollView *scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 180) delegate:self placeholderImage:[UIImage imageNamed:@"defalut_background2"]];
    scrollView.imageURLStringsGroup = iconArray;
    scrollView.titlesGroup = titleArray;
    scrollView.autoScrollTimeInterval = 3;
    scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    [self.headerView addSubview:scrollView];
}
#pragma mark -- Data Base
/** 创建数据库和表 */
- (void)createDataBase {
    [self.database open];
    BOOL isASuccess = [self.database executeUpdate:@"create table if not exists NewsInfo (id integer primary key, title text, picCover text, commentCount integer, scr text, mp4Link text, filePath text, videoId integer, newsId integer, type integer)"];
    if (!isASuccess) {
        MYLog(@"创建表失败：%@",self.database.lastError);
    }
    [self.database close];
}
/** 插入数据 */
- (void)insertData {
    if ([self.database open]) {
        for (int i = 0 ; i < self.headerAdVM.advertisementNumber.count; i++) {
            BOOL isSuccess = [self.database executeUpdate:[NSString stringWithFormat:@"insert into NewsInfo (title, picCover, commentCount, scr, mp4Link, filePath, videoId, newsId, type) values ('%@','%@','%ld','%@','%@','%@','%ld','%ld','%ld')",self.headerAdVM.advertisementNumber[i].title, self.headerAdVM.advertisementNumber[i].picCover, self.headerAdVM.advertisementNumber[i].commentCount, self.headerAdVM.advertisementNumber[i].src, self.headerAdVM.advertisementNumber[i].mp4Link, self.headerAdVM.advertisementNumber[i].filePath, self.headerAdVM.advertisementNumber[i].videoId, self.headerAdVM.advertisementNumber[i].newsId, self.headerAdVM.advertisementNumber[i].type]];
            if (!isSuccess) {
                MYLog(@"插入数据失败:%@",self.database.lastError);
            }
        }
    }
    [self.database close];
}
/** 删除数据 */
- (void)deleteData {
    if ([self.database open]) {
        BOOL isSuccess = [self.database executeUpdate:@"delete from NewsInfo"];
        if (!isSuccess) {
            MYLog(@"删除数据失败:%@",self.database.lastError);
        }
    }
    [self.database close];
}
/** 查询数据 */
- (void)selectData {
    if ([self.database open]) {
        FMResultSet *resultSet = [self.database executeQuery:@"select * from NewsInfo"];
        while ([resultSet next]) {
            /** 从记录中获取每个字段（根据不同的字段类型选择不同的方法） */
            NewsAdvertisementDataListModel *model = [NewsAdvertisementDataListModel new];
            model.title = [resultSet stringForColumn:@"title"];
            model.commentCount = [resultSet intForColumn:@"commentCount"];
            model.src = [resultSet stringForColumn:@"scr"];
            model.mp4Link = [resultSet stringForColumn:@"mp4Link"];
            model.filePath = [resultSet stringForColumn:@"filePath"];
            model.videoId = [resultSet intForColumn:@"videoId"];
            model.newsId = [resultSet intForColumn:@"newsId"];
            model.type = [resultSet intForColumn:@"type"];
            model.picCover = [resultSet stringForColumn:@"picCover"];
            [self.headerAdVM.advertisementNumber addObject:model];
        }
    }
    [self.database close];
}
/** 更新数据(未使用) */
- (void)updateData {
    if ([self.database open]) {
        BOOL isSuccess = [self.database executeUpdate:@"update NewsInfo set type='' where id=2"];
        if (!isSuccess) {
            MYLog(@"更改数据失败:%@",self.database.lastError);
        }
    }
}
#pragma mark -- Life Cycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    [self selectData];
    BOOL result = self.headerAdVM.advertisementNumber.count > 0;
    if (result) {
        MYLog(@"NewsInfo已经存在.");
        [self setupAdvertisementView];
    } else {
        [self createDataBase];
    }
    [self.tableView addHeaderRefresh:^{
        
        [self.headerAdVM getNewsAdvertisementDataListWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error ,id resObject) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            } else {
                [self.tableView reloadData];
                [self setupAdvertisementView];
                [self deleteData];
                [self insertData];
            }
            [self.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    [self.tableView addBackFooterRefresh:^{
//        [self.mainVM getNewsWithRequestMode:RequestModeMore completionHandler:^(NSError *error) {
//            if (error) {
//                [self.view showWarning:error.localizedDescription];
//            }else{
//                [self.tableView reloadData];
//                [self deleteData];
//                [self insertData];
//            }
//            [self.tableView endFooterRefresh];
//        }];
        [self.headerAdVM getNewsAdvertisementDataListWithRequestMode:RequestModeMore completionHandler:^(NSError *error,id resObject) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            } else {
                [self.tableView reloadData];
                [self deleteData];
                [self insertData];
            }
            [self.tableView endFooterRefresh];
        }];
    }];
}

@end