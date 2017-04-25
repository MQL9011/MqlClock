//
//  CustomTableViewCell.h
//  MqlClock
//
//  Created by MBP on 2017/4/25.
//  Copyright © 2017年 leqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property(nonatomic,strong) CADisplayLink *displayLink;

@property(nonatomic,strong) UILabel *timeLable;

@property(nonatomic,strong) UIButton *countDownBtn;

@property(nonatomic,strong) NSDate *startDate;

@property(nonatomic,assign) NSTimeInterval timeInterval;

@end
