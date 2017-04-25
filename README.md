# MqlClock
![](https://img.shields.io/github/license/mashape/apistatus.svg)
![](https://img.shields.io/badge/pod-v1.0-yellowgreen.svg)


## Description

一句代码显示时间

![](http://o9rpnyegw.bkt.clouddn.com/MgKr6pkx4o.gif)

## Install
The podfile   

```
platform :ios, '8.0'

target 'TargetName' do
pod 'MqlClock', '~> 1.0'
end
```


## How to Use


>Init The clock  

```
 self.mc = [MqlClock sharedMqlClock];
 self.mc.delegate = self;
 self.mc.dateFormat = @"yyyy-MM-dd HH:mm:ss";

```


>2017-04-25 10:45:57 星期二  

```
- (void)showTheTimeNow:(NSString *)nowTime{
    self.timeLable.text = nowTime;

}
```

>倒计时  10.9.8.7...

```
- (void)countDown:(NSString *)cdTimer{
    [self.countDownBtn setTitle:[NSString stringWithFormat:@"倒计时%@",cdTimer] forState:UIControlStateNormal];
}
```

>更改显示格式 2017/05/11 18:09:12  

```
	self.mc.dateFormat = @"yyyy/MM/dd HH:mm:ss";
```

# License
MIT