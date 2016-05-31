//
//  CNCarSearchController.m
//  Car_News
//
//  Created by caohongyang on 16/4/28.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCarSearchController.h"
#import "CNCarSearchTableViewController.h"
#import "CNNetManager.h"
#import "CNCarSerialListWMPageViewController.h"

#define kTag 100
#define kTableViewLabelTag 200
#define kSearchText @"searchText"

@interface CNCarSearchController() <UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)searchButtonClicked:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)clearSearchHistoryBtnClicked:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *clearButtonClicked;
/** 数据 */
@property (nonatomic,strong) NSMutableArray<CNHotSearchDataModel *> *hotList;
/** 搜索历史 */
@property (nonatomic,strong) NSMutableArray *searchHistoryList;
@end

@implementation CNCarSearchController

#pragma mark -- Lazy Load 
- (NSMutableArray<CNHotSearchDataModel *> *)hotList {
    if (!_hotList) {
        _hotList = [NSMutableArray array];
    }
    return _hotList;
}
- (NSMutableArray *)searchHistoryList {
    if (!_searchHistoryList) {
        _searchHistoryList = [NSMutableArray array];
    }
    return _searchHistoryList;
}
#pragma mark -- UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.hotList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:kTag];
    label.text = self.hotList[indexPath.row].serialName;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CNCarSerialListWMPageViewController *vc = [[CNCarSerialListWMPageViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    [CNTransferInfo sharedCNTransferInfo].serialName = self.hotList[indexPath.row].serialName;
    [CNTransferInfo sharedCNTransferInfo].serialId = self.hotList[indexPath.row].serialId.integerValue;
    [self presentViewController:navi animated:YES completion:nil];
}
/** 设置项目的size */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.bounds.size.width / 3, 40);
}
/** 设置表头 */
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
    //设置表头
    return headerView;
    
}
#pragma mark -- UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchHistoryList.count ? self.searchHistoryList.count : 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:kTableViewLabelTag];
    label.text = self.searchHistoryList[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CNCarSearchTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNCarSearchTableViewController class])];
    vc.keyword = self.searchHistoryList[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"搜索历史";
}
#pragma mark -- UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
//    self.searchButton.enabled = (text.length > 0);
    if (text.length > 0) {
        self.searchButton.enabled = YES;
    }
    return YES;
}
#pragma mark -- Method
-(void)saveSearchText :(NSString *)searchTxt {
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    //读取数组NSArray类型的数据
    NSArray *myArray = [userDefaultes arrayForKey:kSearchText];
    if (!myArray) {
        myArray = [NSArray array];
    }
    // NSArray --> NSMutableArray
    NSMutableArray *searchTXT = [myArray mutableCopy];
    [searchTXT addObject:searchTxt];
    //将上述数据全部存储到NSUserDefaults中
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:searchTXT forKey:kSearchText];
}
-(void)readNSUserDefaults {
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    //读取数组NSArray类型的数据
    NSArray *myArray = [userDefaultes arrayForKey:kSearchText];
    self.searchHistoryList = myArray.mutableCopy;
    //MYLog(@"searchHistoryList:%@",self.searchHistoryList);
}
- (IBAction)editingEnd:(UITextField *)sender {
}

#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"搜索";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.searchTextField.delegate = self;
    self.searchButton.enabled = NO;
    [CNNetManager getHotSearchCompletionHandler:^(CNHotSearchModel *model, NSError *error) {
        if (error) {
            [self.view showWarning:error.localizedDescription];
        } else {
            [self.hotList addObjectsFromArray:model.data];
        }
        [self.collectionView reloadData];
    }];
    
}
- (void)viewWillAppear:(BOOL)animated {
    self.searchTextField.text = @"";
    [super viewWillAppear:animated];
    [self readNSUserDefaults];
    self.clearButtonClicked.hidden = self.searchHistoryList.count == 0 ? YES : NO;
    //MYLog(@"count:%ld",self.searchHistoryList.count);
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView reloadData];
    /** 如果搜索历史大于9个，就滚动到底部 */
    if (self.searchHistoryList.count > 9) {
        [self.tableView scrollToBottom];
    }
    
}
/** 回车搜索 */
- (IBAction)searchEnter:(UITextField *)sender {
    CNCarSearchTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNCarSearchTableViewController class])];
    vc.keyword = self.searchTextField.text;
    [self saveSearchText:self.searchTextField.text];
    [self.navigationController pushViewController:vc animated:YES];
}
/** 按钮搜索 */
- (IBAction)searchButtonClicked:(UIButton *)sender {
    CNCarSearchTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNCarSearchTableViewController class])];
    vc.keyword = self.searchTextField.text;
    [self saveSearchText:self.searchTextField.text];
    [self.navigationController pushViewController:vc animated:YES];
}
/** 清除搜索历史 */
- (IBAction)clearSearchHistoryBtnClicked:(UIButton *)sender {
    sender.hidden = YES;
    self.tableView.hidden = YES;
    [self.searchHistoryList removeAllObjects];
    [[NSUserDefaults standardUserDefaults]setObject:nil forKey:kSearchText];
}

@end
