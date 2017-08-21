//
//  SelectCarViewController.m
//  AutoNews
//
//  Created by caohongyang on 16/4/4.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNSelectCarViewController.h"
#import "CNSelectCarViewModel.h"
#import "CNSelectCarModel.h"
#import "CNAlertViewController.h"
#import "CNMoreViewController.h"
#import "CNCarRankingController.h"
#import "CNNewCarViewController.h"
#import "CNCarSearchController.h"
#import "CNCarSerialListWMPageViewController.h"

#define kItemIconTag 10
#define kItemLabelTag 20
#define kCellIconTag 100
#define kCellLabelTag 200
#define kCellPriceLabelTag 300

@interface CNSelectCarViewController()<UITableViewDelegate,UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,CNAlertViewDelegate>
#pragma mark -- 控件
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
#pragma mark -- 属性
/** 城市选择按钮 */
@property (weak, nonatomic) IBOutlet UIBarButtonItem *currentCityButton;
- (IBAction)moreButtonClicked:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *moreButton;
/** 定时器 */
@property (nonatomic,strong) NSTimer *timer;
/** 选车数据 */
@property (nonatomic,strong) CNSelectCarViewModel *selectCarVM;
/** item高度 */
@property (nonatomic,assign) CGFloat lineSpace;
/** 分区个数 */
@property (nonatomic,strong) NSMutableArray *sectionNumber;
/** 分区的行数 */
@property (nonatomic,assign) NSInteger sectionRowNumber;
/** 分区对应的行数 */
@property (nonatomic,strong) NSMutableDictionary *sectionDict;
/** 当前城市的ID */
@property (nonatomic,assign) NSInteger currentCityId;
/** 数据库 */
@property (nonatomic,strong) FMDatabase *database;

@end

@implementation CNSelectCarViewController

#pragma mark -- Lazy Load 懒加载
- (CNSelectCarViewModel *)selectCarVM{
    if (!_selectCarVM) {
        _selectCarVM = [CNSelectCarViewModel new];
    }
    return _selectCarVM;
}
- (CGFloat)lineSpace {
    return kScreenW / 3;
}
- (NSMutableArray *)sectionNumber {
    if (!_sectionNumber) {
        _sectionNumber = [NSMutableArray array];
    }
    return _sectionNumber;
}
- (NSMutableDictionary *)sectionDict {
    if (!_sectionDict) {
        _sectionDict = @{}.mutableCopy;
    }
    return _sectionDict;
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
#pragma mark -- CNAlertViewDelegate
- (void)alertViewController:(UIViewController *)alertView selectRowNumber:(NSInteger)number {
    switch (number) {
        case 0: {
            CNCarRankingController *carRankingVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNCarRankingController class])];
            [self.navigationController pushViewController:carRankingVC animated:YES];
            break;
        }
        case 1: {
            CNNewCarViewController *carVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNNewCarViewController class])];
            [self.navigationController pushViewController:carVC animated:YES];
            break;
        }
        case 2: {
            CNCarSearchController *carVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNCarSearchController class])];
            [self.navigationController pushViewController:carVC animated:YES];
            break;
        }
        default:
            break;
    }
}
#pragma mark -- UICollectionView Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return section == 0 ? self.selectCarVM.hotMaster.count :self.selectCarVM.hotSerial.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    UIImageView *iconIV = [(UIImageView *)cell.contentView viewWithTag:kItemIconTag];
    UILabel *brandLB = [(UILabel *)cell.contentView viewWithTag:kItemLabelTag];
    switch (indexPath.section) {
        case 0:
            [iconIV setImageURL:[self.selectCarVM hotMasterIconURLForIndex:indexPath.row]];
            brandLB.text = [self.selectCarVM hotMasterTitleForIndex:indexPath.row];
            break;
        case 1:
            [iconIV setImageURL:[self.selectCarVM hotSerialIconURLForIndex:indexPath.row]];
            brandLB.text = [self.selectCarVM hotSerialTitleForIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MYLog(@"选中了%ld",indexPath.item);
    if (indexPath.section == 0) {
        SelectCarHotMasterModel *data = self.selectCarVM.hotMaster[indexPath.row];
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
        CGRect bounds = cell.bounds;
        bounds.size.width = 100;
        bounds.origin = CGPointMake(20, 30);
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 30, 100, 50)];
        view.backgroundColor = [UIColor clearColor];
        [self.view addSubview:view];
        CNAlertViewController *vc = [[CNAlertViewController alloc] initWithSourceView:view sourceRect:bounds];
        vc.data = data;
        [self presentViewController:vc animated:YES completion:nil];
    } else {
//        SelectCarHotSerialModel *data = self.selectCarVM.hotSerial[indexPath.row];
        CNCarSerialListWMPageViewController *vc = [[CNCarSerialListWMPageViewController alloc] init];
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
        [CNTransferInfo sharedCNTransferInfo].serialName = [self.selectCarVM hotSerialTitleForIndex:indexPath.row];
        [CNTransferInfo sharedCNTransferInfo].serialId = self.selectCarVM.hotSerial[indexPath.row].serialId.integerValue;
        [self presentViewController:navi animated:YES completion:nil];
    }
}
/** 设置每行显示的个数 */
/** 行间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
/** 边距 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
//    return UIEdgeInsetsMake( self.lineSpace * 0.5, 0, self.lineSpace * 0.5, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.lineSpace, 80);
}
#pragma mark -- UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    /** 获取section的个数 */
    for (NSInteger i=0; i<self.selectCarVM.carsList.count; i++) {
        /** 去掉重复的元素 */
        if (![self.sectionNumber containsObject:[self.selectCarVM initialOfCarForIndex:i]]) {
            [self.sectionNumber addObject:[self.selectCarVM initialOfCarForIndex:i]];
        }
    }
    
    return self.sectionNumber.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.sectionRowNumber = 0;
     NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    for (NSInteger i=0; i<self.sectionNumber.count; i++) {
        if (section == i) {
            for (NSInteger j=0; j<self.selectCarVM.carsList.count; j++) {
                if ([[self.selectCarVM initialOfCarForIndex:j] isEqualToString:self.sectionNumber[i]]) {
                    self.sectionRowNumber++ ;
                }
            }
            [dictionary setValue:@(self.sectionRowNumber) forKey:self.sectionNumber[i]];
        }
    }
    //向字典对象中添加整个字典对象
    [self.sectionDict addEntriesFromDictionary:dictionary];
    return self.sectionRowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
     cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    UIImageView *iconIV = (UIImageView *)[cell.contentView viewWithTag:kCellIconTag];
    UILabel *brandLB = (UILabel *)[cell.contentView viewWithTag:kCellLabelTag];
    NSInteger tmp = indexPath.row;
    if (indexPath.section == 0) {
        [iconIV sd_setImageWithURL:[self.selectCarVM logoURLOfCarForIndex:tmp] placeholderImage:[UIImage imageNamed:@"logo_rolls"]];
        brandLB.text = [self.selectCarVM nameOfCarForIndex:tmp];
    } else {
        NSInteger lineNumber = 0;
        for (NSInteger i=0; i<indexPath.section; i++) {
            lineNumber += [self.sectionDict[self.sectionNumber[i]] integerValue];
        }
        [iconIV sd_setImageWithURL:[self.selectCarVM logoURLOfCarForIndex:lineNumber+tmp] placeholderImage:[UIImage imageNamed:@"logo_rolls"]];
        brandLB.text = [self.selectCarVM nameOfCarForIndex:lineNumber+tmp];
    }
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sectionNumber[section];
}
/** 增加目录 */
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.sectionNumber;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    //MYLog(@"%@",indexPath);
    /** 数据 */
    CarsListDataModel *model = nil;
    if (indexPath.section == 0) {/** 如果是第一个分区 就正常取 */
       model = self.selectCarVM.carsList[indexPath.row];
    } else{/** 如果不是 就根据分区号 及行号取() */
        NSInteger lineNumber = 0;
        for (NSInteger i=0; i<indexPath.section; i++) {
            lineNumber = lineNumber + [self.sectionDict[self.sectionNumber[i]] integerValue];
        }
        model = self.selectCarVM.carsList[indexPath.row + lineNumber];
    }
    /** 弹出CNAlertViewController */
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    CGRect bounds = cell.bounds;
    bounds.size.width = 100;
    CNAlertViewController *vc = [[CNAlertViewController alloc] initWithSourceView:cell sourceRect:bounds];
    vc.dataModel = model;
    [self presentViewController:vc animated:YES completion:nil];
    
}
#pragma mark -- Methods 方法
- (void)cityChanged {
    self.currentCityButton.title = kCurrentCity;
}
/** 添加定时器 */
- (void)addTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}
/** 删除定时器 */
- (void)removeTimer {
    [self.timer invalidate];
    self.timer = nil;
}
- (void)nextPage {
    /** 获取当前正在展示的位置 */
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    /** 马上显示回中间的那组数据 */
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:currentIndexPath.section];
    [self.collectionView scrollToItemAtIndexPath:currentIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    /** 计算出下一个需要展示的位置 */
    NSInteger nextItem = currentIndexPathReset.item + 1;
    NSInteger nextSection = currentIndexPathReset.section;
    if (nextItem >= self.selectCarVM.hotMaster.count || nextItem >= self.selectCarVM.hotSerial.count) {
        nextItem = 0;
        nextSection ++;
    }
    if (nextSection > 1) {
        nextItem = 0;
        nextSection = 0;
    }
    /** 通过动画滚动到下一个位置 */
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
}
#pragma mark -- 当用户停止滚动的时候
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self addTimer];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}
#pragma mark -- Data Base
/** 创建数据库和表 */
- (void)createDataBase {
    if ([self.database open]) {
        BOOL isASuccess = [self.database executeUpdate:@"create table if not exists CarsInfo (id integer primary key, logoUrl text, uv integer, masterId integer, name text, initial text)"];
        if (!isASuccess) {
            MYLog(@"创建表失败：%@",self.database.lastError);
        }
    }
    [self.database close];
}
/** 插入数据 */
- (void)insertData {
    if ([self.database open]) {
        for (int i = 0 ; i < self.selectCarVM.carsList.count; i++) {
            BOOL isSuccess = [self.database executeUpdate:[NSString stringWithFormat:@"insert into CarsInfo (logoUrl, uv, masterId, name, initial) values ('%@','%ld','%ld','%@','%@')",self.selectCarVM.carsList[i].logoUrl, self.selectCarVM.carsList[i].uv, self.selectCarVM.carsList[i].masterId, self.selectCarVM.carsList[i].name, self.selectCarVM.carsList[i].initial]];
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
        BOOL isSuccess = [self.database executeUpdate:@"delete from CarsInfo"];
        if (!isSuccess) {
            MYLog(@"删除数据失败:%@",self.database.lastError);
        }
    }
    [self.database close];
}
/** 查询数据 */
- (void)selectData {
    if ([self.database open]) {
        FMResultSet *resultSet = [self.database executeQuery:@"select * from CarsInfo"];
        while ([resultSet next]) {
            /** 从记录中获取每个字段（根据不同的字段类型选择不同的方法） */
            CarsListDataModel *model = [CarsListDataModel new];
            model.logoUrl = [resultSet stringForColumn:@"logoUrl"];
            model.uv = [resultSet intForColumn:@"uv"];
            model.masterId = [resultSet intForColumn:@"masterId"];
            model.name = [resultSet stringForColumn:@"name"];
            model.initial = [resultSet stringForColumn:@"initial"];
            [self.selectCarVM.carsList addObject:model];
        }
    }
    [self.database close];
}
/** 更新数据(未使用) */
- (void)updateData {
    if ([self.database open]) {
        BOOL isSuccess = [self.database executeUpdate:@"update CarsInfo set type='' where id=2"];
        if (!isSuccess) {
            MYLog(@"更改数据失败:%@",self.database.lastError);
        }
    }
}

#pragma mark -- Life Circle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self selectData];
    BOOL result = self.selectCarVM.carsList.count > 0;
    if (result) {
        MYLog(@"CarsInfo已经存在");
        [self.tableView reloadData];
    } else {
        [self createDataBase];
    }
    [self.tableView addHeaderRefresh:^{
        /** 热门车型 */
        [self.selectCarVM getMasterSelectWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            }else{
                [self.collectionView reloadData];
            }
            [self.tableView endHeaderRefresh];
        }];
        /** 热门车系 */
        [self.selectCarVM getSerialSelectWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            }else{
                [self.collectionView reloadData];
            }
            [self.tableView endHeaderRefresh];
        }];
        /** 获取车型数据 */
        [self.selectCarVM getCarslistCompetionHandler:^(NSError *error) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            }else{
                [self.tableView reloadData];
                [self deleteData];
                [self insertData];
            }
        }];
         [self.tableView endHeaderRefresh];
    }];
    [self.tableView beginHeaderRefresh];
    [self.tableView addBackFooterRefresh:^{
        [self.selectCarVM getMasterSelectWithRequestMode:RequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            }else{
                [self.tableView reloadData];
                [self deleteData];
                [self insertData];
            }
            [self.tableView endFooterRefresh];
        }];
    }];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.contentSize = CGSizeMake(self.view.bounds.size.width * 2, self.collectionView.bounds.size.height);
    [self addTimer];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.currentCityButton.title = kCurrentCity;
    /** 监听城市变化 */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityChanged) name:kCurrentCityChangedNotification object:nil];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    /** 删除通知 */
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kCurrentCityChangedNotification object:nil];
}
/** 更多按钮 */
- (IBAction)moreButtonClicked:(UIBarButtonItem *)sender {
    CGRect bounds = sender.accessibilityFrame;
    bounds.origin.x = kScreenW - 30;
    bounds.origin.y -= 10;
    UIView *view = [[UIView alloc] initWithFrame:bounds];
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    bounds.origin.x = 0;
    bounds.origin.y = 0;
    CNMoreViewController *vc = [[CNMoreViewController alloc] initWithSourceView:view bySourceRect:bounds andContentSize:CGSizeMake(200, 240) andDirection:UIPopoverArrowDirectionUp];
    vc.delegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}
@end
