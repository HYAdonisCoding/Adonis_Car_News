//
//  CNAlertViewController.m
//  Car_News
//
//  Created by caohongyang on 16/4/17.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNAlertViewController.h"
#import "CNAlertViewModel.h"
#import "CNCarSerialCell.h"
#import "CNTransferInfo.h"
#import "CNCarSerialListWMPageViewController.h"

@interface CNAlertViewController () <UIPopoverPresentationControllerDelegate,UITableViewDelegate,UITableViewDataSource>

/** 表格 */
@property (nonatomic,strong) UITableView *tableView;
/** 数据源 */
@property (nonatomic,strong) CNAlertViewModel *alertVM;
/** 分区数 */
@property (nonatomic,assign) NSInteger sectionNumber;
/** 分区的行数 */
@property (nonatomic,assign) NSInteger sectionRowNumber;
/** 分区对应的行数 */
@property (nonatomic,strong) NSMutableDictionary *sectionDict;

@end

@implementation CNAlertViewController

#pragma mark -- Lazy Load
- (NSMutableDictionary *)sectionDict {
    if (!_sectionDict) {
        _sectionDict = @{}.mutableCopy;
    }
    return _sectionDict;
}
- (CNAlertViewModel *)alertVM {
    if (!_alertVM) {
        _alertVM = [CNAlertViewModel new];
    }
    return _alertVM;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView registerClass:[CNCarSerialCell class] forCellReuseIdentifier:@"cell"];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _tableView;
}

#pragma mark -- UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    self.sectionNumber = self.alertVM.data.count + 1;
    return self.sectionNumber ? self.sectionNumber : 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numberOfRows = 0;
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    /** 获取Section的个数 */
    if (section == 0) {
        numberOfRows = self.alertVM.data.firstObject.serialList.count ? 1 :  0;
        self.sectionRowNumber = numberOfRows;
    }
    else {
    for (NSInteger i=0; i<self.alertVM.data.count; i++) {
        if (section == i + 1) {
            numberOfRows = self.alertVM.data[i].serialList.count;
            self.sectionRowNumber = numberOfRows;
        }
     }
    }
    [dictionary setObject:@(self.sectionRowNumber) forKey:@(section)];
    [self.sectionDict addEntriesFromDictionary:dictionary];
    return self.sectionRowNumber ? self.sectionRowNumber : 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CNCarSerialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    if (indexPath.section == 0) {
        cell = [[UITableViewCell alloc] init];
        NSURL *url = [NSURL URLWithString:self.dataModel.logoUrl];
        if (!url) {
            url = [NSURL URLWithString:self.data.picURL];
        }
        [cell.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"logo_rolls"]];
        
        cell.textLabel.text = [[self.alertVM getBrandNameForIndex:indexPath.row] stringByAppendingString:@" 品牌介绍"];
    } else if (indexPath.section == 1) {
        [cell.iconImageView sd_setImageWithURL:[self.alertVM getIconURLForIndex:indexPath.row] placeholderImage:[UIImage imageNamed:@"defalut_background3"]];
        cell.nameLabel.text = [self.alertVM getSerialNameForIndex:indexPath.row];
        cell.dealerPriceLabel.text = [self.alertVM getDealerPriceForIndex:indexPath.row];
    } else {
        NSInteger lineNumber = 0;
        for (NSInteger i=0; i<indexPath.section; i++) {
            lineNumber += [self.sectionDict[@(i)] integerValue];
        }
        [cell.iconImageView sd_setImageWithURL:[self.alertVM getIconURLForIndex:indexPath.row + lineNumber-1] placeholderImage:[UIImage imageNamed:@"defalut_background3"]];
        cell.nameLabel.text = [self.alertVM getSerialNameForIndex:indexPath.row + lineNumber-1];
        cell.dealerPriceLabel.text = [self.alertVM getDealerPriceForIndex:indexPath.row + lineNumber-1];
    }
    
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    /** 第一个分区没有分区头 */
    if (section == 0) {
        return nil;
    }
    return [self.alertVM getBrandNameForIndex:section-1];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UINavigationController *brandNavi = [storyboard instantiateViewControllerWithIdentifier:@"BrandNavigation"];
        [CNTransferInfo sharedCNTransferInfo].masterId = self.dataModel.masterId;
        if (![CNTransferInfo sharedCNTransferInfo].masterId) {
            [CNTransferInfo sharedCNTransferInfo].masterId = self.data.masterId.integerValue;
        }
        [self presentViewController:brandNavi animated:YES completion:nil];
    } else {
        CNCarSerialListWMPageViewController *vc = [[CNCarSerialListWMPageViewController alloc] init];
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
        if (indexPath.section == 1) {
            [CNTransferInfo sharedCNTransferInfo].model = self.alertVM.serialList[indexPath.row];
        } else {
            NSInteger lineNumber = 0;
            for (NSInteger i=0; i<indexPath.section; i++) {
                lineNumber += [self.sectionDict[@(i)] integerValue];
            }
            [CNTransferInfo sharedCNTransferInfo].model = self.alertVM.serialList[indexPath.row + lineNumber - 1];
        }
        
        [self presentViewController:navi animated:YES completion:nil];
        
    }
}

#pragma mark -- UIPopoverControllerDelegate
/** 要让弹出效果在iPhone下生效 */
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    return UIModalPresentationNone;
}
- (instancetype)initWithSourceView:(UIView *)sourceView sourceRect:(CGRect)sourceRect {
    self = [super init];
    if (self) {
        _sourceRect = sourceRect;
        _sourceView = sourceView;
        /** 设置当前控制器的弹出方式 */
        self.modalPresentationStyle = UIModalPresentationPopover;
        self.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
        self.popoverPresentationController.delegate = self;
        self.popoverPresentationController.sourceView = _sourceView;
        self.popoverPresentationController.sourceRect = _sourceRect;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(self.view.bounds.size.width*0.7, self.view.bounds.size.height);
    NSInteger masterId = (NSInteger)self.dataModel.masterId;
    if (!masterId) {
        masterId = self.data.masterId.integerValue;
    }
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.alertVM getSerialListWithMasterId:masterId CompletionHandler:^(NSError *error) {
        if (error) {
            [self.view showWarning:error.localizedDescription];
        } else {
            [self.tableView reloadData];
        }
    }];
    // 为了让tableView自适应高度需要设置如下两个属性：
    // 1.先设定一个cell高度的估计值，这个值随意，只是
    // 为了让系统能够先预定tableView的整体高度
    self.tableView.estimatedRowHeight = 40;
    // 2.设置tableView的实际行高要根据自动布局产生的高度决定
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

@end
