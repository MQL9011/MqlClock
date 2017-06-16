//
//  CustomTableViewCell.h
//  MqlClock
//
//  Created by MBP on 2017/4/25.
//  Copyright © 2017年 MQL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property(nonatomic,strong) CADisplayLink *displayLink;

@property(nonatomic,strong) UILabel *timeLable;

@property(nonatomic,strong) UIButton *countDownBtn;

@property(nonatomic,strong) UIButton *startBtn;

@property(nonatomic,strong) UIButton *pauseBtn;

@property(nonatomic,strong) UIButton *resetBtn;

@property(nonatomic,strong) NSDate *startDate;

@property(nonatomic,assign) NSTimeInterval timeInterval;

@end
