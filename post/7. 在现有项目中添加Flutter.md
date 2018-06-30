# 现有项目中集成Flutter

> 本文列举了项目开发使用Flutter会遇到的问题，以及如何使用Flutter module在现有项目中集成Flutter，并对其原理进行了分析。

最近在做的一个商业项目，完全的使用Flutter编写的，这其中的坑，只有写过的人才能体会到。

## 1. 纯Flutter项目的问题

在论述纯Flutter项目问题之前，我先表述下我的观点（仅限于纯Flutter项目，目前时间2018年6月26日，不排除Flutter的发展，让我的观点改观）：

* 对于个人开发者，可以使用纯Flutter去开发App尝鲜；
* 对于小团队，不推荐使用纯Flutter，出了问题，解决不了，浪费时间；
* 对于商业项目，不推荐使用纯Flutter，体验不好，埋坑时间不少。
* 与硬件强相关的项目，不推荐使用纯Flutter。

对于使用Flutter的初衷，我相信大部分领导都是出于提高生产力。但是目前就我们的项目来看，相同的时间，如果改用Native去写，我觉得两者进度并没有多大的差异，可能Native端反而会更快一些。目前Flutter中非常常见的一些控件功能都无法满足，往往在轮子上需要耗费大量的时间，反而在业务层面花费的时间很少。

### 1.1 目前存在的一些问题

* 适配问题：Flutter说的是跨平台，但是没有很完美的解决各个屏幕差异所带来的问题。实际上还是需要去做一些适配；

* 性能问题：目前看这个问题特别突出，在一些性能低的Android手机上，会出现一些卡顿问题。在一些高端机型上，一些转场动画，效果也不是特别理想，一旦涉及到一些复杂的页面，切换页面就会出现很明显的卡顿问题；

* 硬件相关问题：这个也是Flutter需要急需解决的问题，第三方硬件相关插件质量参差不齐，官方插件质量也堪忧。例如官方的camera插件，各种crash问题。

* 生命周期问题：插件层对生命周期的监控，是App级别的，无法针对某一个页面。Flutter中控件也没有很明确的生命周期这一概念，就是两三种状态的切换，没有像React中的生命周期，更不用说像Native中的那样。

上面这些问题是在项目中实际遇到的，当然一些问题通过变换实现手段可以规避，一些轮子自己花些时间造。一个新技术的初期，尤其是这种跨平台技术，选择all in的，还是需要再三考量。

### 1.2 前景

前面说的一些问题，并不是说Flutter非常差劲。如果说生态非常成熟的Flutter，我会非常愿意去使用，这项技术目前看确实挺有吸引力的。抛开写着写着就感觉自己像个web开发之外，其实写起来并没有太多的负担。

移动端技术现在已经是处在一个非常成熟平稳的时期，所以跨平台技术才会如此的迫切，单纯的去召集两个team开发两个端，这种成本在目前来看确实比较高，尤其是一些日活较低的产品。

前段时间，炒得沸沸扬扬的Airbnb抛弃RN的新闻，让大家对RN以及跨平台技术产生了一些不确定。跨平台技术从来都是公司层面的需求，并不是程序员个人的需求。况且，任何技术都不能忽略平台背后的商业推动，我不是一个跨平台技术的追求者，我个人也一直觉得跨平台是个伪命题。

追求纯粹的跨平台，无疑是条死路，平台差异中追求共通点，这才是大出路。我想这也是为什么Flutter要去实现，在现有项目中集成Flutter的原因吧。

## 2. 现有的项目中使用Flutter

官方一直在努力让Flutter更好的接入现有的移动端（iOS/Android）项目中，这个目的不言而喻。如果这个弄不好，肯定不会有太多商业项目愿意去使用Flutter，就像RN一样。

### 2.1 Android端

Android端方案目前稍微算是稳定一些，但是性能效率方面还是堪忧。因此本文主要偏重于介绍Android端目前来说算是相对稳定的一种方案，也就是采用Flutter module模板的方式。

#### 2.1.1 切换Flutter分支

我们默认安装的Flutter版本是beta版本，目前（2018年6月29日）版本还没有支持在现有项目中集成Flutter module的模板功能。

> flutter channel

一般的用户可以看到输出如下信息：

```
Flutter channels:
* beta
  dev
  master
```

因此，我们切换到master分支。

> flutter channel master

然后运行更新命令

> flutter upgrade

#### 2.1.2 创建Flutter module模板

这个功能是在2018年6月22日发布在master分支的，目前也只是早期的preview版本。我们在一个Android项目目录同级目录下创建模板工程。

> flutter create -t module flutter_module

创建的项目目录下面有两个隐藏文件夹，分别是.android和.ios。其中.android中包含后续我们需要使用的一些代码，例如封装好的Flutter以及FlutterFragment的Java代码。

#### 2.1.3 添加Flutter module到Android项目中

修改Android项目根目录的settings.gradle，将Flutter module作为一个子工程添加到项目中

```
include ':app'                                     // assumed existing content
setBinding(new Binding([gradle: this]))                                 // new
evaluate(new File(                                                      // new
  settingsDir.parentFile,                                               // new
  'flutter_module/.android/include_flutter.groovy'                      // new
))                                                                      // new
```

Sync一下，可以发现添加了两个module到项目中了。其中一个是flutter的module，其中包含了一些简单的封装，供Java代码调用。另一个是package_info的module，是一个Flutter插件，其代码非常简单，就是获取app名称、包名、版本等信息。

在app的build.gradle中添加依赖

```
dependencies {
  implementation project(':flutter')
```

Sync一下，不出意外的话，应该不会有什么错误，到此，这个Flutter module就被添加到了Android项目中了。

#### 2.1.4 Java代码调用Flutter module

 使用Flutter module中的Java API，添加一个Flutter view到页面上。
 
 ```
val flutterView = Flutter.createView(
      this@MainActivity,
      lifecycle,
      "route1"
  )

  val layout = FrameLayout.LayoutParams(600, 800)
  layout.leftMargin = 100
  layout.topMargin = 200
  addContentView(flutterView, layout)
 ```
 
上面代码是添加到一个文本的点击事件中的，其中FlutterView可以看作是Flutter代码展示的容器。展示的宽600高800的部分，实际上是Flutter的代码生成的。其中的route1则是写在Flutter中的，生成了一个绿色背景的Container。代码如下

```
case 'route1':
        return Container(
          child: Center(child: Text('Route 1\n${packageInfo.appName}')),
          color: Colors.green,
        );
```

在真机上运行，效果挺差劲的，点击了文本过后，会先黑一下屏，然后将这个FlutterView添加到页面上，整个过程也很缓慢，这样子肯定是没法在项目中使用。

![Flutter In Android](http://whysodiao.com/images/flutter-in-android.gif)


到此，已经完成了Android调用Flutter代码的全过程了，我们来梳理一下整个流程：

1. 切换Flutter分支到master，目前beta分支上没有包含模板工程；
2. 生成Flutter module工程；
3. 修改Android代码的配置，将Flutter module添加到Android项目中；
4. 在模板工程的lib下编写相关的Flutter代码，在Android中调用。

### 2.2 将Flutter项目转换为module

这个目前是在试验阶段，如果有愿意尝试的，也可以按照官方的例子去走一遍，不过大家最好也得有心理准备，官方文档上说会出现一系列问题，在此笔者不做进一步的尝试了。整个过程并不复杂，也是需要切换到master分支上去进行的。如果这种方案稳定下来，肯定会比上面的那种module方式更加的方便。

[官方步骤传送门](https://github.com/flutter/flutter/wiki/Add-Flutter-to-existing-apps#experiment-turn-the-flutter-project-into-a-module)

### 2.3 iOS端

[官方步骤传送门](https://github.com/flutter/flutter/wiki/Add-Flutter-to-existing-apps#experiment-integrate-flutterviewcontroller)

目前也是试验阶段，如果想要尝试的话，也需要切换到master分支上去进行的。

### 2.4 关于FlutterView

FlutterView在插件层面比较常见，是Flutter层的一个Java API。实际上可以把它看是Android端的一个View，只不过里面包含的是Flutter的内容。例如将相机封装成一个Flutter控件，就需要借助FlutterView，将预览输出到FlutterView上。

在Native项目中集成Flutter，FlutterView也起到了很重要的作用。Flutter层内容的输出，也都是通过FlutterView来实现的。

FlutterView继承自SurfaceView，它像是一个大杂烩，它包含了或者监听了尽可能多的事件，例如键盘、物理按键、生命周期、广播、Surface回调、横竖屏切换等等。基本上把Android端一个View可能存在的一些事件或者状态，都添加上去，让Flutter层能够得知尽可能多的状态和回调。

FlutterView除去各种监听事件，内部实际的工作是由FlutterNativeView去实现的。其本质也是一个插件接口，只不过是Native调用Flutter层的，它们之间通过MethodChannel进行通信的。

### 2.5 原理

通过Flutter module中的flutter模块，我们可以看出其本质上还是通过MethodChannel进行调用的。这是Flutter官方提供的一种插件能力，并不是说只能单向调用，也可以在Native端调用Flutter。

但是呢，这个调用是异步的，目前看，Native端调用Flutter层效果并不是很理想。目前笔者也是在debug下进行测试的，release环境下应该会好一点吧。如果需要在Native项目中集成Flutter，则还需要进行优化，例如提前初始化等。

## 3. 其他方法

在Flutter module没有被放出之前，其他公司一般都是怎么去实现这种混编的呢。如上面所述，我觉得都是利用了FlutterView。如果我们不依赖Flutter module，在Native中引入Flutter库，直接使用FlutterView进行页面编写，这个本身也不是什么困难的事情。难就难在进行性能优化达到上线的条件。

MethodChannel这种Natvive与Flutter之间的通信方式，给了这种混编的一种可能性。还是期待Flutter官方能把这种混编模式完善起来。

最后说一句，Flutter里面造起轮子来，简直就是太没人性了。

## 4. 后话

笔者建的一个Flutter学习相关的项目，[Github地址](https://github.com/yang7229693/flutter-study)，里面包含了笔者写的关于Flutter学习相关的一些文章，会定期更新，也会上传一些学习demo，欢迎大家关注。

## 5. 参考

1. [Add Flutter to existing apps](https://github.com/flutter/flutter/wiki/Add-Flutter-to-existing-apps)
2. [Upgrading Flutter](https://flutter.io/upgrading/)
