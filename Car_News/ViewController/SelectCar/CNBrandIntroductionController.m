//
//  CNBrandIntroductionController.m
//  Car_News
//
//  Created by caohongyang on 16/4/26.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNBrandIntroductionController.h"
#import "CNNetManager.h"
#import "CNTransferInfo.h"

#define kTag 100

@interface CNBrandIntroductionController() <UITableViewDelegate, UITableViewDataSource>
/** 品牌介绍 */
@property (nonatomic,strong) NSString *introduction;
/** 图标含义 */
@property (nonatomic,strong) NSString *logoMeaning;
/** 品牌 */
@property (nonatomic,strong) NSString *name;
- (IBAction)gobackBtnClicked:(UIBarButtonItem *)sender;

@end

@implementation CNBrandIntroductionController

#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    NSInteger masterId = [CNTransferInfo sharedCNTransferInfo].masterId;
    [CNNetManager getBrandIntroductionWithMasterId:masterId CompletionHandler:^(CNBrandIntroductionDataModel *model, NSError *error) {
        if (!error) {
            self.introduction = model.introduction;
            self.logoMeaning = model.logoMeaning;
            self.name = model.masterName;
            
        } else {
            MYLog(@"%@",error.userInfo);
        }
        self.navigationItem.title = self.name;
        [self.tableView reloadData];
    }];
    // 为了让tableView自适应高度需要设置如下两个属性：
    // 1.先设定一个cell高度的估计值，这个值随意，只是
    // 为了让系统能够先预定tableView的整体高度
    self.tableView.estimatedRowHeight = 70;
    // 2.设置tableView的实际行高要根据自动布局产生的高度决定
    self.tableView.rowHeight = UITableViewAutomaticDimension;;
}
#pragma mark -- UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *label = [cell.contentView viewWithTag:kTag];
    if (indexPath.section == 0) {
        if (self.introduction.length > 0) {
            label.text = self.introduction;
        } else {
            label.text = @"无";
        }
    }
    if (indexPath.section == 1) {
        if (self.logoMeaning.length > 0) {
            label.text = self.logoMeaning;
        } else {
            label.text = @"无";
        }
    }
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @[@"品牌介绍",@"车标含义"][section];
}

- (IBAction)gobackBtnClicked:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
