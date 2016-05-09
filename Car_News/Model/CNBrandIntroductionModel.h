//
//  CNBrandIntroductionModel.h
//  Car_News
//
//  Created by caohongyang on 16/4/26.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNBrandIntroductionDataModel;
@interface CNBrandIntroductionModel : NSObject

@property (nonatomic, assign) BOOL success;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) CNBrandIntroductionDataModel *data;

@end
@interface CNBrandIntroductionDataModel : NSObject

@property (nonatomic, copy) NSString *masterName;

@property (nonatomic, assign) NSInteger masterId;

@property (nonatomic, copy) NSString *introduction;

@property (nonatomic, copy) NSString *logoMeaning;

@end

