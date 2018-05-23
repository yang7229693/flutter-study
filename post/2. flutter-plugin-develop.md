# Flutter Plugin开发流程

> 这篇文章主要介绍了Flutter Plugin开发流程，包括如何利用Android Studio开发以及发布等。

本文主要给大家介绍如何开发Flutter Plugin中Android的部分。有关Flutter以及Flutter Plugin的概念，感兴趣的可以从官网查看相关资料。

## 简介

笔者的环境是Mac下Android Studio进行的开发，AS也是谷歌官推的，安装flutter插件后，开发起来相对于其他IDE来说，方便很多，自带了三种模板：

*  Flutter Application： Flutter应用
*  Flutter Plugin：Flutter插件
*  Flutter Package：纯Dart组件

`Plugin其实就是一个特殊的Package`。Flutter Plugin提供Android或者iOS的底层封装，在Flutter层提供组件功能，使Flutter可以较方便的调取Native的模块。很多平台相关性或者对于Flutter实现起来比较复杂的部分，都可以封装成Plugin。其原理如下

![](http://whysodiao.com/images/flutter-platform-channels.png)

消息在client和host之间通过平台通道（platform channels）来进行的，之间的通讯都是`异步`的。

## 创建组件

直接在Android Studio中新建一个Flutter Plugin的工程，当然也可以使用命令行来进行，例如创建一个flutter_text_plugin。

> flutter create --org com.example --plugin flutter_text_plugin

如果想支持swift或者kotlin，可以用如下命令进行创建:

> flutter create --org com.example --plugin -i swift -a kotlin flutter_text_plugin

更多的参数选项，大家可以 查看帮助文档，当然还是比较推荐直接用AS进行创建，简单直观。用AS打开项目，可以看到项目的组织结构

```
root
	android
	example
	ios
	lib
	...
```


android以及ios文件夹是我们将要编写插件的native层的地方，lib文件夹是编写与native层映射的地方，native与flutter之间不能直接通信，必须通过MethodChannel来间接调用。example文件夹则是例子工程，编写的插件可以直接在这个项目中进行验证。在本文中，我们主要在android目录下进行，也就是android部分。

## 编写Android部分

用AS打开flutter_text_plugin/android项目，这样子开发起来比较方便。但是打开过后，会发现出现了很多错误，提示找不到flutter相关的东西，我们仔细看这个项目，会发现跟我们平时用AS建的Android项目有所不同，少了很多部分，目录也有所不同。这是因为这个android项目不需要能够直接去运行，因此减少了很多东西。但是对于初次接触的人来说，可能是一头懵逼，例如该如何添加第三方库，如何添加proguard rule等等。

### 引入flutter库

android插件工程是没有引入flutter库的，所以才会出现错误提示，我们在项目根目录建立一个libs文件夹，用来存放flutter库。

flutter库就在我们的flutter sdk中，路径如下

> <SDK Project>/bin/cache/artifacts/engine

engine下面包含了各种平台的flutter库，我们随便拷贝一个Android平台的库到libs文件夹下，右键flutter.jar，弹出菜单选择`Add As Library...`。

经过这一步，项目中不会再报错了，但是，由于整个flutter plugin包含了flutter库，因此不能只是简单的添加就了事了，点击菜单`Project Structure...`，找到flutter_text_plugin的Dependencies中，将flutter库的Scope从Implementation改成`Compile Only`。至此，引入flutter库的工作完成了，可以进行插件的编写操作了。

### 添加第三方库

添加第三方库有两种，一种是jar包引入，另一种通过gradle的方式进行。由于进行了第一步flutter库的引入，这一步就简单多了。查看build.gradle文件，可以看到最下面出现了如下的信息。

```
dependencies {
  compileOnly files('libs/flutter.jar')
}
```


看到这个，是不是就明朗多了，添加静态库以及添加在线库都可以在这个地方进行。例如我添加一个bugly静态库以及okhttp3库：

```
dependencies {
  compileOnly files('libs/flutter.jar')
  implementation 'com.squareup.okhttp3:okhttp:3.10.0'
  implementation files('libs/bugly_crash_release.jar')
}
```


### 添加proguard rule

由于了bugly以及okhttp3库，因此需要添加progurad rule。我们发现项目中没有proguard-rules.pro文件，因此这一步也需要我们自己去创建，在根目录下，建立proguard-rules.pro文件，将混淆规则添加进去，然后修改build.gradle文件，添加如下信息，跟普通Android项目差不多：

```
buildTypes {
    release {
      minifyEnabled true
      proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
    }
    debug {
      minifyEnabled false
      proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
    }
  }
```


### Android权限

添加了bugly以及okhttp3库，需要对应的权限申明，才能正常运行。直接在manifest文件下，添加对应的权限

```
  <uses-permission android:name="android.permission.READ_PHONE_STATE" />
  <uses-permission android:name="android.permission.INTERNET" />
  <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
  <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
  <uses-permission android:name="android.permission.READ_LOGS"/>
```


### 插件开发

至此，准备工作都已就绪，你可以把这个项目当做一个独立的Android项目，在上面进行各种封装操作，然后在FlutterTestPlugin文件下，将接口暴露出来。通过platform channels与flutter层关联起来。

## 发布

当插件开发完毕，可以将插件发布让其他人使用，在发布之前，确保pubspec.yaml,、README.md以及CHANGELOG.md文件的内容都正确填写完毕。可以通过dry-run命令来看准备是否就绪。

> flutter packages pub publish --dry-run

检查无误后，可以执行下面的命令，发布到[Pub](https://pub.dartlang.org/)上。

> flutter packages pub publish

## 如何引用

对插件的引用有两种，已经发布的和未发布的。

### 引用发布的库

flutter项目的很多资源管理都在根目录的pubspec.yaml下面，类似于js中的一些包管理一样，在`dependencies`加上我们需要引入的库，例如引入url_launcher库：

```
dependencies:
  url_launcher: ^0.4.2
```


如果这个库包含了一些平台相关的东西，例如需要在native层进行使用的话，则需要在对应的native项目单独做引用。

#### Android

修改android/build.gradle的dependencies处做引用：

```
dependencies {
        provided rootProject.findProject(":url_launcher")
    }
```


#### iOS

修改ios/hello.podspec文件

```
Pod::Spec.new do |s|
  # lines skipped
  s.dependency 'url_launcher'
```


#### 引用冲突

引用不同的库可能会导致一些冲突，例如A和B两个插件，都包含了C插件，但是所需的版本不同。因此我们可以采取以下措施避免这种问题：

* 尽量使用范围版本而不是指定一个特定的版本。
* 强制统一冲突的插件版本
* 对于native层，android可以通过force命令强制指定版本，而iOS这边，Cocoapods则不支持引用的override功能。

### 引用未发布的库

引用未发布的库有两种方式，通过本地路径和git地址的方式：

#### 基于Path的引用方式：

这种方式主要针对本地的未发布的库，引用的路径可以是相对或者绝对路径。

```
dependencies:
  plugin1:
    path: ../plugin1/
```


#### 基于Git的引用方式：

这种方式针对存放在git上的库，其中path是可选的，可以定位到某个子目录
```
dependencies:
  package1:
    git:
      url: git://github.com/flutter/packages.git
      path: packages/package1   
```


## 参考

1. [Flutter进阶—平台插件](https://blog.csdn.net/hekaiyou/article/details/72862653)
2. [Flutter - Creating a Plugin](https://www.youtube.com/watch?v=tErY3QWTZSA&t=883s)
3. [Flutter for Android Developers](https://flutter.io/flutter-for-android/)
4. [Writing custom platform-specific code with platform channels](https://flutter.io/platform-channels/)
5. [Developing Packages & Plugins](https://flutter.io/developing-packages/#step-2b-add-android-platform-code-javakt)
6. [Using Packages](https://flutter.io/using-packages/)
