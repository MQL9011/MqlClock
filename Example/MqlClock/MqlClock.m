//
//  MqlClock.m
//  MqlClock
//
//  Created by MBP on 2017/4/17.
//  Copyright © 2017年 leqi. All rights reserved.
//

#import "MqlClock.h"


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
        self.nowTimeBlock(showStr);
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

@end
