//
//  CNCityListModel.h
//  Car_News
//
//  Created by caohongyang on 16/4/21.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNCityListDataModel,CNCityListDataListModel;
@interface CNCityListModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) CNCityListDataModel *data;

@end
@interface CNCityListDataModel : NSObject

@property (nonatomic, strong) NSArray<CNCityListDataListModel *> *list;

@end

@interface CNCityListDataListModel : NSObject
//EngName->engName
@property (nonatomic, copy) NSString *engName;
//CityLevel->cityLevel
@property (nonatomic, assign) NSInteger cityLevel;
//ParentId->parentId
@property (nonatomic, assign) NSInteger parentId;
//CityId->cityId
@property (nonatomic, assign) NSInteger cityId;
//CityName->cityName
@property (nonatomic, copy) NSString *cityName;

@end

