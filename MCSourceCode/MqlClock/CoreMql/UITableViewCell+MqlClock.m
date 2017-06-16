//
//  UITableViewCell+MqlClock.m
//  MqlClock
//
//  Created by MBP on 2017/4/25.
//  Copyright © 2017年 MQL. All rights reserved.
//

#import "UITableViewCell+MqlClock.h"
#import <objc/runtime.h>

@interface UITableViewCell ()

@property(nonatomic,strong) CADisplayLink *displayLink;

@property(nonatomic,strong) NSDate *startDate;

@property(nonatomic,strong) NSDate *pauseDate;

@property(nonatomic,assign) NSTimeInterval timeInterval;



@end

@implementation UITableViewCell (MqlClock)

- (void)runCADisplayLinkTimer {
    if ([self.mcCountDownTime isEqualToString:@"0.00"]) {
        CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(onCADisplayLinkTimeout)];
        NSInteger frameInterval = floor(self.timeInterval * 1000 / (1000 / 60.0));
        displayLink.preferredFramesPerSecond = frameInterval;
        [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        self.displayLink = displayLink;
        self.startDate = [NSDate date];
    }
}

- (void)onCADisplayLinkTimeout {
    double nowSecond = [[NSDate date] timeIntervalSinceDate:self.startDate];
    double sec = [self.mcStartSecond floatValue] - (nowSecond + 0.1);
    self.mcCountDownTime = [NSString stringWithFormat:@"%0.2f",sec];
    if (sec <= 0) {
        [self.displayLink invalidate];
        self.mcCountDownTime = @"0.00";
    }
    [self showTheCountDownTime:self.mcCountDownTime];

}

- (BOOL)pauseCountDownTime{
    self.displayLink.paused = !self.displayLink.paused;
    return self.displayLink.paused;
}


- (void)resetCountDownTime{
    [self.displayLink invalidate];
    self.mcCountDownTime = @"0.00";
    [self showTheCountDownTime:self.mcCountDownTime];
}


static const void *mcDateFormatKey = &mcDateFormatKey;
static const void *mcStartSecondKey = &mcStartSecondKey;
static const void *mcCountDownTimeKey = &mcCountDownTimeKey;

//@dynamic mcDateFormat;
@dynamic mcStartSecond;
@dynamic mcCountDownTime;


- (void)showTheCountDownTime:(NSString *)time{

}

- (NSString *)cellDateFormat{
    return objc_getAssociatedObject(self, mcDateFormatKey);
}

- (void)setMcDateFormat:(NSString *)mcDateFormat{
    objc_setAssociatedObject(self, mcDateFormatKey, mcDateFormat, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)mcStartSecond {
    return objc_getAssociatedObject(self, mcStartSecondKey);
}

- (void)setMcStartSecond:(NSString *)mcStartSecond{
    self.mcCountDownTime = @"0.00";
    objc_setAssociatedObject(self, mcStartSecondKey, mcStartSecond, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)mcCountDownTime {
    return objc_getAssociatedObject(self, mcCountDownTimeKey);
}

- (void)setMcCountDownTime:(NSString *)mcCountDownTime{
    objc_setAssociatedObject(self, mcCountDownTimeKey, mcCountDownTime, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
