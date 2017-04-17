//
//  MqlClock.h
//  MqlClock
//
//  Created by MBP on 2017/4/17.
//  Copyright © 2017年 MaQianli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MqlClock : NSObject

//You can set the dataFormat default is yyyy-MM-dd HH:mm:ss
@property(nonatomic,copy) NSString *dateFormat;


@property(nonatomic,copy) void(^nowTimeBlock)(NSString *nowTime);


+ (instancetype)sharedMqlClock;


/**
 *  get The Weekday 「星期一,二,三。。。」
 *
 *  @param inputDate yyyy-MM-dd
 */
- (NSString*)weekdayStringFromDate:(NSDate *)inputDate;

@end
