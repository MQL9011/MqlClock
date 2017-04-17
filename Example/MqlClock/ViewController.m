//
//  ViewController.m
//  MqlClock
//
//  Created by MBP on 2017/4/17.
//  Copyright © 2017年 leqi. All rights reserved.
//

#import "ViewController.h"
#import "MqlClock.h"

@interface ViewController ()

@property(nonatomic,strong) UILabel *timeLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.timeLable];
    MqlClock *mc = [MqlClock sharedMqlClock];
    
    mc.dateFormat = @"yyyy-MM-dd HH:mm:ss";

    mc.nowTimeBlock = ^(NSString *nowTime) {
        self.timeLable.text = nowTime;
    };
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

@end
