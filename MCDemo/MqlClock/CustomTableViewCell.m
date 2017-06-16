//
//  CustomTableViewCell.m
//  MqlClock
//
//  Created by MBP on 2017/4/25.
//  Copyright © 2017年 MQL. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "UITableViewCell+MqlClock.h"


@implementation CustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];

    }
    return self;
}



- (void)runCountDown{
    [self runCADisplayLinkTimer];
}


/**
 倒计时在这个方法中获得

 @param time 当前倒计时
 */
- (void)showTheCountDownTime:(NSString *)time{
    self.timeLable.text = time;
}

- (void)pauseBtnPressed{
   BOOL btnStatus =  [self pauseCountDownTime];
    if (btnStatus) {
        [self.pauseBtn setTitle:@"继续" forState:UIControlStateNormal];
    }else{
        [self.pauseBtn setTitle:@"暂停" forState:UIControlStateNormal];
    }

}

- (void)resetBtnPressed{
    [self resetCountDownTime];
}



- (void)setUpUI{
    [self.contentView addSubview:self.timeLable];
    [self.contentView addSubview:self.countDownBtn];
    [self.contentView addSubview:self.pauseBtn];
    [self.contentView addSubview:self.resetBtn];
}

- (UILabel *)timeLable{
    if (_timeLable == nil) {
        _timeLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
        _timeLable.backgroundColor = [UIColor lightGrayColor];
        _timeLable.textColor = [UIColor whiteColor];
        [_timeLable setFont:[UIFont systemFontOfSize:25]];
        _timeLable.text = @"0.00";
    }
    return _timeLable;
}

- (UIButton *)countDownBtn{
    if (_countDownBtn == nil) {
        _countDownBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 50, 150, 50)];
        _countDownBtn.backgroundColor = [UIColor orangeColor];
        [_countDownBtn setTitle:@"点我开始倒计时" forState:UIControlStateNormal];
        [_countDownBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_countDownBtn addTarget:self action:@selector(runCountDown) forControlEvents:UIControlEventTouchUpInside];
    }
    return _countDownBtn;
}

- (UIButton *)pauseBtn{
    if (_pauseBtn == nil) {
        _pauseBtn = [[UIButton alloc]initWithFrame:CGRectMake(180, 50, 80, 50)];
        _pauseBtn.backgroundColor = [UIColor orangeColor];
        [_pauseBtn setTitle:@"暂停" forState:UIControlStateNormal];
        [_pauseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_pauseBtn addTarget:self action:@selector(pauseBtnPressed) forControlEvents:UIControlEventTouchUpInside];

    }
    return _pauseBtn;
}

- (UIButton *)resetBtn{
    if (_resetBtn == nil) {
        _resetBtn = [[UIButton alloc]initWithFrame:CGRectMake(270, 50, 80, 50)];
        _resetBtn.backgroundColor = [UIColor orangeColor];
        [_resetBtn setTitle:@"重置" forState:UIControlStateNormal];
        [_resetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_resetBtn addTarget:self action:@selector(resetBtnPressed) forControlEvents:UIControlEventTouchUpInside];

    }
    return _resetBtn;
}


@end
