//
//  PlistDataManager.m
//  AutoNews
//
//  Created by caohongyang on 16/4/2.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import "CNPlistDataManager.h"

@implementation CNPlistDataManager

+ (NSArray *)getArrFromPlist: (NSString *)plistName{
//    UIWindow *window = [[[UIApplication sharedApplication]windows]firstObject];
//    window addSubview:<#(nonnull UIView *)#>
    return [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"]];
    
}

+ (NSDictionary *)getDictionaryFromPlist: (NSString *)plistName{
    return [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"]];
}
+ (void)getCarsList:(void (^)(NSArray<CNCarsListModel *> *, NSError *))completionHandler{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *tmpArr = [CNCarsListModel parseJSON:[self getArrFromPlist:@"cars"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(tmpArr,nil);
        });
    });
}
@end
