//
//  DetailNewsViewModel.m
//  AutoNews
//
//  Created by caohongyang on 16/4/10.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNDetailNewsViewModel.h"

@implementation CNDetailNewsViewModel
- (NSString *)newsTextOrPictureForIndex:(NSInteger)index {
    return self.newsLine[index].content;
}
- (NSMutableArray<DetailNewsDataContentModel *> *)newsLine {
    if (!_newsLine) {
        _newsLine = [NSMutableArray array];
    }
    return _newsLine;
}
- (void)getDetailNewsURLWithNewsListlistModel:(NewsListDataListModel *)model RequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *error,id resobject))completoinHandler {
    
    [CNNetManager getDetailNewsWithNewsID:model.newsId lastModify:model.lastModify completionHandler:^(DetailNewsDataModel *model, NSError *error) {
        if (!error) {
            completoinHandler(nil,model.content);
            [self.newsLine addObjectsFromArray:model.content];
        } else {
            MYLog(@"DetailNewsViewModel:%@",error.userInfo);
            completoinHandler(nil,error);
        }
    }];
}
@end
