//
//  MqlClock.h
//  MqlClock
//
//  Created by MBP on 2017/4/17.
//  Copyright © 2017年 MQL. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MqlClockDelegate <NSObject>

@optional
/**
 show the countDown Time
 */
- (void)countDown:(NSString *)cdTimer;

/**
 show the time "2017-03-01 09:23:50"
 */
- (void)showTheTimeNow:(NSString *)nowTime;

@end

@interface MqlClock : NSObject

@property(nonatomic,weak) id<MqlClockDelegate>delegate;


//You can set the dataFormat default is yyyy-MM-dd HH:mm:ss
@property(nonatomic,copy) NSString *dateFormat;




+ (instancetype)sharedMqlClock;



/**
 show the now time;
 */
- (void)showMeTheTime;

/**
 *  get The Weekday CN
 *
 *  @param inputDate yyyy-MM-dd
 */
- (NSString*)weekdayStringFromDate:(NSDate *)inputDate;


/**
 set the countDown start Second
 */
- (void)setTheCountDownWithSecond:(NSUInteger)startSecond;

















@end
