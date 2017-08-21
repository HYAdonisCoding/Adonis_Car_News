//
//  UIScrollView+Refresh.h
//  AutoNews
//
//  Created by caohongyang on 16/4/1.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>

@interface UIScrollView (Refresh)
/** 添加头部刷新 */
- (void)addHeaderRefresh: (MJRefreshComponentRefreshingBlock)block;
/** 开始头部刷新 */
- (void)beginHeaderRefresh;
/** 结束头部刷新 */
- (void)endHeaderRefresh;

/** 添加脚步自动刷新 */
- (void)addAutoFooterRefresh: (MJRefreshComponentRefreshingBlock)block;
/** 添加脚步返回刷新 */
- (void)addBackFooterRefresh:(MJRefreshComponentRefreshingBlock)block;
/** 开始脚步刷新 */
- (void)beginFooterRefresh;
/** 结束脚步刷新 */
- (void)endFooterRefresh;
@end
