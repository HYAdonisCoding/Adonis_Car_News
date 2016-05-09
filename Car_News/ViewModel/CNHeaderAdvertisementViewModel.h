//
//  HeaderAdvertisementViewModel.h
//  AutoNews
//
//  Created by caohongyang on 16/4/11.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNNetManager.h"

//typedef NS_ENUM(NSUInteger, RequestMode) {
//    RequestModeRefresh,
//    RequestModeMore,
//};

@interface CNHeaderAdvertisementViewModel : NSObject
/** 根据UI */
- (NSString *)advertisementIconForIndex: (NSInteger)index;
- (NSString *)advertisementTitleForIndex: (NSInteger)index;
- (NSString *)advertisementMediaNameForIndex: (NSInteger)index;
- (NSString *)advertisementCommentNumberForIndex: (NSInteger)index;
/** 根据Model */
@property (nonatomic,assign) NSInteger pageNumber;
@property (nonatomic,assign) NSInteger pageLength;
/** 广告数量 */
@property (nonatomic,strong) NSMutableArray<NewsAdvertisementDataListModel *> *advertisementNumber;
- (void)getNewsAdvertisementDataListWithRequestMode: (RequestMode)requestMode completionHandler:(void(^)(NSError *error,id resObject))completoinHandler;

@end
