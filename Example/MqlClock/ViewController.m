//
//  ViewController.m
//  MqlClock
//
//  Created by MBP on 2017/4/17.
//  Copyright © 2017年 leqi. All rights reserved.
//

#import "ViewController.h"
#import "MqlClock.h"

@interface ViewController ()<MqlClockDelegate>

@property(nonatomic,strong) MqlClock *mc;

@property(nonatomic,strong) UILabel *timeLable;

@property(nonatomic,strong) UIButton *countDownBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];

    self.mc = [MqlClock sharedMqlClock];
    self.mc.delegate = self;
    self.mc.dateFormat = @"yyyy-MM-dd HH:mm:ss";

}


#pragma mark MqlClockDelegate

- (void)showTheTimeNow:(NSString *)nowTime{
    self.timeLable.text = nowTime;

}

- (void)countDown:(NSString *)cdTimer{
    [self.countDownBtn setTitle:[NSString stringWithFormat:@"倒计时%@",cdTimer] forState:UIControlStateNormal];
}

- (void)startCountDownTime{
    [self.mc setTheCountDownWithSecond:20];
}

- (void)setUpUI{
    [self.view addSubview:self.timeLable];
    [self.view addSubview:self.countDownBtn];
}


- (UILabel *)timeLable{
    if (_timeLable == nil) {
        _timeLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100)];
        _timeLable.backgroundColor = [UIColor lightGrayColor];
        _timeLable.textColor = [UIColor whiteColor];
        [_timeLable setFont:[UIFont systemFontOfSize:25]];
    }
    return _timeLable;
}

- (UIButton *)countDownBtn{
    if (_countDownBtn == nil) {
        _countDownBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 50)];
        _countDownBtn.backgroundColor = [UIColor blackColor];
        [_countDownBtn setTitle:@"点我开始倒计时" forState:UIControlStateNormal];
        [_countDownBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_countDownBtn addTarget:self action:@selector(startCountDownTime) forControlEvents:UIControlEventTouchUpInside];
    }
    return _countDownBtn;
}
@end
