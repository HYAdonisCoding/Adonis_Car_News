//
//  MainViewModel.h
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

//typedef NS_ENUM(NSUInteger, RequestMode) {
//    RequestModelRefresh,
//    RequestModeMore,
//};

@interface CNMainViewModel : NSObject
/** 根据UI */
/** 新闻的行数 */
@property (nonatomic,assign) NSInteger rowNumber;
- (NSURL *)iconURLForIndex: (NSInteger)index;
- (NSString *)titleForIndex: (NSInteger)index;
- (NSString *)mediaNameForIndex: (NSInteger)index;
- (NSString *)commentNumberForIndex: (NSInteger)index;
- (NSInteger)newsIDForIndex: (NSInteger)index;
/** 根据Model */
/** 新闻 */
@property (nonatomic,strong) NSMutableArray<NewsListListModel *> *newsList;
//
@property (nonatomic,assign) NSInteger pageNumber;
- (void)getNewsWithRequestMode: (RequestMode)requestMode completionHandler:(void(^)(NSError *error))completoinHandler;

@end
