#
# Be sure to run `pod lib lint MqlClock.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MqlClock'
  s.version          = '1.3.0'
  s.summary          = '一行代码显示实时时间.'

  s.description      = <<-DESC
  一行代码显示当前时间 基于runTime接口的倒计时 支持UITableViewCell各自倒计时，支持滑动 支持后台倒计时
                       DESC

  s.homepage         = 'https://github.com/MQL9011/MqlClock'
  s.screenshots     = 'https://upload-images.jianshu.io/upload_images/1755091-c3c362a3d04678d1.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/228/format/webp'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '301063915@qq.com' => '301063915@qq.com' }
  s.source           = { :git => 'https://github.com/MQL9011/MqlClock.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MqlClock/*.*'

end
