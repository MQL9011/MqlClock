//
//  MqlClock.m
//  MqlClock
//
//  Created by MBP on 2017/4/17.
//  Copyright © 2017年 MQL. All rights reserved.
//

#import "MqlClock.h"

@interface MqlClock ()

@property(nonatomic,copy) NSDate *startDate;

@property(nonatomic,assign) NSUInteger totalSecond;

@property(nonatomic,copy) NSTimer *countDownTimer;

@property(nonatomic,copy) NSString *cdTime;


@end



@implementation MqlClock
static MqlClock *instance = nil;

/**
 *  单例
 *
 */
+ (instancetype)sharedMqlClock{
    // 保证线程安全
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[MqlClock alloc] init];
    });
    return instance;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self showMeTheTime];
    }
    return self;
}


- (void)showMeTheTime{
    [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSDate *nowDate = [NSDate date];
        NSDateFormatter *timeFormat = [[NSDateFormatter alloc]init];
        if (self.dateFormat) {
            timeFormat.dateFormat = self.dateFormat;
        }else{
            timeFormat.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        }
        NSString *dateString = [timeFormat stringFromDate:nowDate];
        NSString *weekDay = [self weekdayStringFromDate:nowDate];
        NSString *showStr = [NSString stringWithFormat:@"%@ %@",dateString,weekDay];
        if ([self.delegate respondsToSelector:@selector(showTheTimeNow:)]) {
            [self.delegate showTheTimeNow:showStr];
        }
    }];
}


/**
 *  获取星期几
 *
 *  @param inputDate yyyy-MM-dd
 */
- (NSString*)weekdayStringFromDate:(NSDate *)inputDate {
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    return [weekdays objectAtIndex:theComponents.weekday];
}


/**
 显示倒计时
 @param startSecond 从多少秒开始倒计时
 */
- (void)setTheCountDownWithSecond:(NSUInteger)startSecond{
    if (_totalSecond == 0) {
        _totalSecond = startSecond;
        _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
        _startDate = [NSDate date];
        [[NSRunLoop currentRunLoop]addTimer:_countDownTimer forMode:NSRunLoopCommonModes];
    }
}

-(void)timerStart:(NSTimer *)theTimer{
    double nowSecond = [[NSDate date] timeIntervalSinceDate:_startDate];
    NSUInteger sec = _totalSecond - (nowSecond + 0.1);
//    NSLog(@"=====%f======%lu",nowSecond,(unsigned long)sec);
    _cdTime = [NSString stringWithFormat:@"%lu",(unsigned long)sec];
    if ([self.delegate respondsToSelector:@selector(countDown:)]) {
        [self.delegate countDown:_cdTime];
    }
    if (sec <= 0) {
        [_countDownTimer invalidate];
    }
}




























@end
