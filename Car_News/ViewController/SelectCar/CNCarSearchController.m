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

@interface CNCarSearchController() <UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)searchButtonClicked:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
/** 数据 */
@property (nonatomic,strong) NSMutableArray<CNHotSearchDataModel *> *hotList;
@end

@implementation CNCarSearchController

#pragma mark -- Lazy Load 
- (NSMutableArray<CNHotSearchDataModel *> *)hotList {
    if (!_hotList) {
        _hotList = [NSMutableArray array];
    }
    return _hotList;
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
//    CNHotSearchDataModel *model = self.hotList[indexPath.row];
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
#pragma mark -- UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.searchButton.enabled = (text.length > 0);
    return YES;
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
- (IBAction)searchEnter:(UITextField *)sender {
    CNCarSearchTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNCarSearchTableViewController class])];
    vc.keyword = self.searchTextField.text;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)searchButtonClicked:(UIButton *)sender {
    CNCarSearchTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CNCarSearchTableViewController class])];
    vc.keyword = self.searchTextField.text;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
