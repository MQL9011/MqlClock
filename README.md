# MqlClock
![](https://img.shields.io/github/license/mashape/apistatus.svg)
![](https://img.shields.io/badge/pod-v1.1.5-yellowgreen.svg)



## Description
> Line of code shows the current time  
> Countdown based on runTime interface  
> support UITableViewCell their respective countdown, support sliding  
> Supports background countdown  

***
>一行代码显示当前时间  
>基于runTime接口的倒计时  
>支持UITableViewCell各自倒计时，支持滑动  
>支持后台倒计时  




![](http://o9rpnyegw.bkt.clouddn.com/LJDD.gif)

## Install
The podfile   

```
platform :ios, '8.0'

target 'TargetName' do
pod 'MqlClock', '~> 1.1.5'
end
```


```
pod install

```


## How to Use

>import   

```
#import "MqlClock.h"

```


>Init The clock  

```
 self.mc = [MqlClock sharedMqlClock];
 self.mc.delegate = self;
 self.mc.dateFormat = @"yyyy-MM-dd HH:mm:ss";

```

>delegate   

```
@interface ViewController ()<MqlClockDelegate>

```

>2017-04-25 10:45:57 星期二  

```
- (void)showTheTimeNow:(NSString *)nowTime{
    self.timeLable.text = nowTime;

}
```

>UIButton countdown  10.9.8.7...

```
- (void)countDown:(NSString *)cdTimer{
    [self.countDownBtn setTitle:[NSString stringWithFormat:@"倒计时%@",cdTimer] forState:UIControlStateNormal];
}
```

>Change the display format 2017/05/11 18:09:12  

```
self.mc.dateFormat = @"yyyy/MM/dd HH:mm:ss";
```

>UITableViewCell CountDown 


```
#import "UITableViewCell+MqlClock.h"

- (void)runCountDown{
    [self runCADisplayLinkTimer];
}

- (void)showTheCountDownTime:(NSString *)time{
    self.timeLable.text = time;
}

```
>Set tableViewCell start CountDown second  

```
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //here is your cell
    cell.mcStartSecond = [NSString stringWithFormat:@"%ld",(indexPath.row * 10 + 10)];
    return cell;
}
```



#更多咨询及用法
>加群二维码  
>群名称：iOS-MqlClock交流群  
>群   号：376686217 

![](http://o9rpnyegw.bkt.clouddn.com/iOS-MqlClock%E4%BA%A4%E6%B5%81%E7%BE%A4%E7%BE%A4%E4%BA%8C%E7%BB%B4%E7%A0%81.png)

#<a href="http://www.jianshu.com/p/e1ac30234de1">作者的详细使用说明请点击</a>

# License
MIT
