//
//  CNCityListViewController.m
//  Car_News
//
//  Created by caohongyang on 16/4/21.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNCityListViewController.h"
#import "CNCityListViewModel.h"
#import "CNCityAlertController.h"
#import <objc/runtime.h>//使用runtime来让分类也能添加属性

@interface CNCityListViewController() <UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate>
/** 数据 */
@property (nonatomic,strong) CNCityListViewModel *cityListVM;
/** 初始表格行数 */
@property (nonatomic,assign) NSInteger rows;
/** 分区数 */
@property (nonatomic,assign) NSInteger sectionNumber;
/** 分区的行数 */
@property (nonatomic,assign) NSInteger rowDfSection;
/** 数据字典 */
@property (nonatomic,strong) NSMutableDictionary *dataDict;
/** 省的数组 */
@property (nonatomic,strong) NSMutableArray<CNCityListDataListModel *> *allProvinces;
/** 省的地级市 */
@property (nonatomic,strong) NSMutableArray<CNCityListDataListModel *> *allTowns;
/** 省的地级市数组 */
@property (nonatomic,strong) NSMutableArray<NSMutableArray<CNCityListDataListModel *> *> *allCities;
/** 分区头 */
@property (nonatomic,strong) NSArray<NSString *> *allTitles;

@end


@implementation CNCityListViewController

#pragma mark -- Lazy Load
- (NSMutableArray<NSMutableArray<CNCityListDataListModel *> *> *)allCities{
    if (!_allCities) {
        _allCities = [NSMutableArray array];
    }
    return _allCities;
}
- (NSMutableArray<CNCityListDataListModel *> *)allProvinces {
    if (!_allProvinces) {
        _allProvinces = @[].mutableCopy;
    }
    return _allProvinces;
}
- (NSMutableArray<CNCityListDataListModel *> *)allTowns {
    if (!_allTowns) {
        _allTowns = @[].mutableCopy;
    }
    return _allTowns;
}
- (NSMutableDictionary *)dataDict {
    if (!_dataDict) {
        _dataDict = @{}.mutableCopy;
    }
    return _dataDict;
}
- (CNCityListViewModel *)cityListVM {
    if (!_cityListVM) {
        _cityListVM = [CNCityListViewModel new];
    }
    return _cityListVM;
}
- (NSInteger)rows {
        _rows = 0;
    return _rows;
}
- (NSArray<NSString *> *)allTitles {
    if (!_allTitles) {
        _allTitles = @[@"当前定位城市",@"直辖市",@"A",@"F",@"G",@"H",@"J",@"L",@"N",@"Q",@"S",@"X",@"Y",@"Z"];
    }
    return _allTitles;
}
#pragma mark -- UITableViewDelegate
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.allTitles[section];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.allTitles.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    self.sectionNumber = 0;
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return self.allProvinces.count ? 4 : 0;
    } else {
        for (NSInteger i=2; i<self.allProvinces.count; i++) {
            if (section == i) {
                for (NSInteger j=3; j<self.allProvinces.count; j++) {
                    NSString *str1 = self.allTitles[i];
                    NSString *str2 = self.allProvinces[j].engName;
                    if ([str2 hasPrefix:[str1 lowercaseString]]) {
                        self.sectionNumber ++;
                    }
                }
                [dictionary setObject:@(self.sectionNumber) forKey:@(section)];
            }
        }
    }
    [dictionary setObject:@4 forKey:@1];
    [self.dataDict addEntriesFromDictionary:dictionary];
    return self.sectionNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger tmp = indexPath.row;
    if (indexPath.section == 0) {
        cell.textLabel.text = kCurrentCity;
    } else if (indexPath.section == 1) {
        cell.textLabel.text = self.allProvinces[tmp].cityName;
    } else {
        NSInteger lineNumber = 0;
        for (NSInteger i=0; i<indexPath.section; i++) {
            lineNumber += [self.dataDict[@(i)] integerValue];
        }
        cell.textLabel.text = self.allProvinces[lineNumber + tmp].cityName;
    }
    return cell;
}
/** 增加目录 */
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *array = self.allTitles.mutableCopy;
    array[0] = @"#";
    array[1] = @"*";
    return array;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    /** 获取数据 */
    NSArray<CNCityListDataListModel *> *modelList = [NSArray array];
    if (indexPath.section == 0) {
        for (NSInteger i=0; i<self.cityListVM.cityList.count; i++) {
            if ([self.cityListVM.cityList[i].cityName isEqualToString:kCurrentCity]) {
                modelList = @[self.cityListVM.cityList[i]];
            }
        }
    } else if (indexPath.section == 1) {
        modelList = self.allCities[indexPath.row];
    } else {
        NSInteger lineNumber = 0;
        for (NSInteger i=0; i<indexPath.section; i++) {
            lineNumber += [self.dataDict[@(i)] integerValue];
        }
        modelList = self.allCities[lineNumber + indexPath.row];
    }
    /** 弹出控制器CNCityAlertController */
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    CGRect bounds = cell.bounds;
    bounds.size.width = 100;
    CNCityAlertController *cityAlertVC = [[CNCityAlertController alloc] initWithSourceView:cell bySourceRect:bounds andContentSize: CGSizeMake(self.view.bounds.size.width * 0.7, self.view.bounds.size.height * 0.9) andDirection:UIPopoverArrowDirectionLeft] ;
    cityAlertVC.modelList = modelList;
    [self presentViewController:cityAlertVC animated:YES completion:nil];
}
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.cityListVM getCityListCompletionHandler:^(NSError *error) {
        if (error) {
            [self.view showWarning:error.localizedDescription];
        } else {
            NSInteger j = 0;
            /** 获得数据后进行分类 */
            for (NSInteger num = 0; num<self.cityListVM.cityList.count; num++) {
                /** 判断是否是省的名称 */
                if (self.cityListVM.cityList[num].cityLevel == 0 && self.cityListVM.cityList[num].parentId == 0) {
                    [self.allProvinces addObject:self.cityListVM.cityList[num]];
                    /** 如果是省 则取出省的所有地级市 添加到二维数组中 */
                    for (NSInteger i=0; i<self.cityListVM.cityList.count; i++) {
                        if (self.cityListVM.cityList[i].parentId == self.cityListVM.cityList[num].cityId) {
                            [self.allTowns addObject:self.cityListVM.cityList[i]];
                        }
                    }
                    self.allCities[j] = self.allTowns.mutableCopy;
                    j++;
                    [self.allTowns removeAllObjects];
                }
                
            }
            //对数组进行重新排序 取出北京 放到数组第一个位置
            for (NSInteger i=0; i<self.allCities.count; i++) {
                CNCityListDataListModel *model = [CNCityListDataListModel new];
                NSMutableArray<CNCityListDataListModel *> *array = [NSMutableArray array];
                if ([self.allProvinces[i].cityName isEqualToString:@"北京"]) {
                    model = self.allProvinces[i];
                    array = self.allCities[i].mutableCopy;
                    //i之前的数组下标+1,
                    for (NSInteger j=i; j>0; j--) {
                        self.allProvinces[j] = self.allProvinces[j-1];
                        self.allCities[j] = self.allCities[j-1];
                    }
                    self.allProvinces[0] = model;
                    self.allCities[0] = array;
                }
            }
            //对数组进行重新排序 取出天津
            for (NSInteger i=0; i<self.allCities.count; i++) {
                CNCityListDataListModel *model = [CNCityListDataListModel new];
                NSMutableArray<CNCityListDataListModel *> *array = [NSMutableArray array];
                if ([self.allProvinces[i].cityName isEqualToString:@"天津"]) {
                    model = self.allProvinces[i];
                    array = self.allCities[i].mutableCopy;
                    //i之前的数组下标+1,
                    for (NSInteger j=i; j>1; j--) {
                        self.allProvinces[j] = self.allProvinces[j-1];
                        self.allCities[j] = self.allCities[j-1];
                    }
                    self.allProvinces[1] = model;
                    self.allCities[1] = array;
                }
            }
            //对数组进行重新排序 取出上海
            for (NSInteger i=0; i<self.allCities.count; i++) {
                CNCityListDataListModel *model = [CNCityListDataListModel new];
                NSMutableArray<CNCityListDataListModel *> *array = [NSMutableArray array];
                if ([self.allProvinces[i].cityName isEqualToString:@"上海"]) {
                    model = self.allProvinces[i];
                    array = self.allCities[i].mutableCopy;
                    //i之前的数组下标+1,
                    for (NSInteger j=i; j>2; j--) {
                        self.allProvinces[j] = self.allProvinces[j-1];
                        self.allCities[j] = self.allCities[j-1];
                    }
                    self.allProvinces[2] = model;
                    self.allCities[2] = array;
                }
            }
            //对数组进行重新排序 取出重庆
            for (NSInteger i=0; i<self.allCities.count; i++) {
                CNCityListDataListModel *model = [CNCityListDataListModel new];
                NSMutableArray<CNCityListDataListModel *> *array = [NSMutableArray array];
                if ([self.allProvinces[i].cityName isEqualToString:@"重庆"]) {
                    model = self.allProvinces[i];
                    array = self.allCities[i].mutableCopy;
                    //i之前的数组下标+1,
                    for (NSInteger j=i; j>3; j--) {
                        self.allProvinces[j] = self.allProvinces[j-1];
                        self.allCities[j] = self.allCities[j-1];
                    }
                    self.allProvinces[3] = model;
                    self.allCities[3] = array;
                }
            }
            self.tableView.delegate = self;
            self.tableView.dataSource = self;
            [self.tableView reloadData];
        }
    }];
    //调用分类中的方法
    [self setupLocation];
}


/** 黑魔法 */
- (void)setLocationManager:(CLLocationManager *)locationManager {
    /** @selector(locationManager)->指针地址 绑定了指针地址和locationManager变量 向self存储唯一标识locationManager */
    return objc_setAssociatedObject(self, @selector(locationManager), locationManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CLLocationManager *)locationManager {
    /** _cmd当前方法的指针 */
    return objc_getAssociatedObject(self, _cmd);
}
#pragma mark -- CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    /** 使用location[0]取第一个元素 如果数组是空,那么crash,数组越界 */
    CLLocation *locaiton = locations.firstObject;
    if (locaiton) {
        /** 定位代理置空,防止多次弹出警告 */
        manager.delegate = nil;
        /** 如果已经定位,就关掉定位服务 */
        [manager stopUpdatingLocation];
        /** 反地理编码 */
        [[CLGeocoder new] reverseGeocodeLocation:locaiton completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            CLPlacemark *placemark = placemarks.firstObject;
            /** 获取当前城市 */
            NSString *localCity = placemark.locality;
            /** 去掉 市 */
            localCity = [localCity stringByReplacingOccurrencesOfString:@"市" withString:@""];
            MYLog(@"%@",localCity);
            if (![kCurrentCity isEqualToString:localCity]) {
                NSString *message = [NSString stringWithFormat:@"当前城市发生变化,是否要切换到'%@'?",localCity];
                /** blocksKit 第三方的优化 */
                [UIAlertView bk_showAlertViewWithTitle:@"切换城市" message:message cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
                    /** 点击确定后 */
                    if (buttonIndex == 1) {
                        /** 保存新的城市名称 */
                        [[NSUserDefaults standardUserDefaults] setObject:localCity forKey:kCurrentCityName];
                        /** 保存新的城市Id */
                        for (NSInteger i=0; i<self.cityListVM.cityList.count; i++) {
                            CNCityListDataListModel *model = self.cityListVM.cityList[i];
                            if ([model.cityName isEqualToString:kCurrentCity]) {
                                [[NSUserDefaults standardUserDefaults] setObject:@(model.cityId) forKey:kCurrentCityId];
                            }
                        }
                        /** 同步到沙盒 */
                        [[NSUserDefaults standardUserDefaults] synchronize];
                        /** 发送城市变更通知 */
                        [[NSNotificationCenter defaultCenter] postNotificationName:kCurrentCityChangedNotification object:nil];
                    }
                }];
            }
        }];
    }
}
#pragma mark -- Method
- (void)setupLocation {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 1000.0;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    /** 此方法只有iOS8以后才有,respondsToSelector:返回值是BOOL,为真就代表有某个方法 */
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    /** 设置初始城市 */
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (!kCurrentCity) {
            [[NSUserDefaults standardUserDefaults] setObject:@"北京" forKey:kCurrentCityName];
            [[NSUserDefaults standardUserDefaults] setObject:@201 forKey:kCurrentCityId];
            [[NSUserDefaults standardUserDefaults] synchronize];
            dispatch_async(dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:kCurrentCityChangedNotification object:nil];
            });
        }
    });
}

@end
