//
//  UITableViewCell+MqlClock.m
//  MqlClock
//
//  Created by MBP on 2017/4/25.
//  Copyright © 2017年 leqi. All rights reserved.
//

#import "UITableViewCell+MqlClock.h"
#import <objc/runtime.h>


@implementation UITableViewCell (MqlClock)


static const void *mcNowTimeKey = &mcNowTimeKey;
static const void *mcCountDownTimeKey = &mcCountDownTimeKey;


@dynamic mcNowTime;
@dynamic mcCountDownTime;


- (NSString *)mcNowTime {
    return objc_getAssociatedObject(self, mcNowTimeKey);
}

- (void)setMcNowTime:(NSString *)mcNowTime{
    objc_setAssociatedObject(self, mcNowTimeKey, mcNowTime, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)mcCountDownTime {
    return objc_getAssociatedObject(self, mcCountDownTimeKey);
}

- (void)setMcCountDownTime:(NSString *)mcCountDownTime{
    objc_setAssociatedObject(self, mcCountDownTimeKey, mcCountDownTime, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
