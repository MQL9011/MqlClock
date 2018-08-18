# MqlClock
![](https://img.shields.io/github/license/mashape/apistatus.svg)
![](https://img.shields.io/badge/pod-v1.2.1-yellowgreen.svg)



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
>支持暂停重置


![](http://o9rpnyegw.bkt.clouddn.com/MqlClock.png)

## Install
The podfile   

```
platform :ios, '8.0'

target 'TargetName' do
pod 'MqlClock', '~> 1.2.1'
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


# License
MIT
