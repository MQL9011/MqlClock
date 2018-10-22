//
//  MqlClock.m
//  MqlClock
//
//  Created by MBP on 2017/4/17.
//  Copyright © 2017年 MQL. All rights reserved.
//

#import "MqlClock.h"

@interface MqlClock ()

@property(nonatomic,strong)dispatch_source_t timer;

@property(nonatomic,copy) NSDate *startDate;

@property(nonatomic,assign) NSUInteger totalSecond;

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
        [self loadTimer];
    }
    return self;
}

//定时器设置
-(void)loadTimer{
    //如果定时器已经存在就先销毁
    if (self.timer) {
        dispatch_cancel(self.timer);
        self.timer = nil;
    }
    dispatch_queue_t queue = dispatch_get_main_queue();
    //创建一个定时器
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //设置定时器立刻开始
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0*NSEC_PER_SEC));
    //循环间隔1秒
    uint64_t interval = (uint64_t)(1.0*NSEC_PER_SEC);
    dispatch_source_set_timer(self.timer, start, interval, 0);
    //设置回调
    __weak typeof(self) weakSelf = self;
    dispatch_source_set_event_handler(self.timer, ^{
        [weakSelf showMeTheTime];
    });
    //启动定时器（默认是暂停）
    dispatch_resume(self.timer);
}


/**
 获取时间
 */
- (void)showMeTheTime{
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
        _startDate = [NSDate date];
        
        dispatch_queue_t queue = dispatch_get_main_queue();
        //创建一个定时器
        dispatch_source_t gcd_time = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        //设置定时器立刻开始
        dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0*NSEC_PER_SEC));
        //循环间隔1秒
        uint64_t interval = (uint64_t)(1.0*NSEC_PER_SEC);
        dispatch_source_set_timer(gcd_time, start, interval, 0);
        //设置回调
        __weak typeof(self) weakSelf = self;
        dispatch_source_set_event_handler(gcd_time, ^{
            [weakSelf timerStart:gcd_time];
        });
        //启动定时器（默认是暂停）
        dispatch_resume(gcd_time);
    }
}

-(void)timerStart:(dispatch_source_t)gcd_time{
    double nowSecond = [[NSDate date] timeIntervalSinceDate:_startDate];
    NSUInteger sec = _totalSecond - (nowSecond + 0.1);
    NSLog(@"=====%f======%lu",nowSecond,(unsigned long)sec);
    _cdTime = [NSString stringWithFormat:@"%lu",(unsigned long)sec];
    if ([self.delegate respondsToSelector:@selector(countDown:)]) {
        [self.delegate countDown:_cdTime];
    }
    if (sec <= 0) {
        dispatch_cancel(gcd_time);
    }
}

@end
