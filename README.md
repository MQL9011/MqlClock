# MqlClock
![](https://img.shields.io/github/license/mashape/apistatus.svg)
![](https://img.shields.io/badge/pod-v1.0-yellowgreen.svg)


## Description

一句代码显示时间

![](../MqlClock/MqlClock.gif)  

## Install
The podfile   

```
platform :ios, '8.0'

target 'TargetName' do
pod 'MqlClock', '~> 1.0'
end
```


## How to Use

```
 MqlClock *mc = [MqlClock sharedMqlClock];
    mc.nowTimeBlock = ^(NSString *nowTime) {
        self.timeLable.text = nowTime;
    };

```

```
//更改显示格式 2017/05/11 18:09:12
//You can set the dataFormat default is yyyy-MM-dd HH:mm:ss
	mc.dateFormat = @"yyyy/MM/dd HH:mm:ss";
```

# License
MIT