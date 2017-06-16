//
//  ViewController.m
//  MqlClock
//
//  Created by MBP on 2017/4/17.
//  Copyright © 2017年 MQL. All rights reserved.
//

#import "ViewController.h"
#import "MqlClock.h"
#import "CustomTableViewCell.h"
#import "UITableViewCell+MqlClock.h"

@interface ViewController ()<MqlClockDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) MqlClock *mc;

@property(nonatomic,strong) UILabel *timeLable;

@property(nonatomic,strong) UIButton *countDownBtn;

@property(nonatomic,strong) UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];

    self.mc = [MqlClock sharedMqlClock];
    self.mc.delegate = self;
}


#pragma mark MqlClockDelegate

- (void)showTheTimeNow:(NSString *)nowTime{
    self.timeLable.text = nowTime;

}

- (void)countDown:(NSString *)cdTimer{
    [self.countDownBtn setTitle:[NSString stringWithFormat:@"倒计时%@",cdTimer] forState:UIControlStateNormal];
}



#pragma mark button event
- (void)startCountDownTime{
    [self.mc setTheCountDownWithSecond:20];
}

#pragma mark TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseID = [NSString stringWithFormat:@"cell%lu%lu",(long)indexPath.row,(long)indexPath.section];
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseID];
    }
    cell.textLabel.textColor = [UIColor lightGrayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.mcStartSecond = [NSString stringWithFormat:@"%ld",(indexPath.row * 10 + 10)];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


- (void)setUpUI{
    [self.view addSubview:self.timeLable];
    [self.view addSubview:self.countDownBtn];
    [self.view addSubview:self.tableView];
}

- (UILabel *)timeLable{
    if (_timeLable == nil) {
        _timeLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 50)];
        _timeLable.backgroundColor = [UIColor lightGrayColor];
        _timeLable.textColor = [UIColor whiteColor];
        [_timeLable setFont:[UIFont systemFontOfSize:25]];
    }
    return _timeLable;
}

- (UIButton *)countDownBtn{
    if (_countDownBtn == nil) {
        _countDownBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 120, [UIScreen mainScreen].bounds.size.width, 50)];
        _countDownBtn.backgroundColor = [UIColor blackColor];
        [_countDownBtn setTitle:@"点我开始倒计时" forState:UIControlStateNormal];
        [_countDownBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_countDownBtn addTarget:self action:@selector(startCountDownTime) forControlEvents:UIControlEventTouchUpInside];
    }
    return _countDownBtn;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 200) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
