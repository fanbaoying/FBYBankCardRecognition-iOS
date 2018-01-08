## 一：简介

快捷支付涉及到方方面面，同时安全问题既是用户所关心的，也是制作者不容忽视的重要部分。
比如涉及到支付和金钱的app，商户端app等等，都需要进行实名认证，实名认证可以通过银行卡认证和身份证认证。
今天我就和大家介绍一下银行卡识别功能，这个方法是通过图像识别，可以快速、高效的识别银行卡信息。

## 二：原理

经实践发现，只要银行卡处于摄像头预览图层中并且银行卡号与识别线重合，即不用完全对准银行卡也可以读取到银行卡号。

与身份证识别不同的是，银行卡识别主要识别银行卡号，因此获取到的图像主要是银行卡号位置。

在获取到银行卡号之后，通过信息对比获取到银行卡的开户行。在银行卡信息页面可以展示出银行卡识别截图、银行卡开户行、银行卡号。

## 三：项目展示

#### 1.扫描银行卡页面

![扫描银行卡页面](http://upload-images.jianshu.io/upload_images/2829694-a9f000cce5adba7c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 2.信息展示页面

![信息展示页面](http://upload-images.jianshu.io/upload_images/2829694-474fd5e415a22318.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 四：Demo接入流程

#### 1.导入ReactiveCocoa框架

使用ReactiveCocoa对银行卡识别出的信息回调。

添加ReactiveCocoa框架最简单的方法就是用CocoaPods导入。

如果你从没用过CocoaPods，可以参考[CocoaPods | iOS详细使用说明](https://juejin.im/post/5a5313bff265da3e347b18fb)这篇教程吧。请至少看完教程中初始化的步骤，这样你才能安装框架。

如果不想用CocoaPods，你仍然可以使用ReactiveCocoa，具体查看Github文档中引入ReactiveCocoa的步骤描述。

这里简单介绍CocoaPods导入：
键盘输入 i，进入编辑模式，输入下面代码
```
platform :ios, '8.0'
use_frameworks!

def pods
  pod 'ReactiveCocoa', '2.3.1'
end

target '项目名称' do
  pods
end
```
下载框架即可。

#### 2.添加配置

在你的项目的Info.plist文件中，添加权限描述（Key   Value）
Privacy - Camera Usage Description 是否允许访问相机
Privacy - Photo Library Usage Description 是否允许访问相册
如下图：
![plist](https://user-gold-cdn.xitu.io/2018/1/2/160b57cc1a6b2c9d?w=1136&h=804&f=png&s=173122)

#### 3. 项目设置

1. 选择项目名字，选择Build Settings，搜索enable bitcode 设置为NO。

2. xcode8上边编译可能会遇到arm64错误， 选择项目名字，选择Build Settings，搜索Enable Testability 设置为NO。

#### 4.首先把demo下载下来

![demo截图](http://upload-images.jianshu.io/upload_images/2829694-090011dc648dcd91.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 5.打开项目将下面的文件拷贝到自己的工程中：
* bank_card
* BankData

#### 6. 项目引用

在项目中需要使用的页面，增加引用代码：
```
#import "FBYBankCardViewController.h"
```
在点击扫描身份证的点击事件中，跳转页面：
```
FBYBankCardViewController *bcvc = [[FBYBankCardViewController alloc]init];

[self.navigationController pushViewController:bcvc animated:YES];
```
到此项目就接入完成！！！

> 希望可以帮助大家，如有问题可加QQ群: 668562416 交流

> 如果哪里有什么不对或者不足的地方，还望读者多多提意见或建议

> 如需转载请联系我，经过授权方可转载，谢谢
