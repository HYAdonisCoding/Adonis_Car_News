//
//  Constants.h
//  AutoNews
//
//  Created by caohongyang on 16/4/1.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#ifndef Constants_h
#define Constants_h
@class CNCityListDataListModel;


/** block中的self */
#define WK(weakSelf) __weak __typeof(&*self)weakSelf = self;
/** RGB颜色宏 */
#define kRGBColor(R,G,B,Alpha) [UIColor colorWithRed: R/255.0 green: G/255.0 blue: B/255.0 alpha: Alpha]
//rgb颜色转换（16进制->10进制）
#define kRGBColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
/** 屏幕宽 */
#define kScreenW [UIScreen mainScreen].bounds.size.width
/** 屏幕宽 */
#define kScreenH [UIScreen mainScreen].bounds.size.height

/** 储存当前选中的城市 */
#define kCurrentCityName @"kCurrentCityName"
/** 当前的城市 */
#define kCurrentCity [[NSUserDefaults standardUserDefaults] objectForKey: kCurrentCityName]
/** 存储当前选中城市的ID */
#define kCurrentCityId @"kCurrentCityId"
/** 当前城市的ID */
#define kCityId [[NSUserDefaults standardUserDefaults] objectForKey: kCurrentCityId]
/** 当前城市变化的通知 */
#define kCurrentCityChangedNotification @"kCurrentCityChangedNotification"



//首先我们知道在ios开发过程中很容易出现数组越界，以及将空值添加进数组的现象，在项目过程中为了避免此类现象发生写了如下宏定义
//1、解决数组越界
#define OBJECT_OF_ARRAY_ATINDEX(_OBJ_,_ARRAY_,_INDEX_) ({if(_ARRAY_ && _INDEX_<[_ARRAY_ count]){ _OBJ_ = [_ARRAY_ objectAtIndex:_INDEX_];}})
#define OBJECT_OF_ATINDEX(_ARRAY_,_INDEX_) ((_ARRAY_)&&(_INDEX_>=0)&&(_INDEX_<[_ARRAY_ count])?([_ARRAY_ objectAtIndex:_INDEX_]):(nil))
//注释：1）无返回值，采取直接赋值的方式 2）有返回值
//2、解决将空值加入数组造成宕机
#define ADD_OBJECTINTOARRAY_(_OBJ_,_ARRAY_) ( {if(_OBJ_){[_ARRAY_ addObject:_OBJ_];}})

#endif /* Constants_h */
