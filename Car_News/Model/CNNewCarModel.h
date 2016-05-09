//
//  CNNewCarModel.h
//  Car_News
//
//  Created by caohongyang on 16/4/28.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNNewCarDataModel;
@interface CNNewCarModel : NSObject

@property (nonatomic, assign) BOOL success;

@property (nonatomic, strong) NSArray<CNNewCarDataModel *> *data;

@end
@interface CNNewCarDataModel : NSObject
//MasterBrandId->masterBrandId
@property (nonatomic, assign) NSInteger masterBrandId;
//CSId->csId
@property (nonatomic, assign) NSInteger csId;
//AllSpell->allSpell
@property (nonatomic, copy) NSString *allSpell;
//Price->price
@property (nonatomic, copy) NSString *price;
//Img->img
@property (nonatomic, copy) NSString *img;
//ShowName->showName
@property (nonatomic, copy) NSString *showName;
//Level->level
@property (nonatomic, copy) NSString *level;

@end

