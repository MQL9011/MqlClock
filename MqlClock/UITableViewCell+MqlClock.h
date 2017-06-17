//
//  UITableViewCell+MqlClock.h
//  MqlClock
//
//  Created by MBP on 2017/4/25.
//  Copyright © 2017年 MQL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (MqlClock)


/**
 You can set the dataFormat default is yyyy-MM-dd HH:mm:ss
 */
//@property(nonatomic,copy) NSString *mcDateFormat;

/**
 set the start countDown second 10.00/15.50/20.00... s
 */
@property (nonatomic, strong) NSString *mcStartSecond;

/**
 use to show the now second
 */
@property(nonatomic,strong) NSString *mcCountDownTime;


/**
 start the countDown time
 */
- (void)runCADisplayLinkTimer;

/**
 get the countDown time

 @param time now coutDown second 0.00 s
 */
- (void)showTheCountDownTime:(NSString *)time;


/**
 pause the countDown time
 */
- (BOOL)pauseCountDownTime;

/**
 reset the countDown Time
 */
- (void)resetCountDownTime;
@end
