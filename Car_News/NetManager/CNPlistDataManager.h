//
//  PlistDataManager.h
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNCarsListModel.h"

@interface CNPlistDataManager : NSObject

+ (void)getCarsList: (void(^)(NSArray<CNCarsListModel *> *carsList, NSError *error))completionHandler;

@end
