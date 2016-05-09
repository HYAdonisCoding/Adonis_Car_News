//
//  CNCarSearchModel.h
//  Car_News
//
//  Created by caohongyang on 16/4/28.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CNCarSearchCarlistModel;
@interface CNCarSearchModel : NSObject
//Keyword->keyword
@property (nonatomic, copy) NSString *keyword;
//ResultCount->resultCount
@property (nonatomic, assign) NSInteger resultCount;
//CarList->carList
@property (nonatomic, strong) NSArray<CNCarSearchCarlistModel *> *carList;

@end
@interface CNCarSearchCarlistModel : NSObject
//ImgUrl->imgUrl
@property (nonatomic, copy) NSString *imgUrl;
//GuidePrice->guidePrice
@property (nonatomic, copy) NSString *guidePrice;
//CsSaleStatus->csSaleStatus
@property (nonatomic, copy) NSString *csSaleStatus;
//BrandName->brandName
@property (nonatomic, copy) NSString *brandName;
//Csid->csId
@property (nonatomic, assign) NSInteger csId;
//CsSpell->csSpell
@property (nonatomic, copy) NSString *csSpell;
//BrandId->brandId
@property (nonatomic, assign) NSInteger brandId;
//Title->title
@property (nonatomic, copy) NSString *title;
//CsLevel->csLevel
@property (nonatomic, copy) NSString *csLevel;
//RefPrice->refPrice
@property (nonatomic, copy) NSString *refPrice;

@end

