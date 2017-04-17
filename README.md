# MqlClock

## Description

![](http://o9rpnyegw.bkt.clouddn.com/MqlClock.gif)

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