//
//  main.m
//  Car_News
//
//  Created by caohongyang on 16/4/15.
//  Copyright © 2016年 caohongyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
/** 启动时间 */
CFAbsoluteTime StartTime;

int main(int argc, char * argv[]) {
    @autoreleasepool {
        /** 获取启动时间 */
        StartTime = CFAbsoluteTimeGetCurrent();
        dispatch_async(dispatch_get_main_queue(), ^{
            MYLog(@"Lauched in %f seconds.",(CFAbsoluteTimeGetCurrent() - StartTime));
        });
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
