//
//  CNDetailTalkAboutViewModel.m
//  Car_News
//
//  Created by caohongyang on 16/5/5.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNDetailTalkAboutViewModel.h"

@implementation CNDetailTalkAboutViewModel

- (NSString *)getDetailtalkAboutTextOrPictureForIndex:(NSInteger)index {
    return self.dataList[index].content;
}
- (NSMutableArray<CNDetailTalkAboutDataContentModel *> *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}
- (void)getDetailTalkAboutCarWithNewsListlistModel:(NewsListListModel *)model completionHandler:(void (^)(NSError *))completoinHandler {
    [CNNetManager getDetailTalkAboutCarWithNewsID:model.newsId lastModify: model.lastModify completionHandler:^(CNDetailTalkAboutModel *model, NSError *error) {
        if (!error) {
           [self.dataList addObjectsFromArray: model.data.content];
        }
        completoinHandler(error);
    }];
}
@end
