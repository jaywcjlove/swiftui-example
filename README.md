![SwiftUI by Example](assets/logo.jpg)

[![Buy me a coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-048754?logo=buymeacoffee)](https://jaywcjlove.github.io/#/sponsor)

SwiftUI 示例，技巧和技术集合，帮助我构建应用程序，解决问题以及了解 SwiftUI 的实际工作方式。主要内容来源 [`hackingwithswift.com`](https://www.hackingwithswift.com/quick-start/swiftui)，下面所有实例都是在 macOS Big Sur 系统上运行，基于 Xcode `12.4` 开发。

🚧 注意：示例适用于 macOS/iOS 的 Swift 编程(主要是 macOS)，文字解释内容基于 Google 翻译，英文水平有限欢迎 RP 完善，小部分经过了添加或者修改，对部分内容进行了新增。如果对 Swift 语法不熟悉，这里有简单的  [`Swift 语法入门`](https://github.com/jaywcjlove/swift-tutorial)，对 SwiftUI 不熟悉，在这里提供了一个 [`SwiftUI 速查手册`](./example/cheat-sheet.md)。

🚧 注意：版权归属 [`hackingwithswift.com`](https://www.hackingwithswift.com/quick-start/swiftui) 原作者，对任何法律问题及风险不承担任何责任，没有任何商业目的，如果认为侵犯了您的版权，请来信告知。同时我不能完全保证内容的正确性。通过使用本站内容带来的风险与我无关。当使用本站时，代表您已接受了本站的使用条款和隐私条款。

为方便在 Swift 中颜色拾取，提供了一个小工具([UI-Color](https://uiwjs.github.io/ui-color/))，欢迎提出改进意见。

[`SwiftUI 论坛`](https://github.com/jaywcjlove/swiftui-example/discussions)

只是讨论 SwiftUI 事物的地方 [论坛→](https://github.com/jaywcjlove/swiftui-example/discussions)。想法来源于 [sindresorhus/swiftui](https://github.com/sindresorhus/swiftui)

✦ 欢迎下载我的 macOS 应用程序支持我，谢谢 ✦

<div style="display: inline_block">
  <a target="_blank" href="https://wangchujiang.com/copybook-generator/" title="Copybook Generator for macOS/iOS"><img align="center" alt="Copybook Generator" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/b90e42ff-158b-4534-82ca-5898fd0e8d73"></a>
  <a target="_blank" href="https://wangchujiang.com/devtutor/" title="DevTutor for macOS/iOS"><img align="center" alt="DevTutor for SwiftUI" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/f15c154d-0192-48eb-8e0e-9e245ffd974a"></a>
  <a target="_blank" href="https://wangchujiang.com/regex-mate/" title="RegexMate for macOS/iOS"><img align="center" alt="RegexMate" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/aabe5aa9-9a96-4390-8bed-c3e4023d0dea"></a>
  <a target="_blank" href="https://wangchujiang.com/time-passage/" title="Time Passage for macOS/iOS"><img align="center" alt="Time Passage" height="50" width="50" src="https://github.com/jaywcjlove/time-passage/assets/1680273/6f30e429-e6f3-4dbe-9921-a5effe2a05e9"></a>
  <a target="_blank" href="https://wangchujiang.com/IconizeFolder/" title="IconizeFolder for macOS"><img align="center" alt="Iconize Folder" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/fa9d8b9c-1e51-4ded-877c-fa5b21c47220"></a>
  <a target="_blank" href="https://wangchujiang.com/TextSoundSaver/" title="Textsound Saver for macOS/iOS"><img align="center" alt="Textsound Saver" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/0595e842-980b-4574-8891-a8ba853a08be"></a>
  <a target="_blank" href="https://wangchujiang.com/create-custom-symbols/" title="Create Custom Symbols for macOS"><img align="center" alt="Create Custom Symbols" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/8cd022ce-a3f1-4e89-b7c6-6fbd0d4db77c"></a>
  <a target="_blank" href="https://wangchujiang.com/DevHub/" title="DevHub for macOS"><img align="center" alt="DevHub" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/6d38923c-b97d-4687-9601-9865bd0eea1a"></a>
  <a target="_blank" href="https://wangchujiang.com/ResumeRevise/" title="Resume Revise for macOS"><img align="center" alt="Resume Revise" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/c9954a20-1905-48de-bdf8-d71837974aa2"></a>
  <a target="_blank" href="https://wangchujiang.com/palette-genius/" title="Palette Genius for macOS"><img align="center" alt="Palette Genius" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/27340413-d355-45b2-8f6f-6ac37682d957"></a>
  <a target="_blank" href="https://wangchujiang.com/symbol-scribe/" title="Symbol Scribe for macOS"><img align="center" alt="Symbol Scribe" height="50" width="50" src="https://github.com/jaywcjlove/jaywcjlove/assets/1680273/c7249f05-fa70-4def-a1e9-571d5f171fc9"></a>
</div>

<!--idoc:ignore:start-->

## 示例目录

- [介绍](#介绍)
- [建立一个完整的项目](#建立一个完整的项目)
- [使用静态文本](#使用静态文本)
- [图像形状和媒体](#图像形状和媒体)
- [视图布局](#视图布局)
- [堆栈网格滚动视图](#堆栈网格滚动视图)
- [用户界面控件](#用户界面控件)
- [响应事件](#响应事件)
- [点击和手势](#点击和手势)
- [状态](#状态)
- [列表](#列表)
- [表单](#表单)
- [容器](#容器)
- [对话框和菜单](#对话框和菜单)
- [切换界面](#切换界面)
- [转换视图](#转换视图)
- [绘画](#绘画)
- [动画](#动画)
- [排版视图](#排版视图)
- [跨平台-swiftui](#跨平台-swiftui)
- [数据](#数据)
- [辅助功能](#辅助功能)
- [工具](#工具)
- [附录a](#附录a)
- [`速查手册`](./example/cheat-sheet.md)

<!--idoc:ignore:end-->

## 介绍

简要介绍 SwiftUI 的基础

- [不要惊慌！](example/quick-start/dont-panic.md)
- [什么是 SwiftUI?](example/quick-start/what-is-swiftui.md)
- [SwiftUI 与 Interface Builder 和 storyboards](example/quick-start/swiftui-vs-interface-builder-and-storyboards.md)
- [有关 SwiftUI 的常见问题](example/quick-start/frequently-asked-questions-about-swiftui.md)
- [回答这个大问题：你应该学习 SwiftUI，UIKit，还是两者都学？](example/quick-start/answering-the-big-question-should-you-learn-swiftui-uikit-or-both.md)
- [如何遵循这个快速入门指南？](example/quick-start/how-to-follow-this-quick-start-guide.md)
- [从 UIKit 迁移到 SwiftUI](example/quick-start/migrating-from-uikit-to-swiftui.md)
- [基本模板是什么？](example/quick-start/whats-in-the-basic-template.md)
- [贡献](example/quick-start/dedication.md)

## 建立一个完整的项目

通过实际的应用程序项目学习 SwiftUI

- [创建一个 `SwiftUI` 项目](example/introduction/demo1/README.md)
- [使用列表构建菜单](example/introduction/demo2/README.md)

## 使用静态文本

整齐地布局文本

- [如何使用 `Text` 视图创建静态标签？](example/working-with-static-text/demo1/README.md)
- [如何使用字体，颜色，行距等为文本视图设置样式？](example/working-with-static-text/demo2/README.md)
- [如何使用 `multilineTextAlignment()` 调整文本对齐方式？](example/working-with-static-text/demo3/README.md)
- [如何在文本视图中设置文本格式？](example/working-with-static-text/demo4/README.md)
- [如何在文字中的字母之间增加空格？](example/working-with-static-text/demo5/README.md)
- [如何在文字检视中格式化日期？](example/working-with-static-text/demo6/README.md)
- [如何使用 `textCase()` 使 `TextField` 大写或小写？](example/working-with-static-text/demo7/README.md)
- [如何使用 `Label` 并排显示文本和图标？](example/working-with-static-text/demo8/README.md)
- [如何使用 `redacted()` 将内容标记为占位符？](example/working-with-static-text/demo9/README.md)
- [如何使用 `privacySensitive()` 将内容标记为私有?](example/working-with-static-text/demo10/README.md)
- [如何在文本中呈现 `Markdown` 内容？](example/working-with-static-text/demo11/README.md)
- [如何让用户选择文本？](example/working-with-static-text/demo12/README.md)

## 图像，形状和媒体

绘制图标，圆形，渐变等

- [如何使用图像视图绘制图像？](example/images-shapes-media/demo1/README.md)
- [如何调整图像适合其空间的展示方式？](example/images-shapes-media/demo2/README.md)
- [如何平铺图像？](example/images-shapes-media/demo3/README.md)
- [如何使用SF符号渲染图像？](example/images-shapes-media/demo4/README.md)
- [如何渲染渐变？](example/images-shapes-media/demo5/README.md)
- [如何使用图像和其他视图作为背景？](example/images-shapes-media/demo6/README.md)
- [如何显示实体形状？](example/images-shapes-media/demo7/README.md)
- [如何同时填充和描边形状？](example/images-shapes-media/demo8/README.md)
- [如何使用 `trim()` 绘制实体形状的一部分？](example/images-shapes-media/demo9/README.md)
- [什么时候应该使用 `ContainerRelativeShape`？](example/images-shapes-media/demo10/README.md)
- [如何使用 `VideoPlayer` 播放电影？](example/images-shapes-media/demo11/README.md)
- [如何使用 `SpriteView` 集成 `SpriteKit`？](example/images-shapes-media/demo12/README.md)
- [如何从 URL 加载远程图像？](example/images-shapes-media/demo13/README.md)
- [如何使用 SF Symbols 获得自定义颜色和透明度？](example/images-shapes-media/demo14/README.md)

## 视图布局

布局大小，优先级和间距

- [如何给视图定制 `frame`？](example/view-layout/demo1/README.md)
- [如何使用 `padding` 来控制各个视图之间的间距？](example/view-layout/demo2/README.md)
- [如何使用 `GeometryReader` 提供相对大小？](example/view-layout/demo3/README.md)
- [如何将内容放置在安全区域之外？](example/view-layout/demo4/README.md)
- [如何返回不同的视图类型？](example/view-layout/demo5/README.md)
- [如何使用 `ForEach` 循环创建视图？](example/view-layout/demo6/README.md)
- [如何使用 `layoutPriority()` 控制布局优先级？](example/view-layout/demo7/README.md)
- [如何使两个视图具有相同的宽度或高度？](example/view-layout/demo8/README.md)
- [如何使用 `foregroundStyle()` 提供视觉结构？](example/view-layout/demo9/README.md)

## 堆栈，网格，滚动视图

以结构化方式定位视图

- [如何使用 `VStack` 和 `HStack` 创建堆栈？](example/stacks-grids-scrollviews/demo1/README.md)
- [如何使用对齐 `alignment` 和间距 `spacing` 自定义堆栈布局？](example/stacks-grids-scrollviews/demo2/README.md)
- [如何使用 `Spacer` 将视图强制移到堆栈中的一侧？](example/stacks-grids-scrollviews/demo3/README.md)
- [如何制作固定尺寸的 `Spacer`？](example/stacks-grids-scrollviews/demo4/README.md)
- [如何使用 `ZStack` 在彼此之上叠加视图？](example/stacks-grids-scrollviews/demo5/README.md)
- [如何使用 `zIndex` 更改视图分层的顺序？](example/stacks-grids-scrollviews/demo6/README.md)
- [如何使用尺寸类创建不同的布局？](example/stacks-grids-scrollviews/demo7/README.md)
- [如何根据大小类在 `HStack` 和 `VStack` 之间自动切换？](example/stacks-grids-scrollviews/demo8/README.md)
- [如何使用 `ScrollView` 添加水平和垂直滚动？](example/stacks-grids-scrollviews/demo9/README.md)
- [如何使用 `ScrollViewReader` 使滚动视图移动到某个位置？](example/stacks-grids-scrollviews/demo10/README.md)
- [如何使用 `ScrollView` 和 `GeometryReader` 创建3D效果(如Cover Flow)？](example/stacks-grids-scrollviews/demo11/README.md)
- [如何使用 `LazyVGrid` 和 `LazyHGrid` 在网格中放置视图？](example/stacks-grids-scrollviews/demo12/README.md)
- [如何使用 `LazyVStack` 和 `LazyHStack` 延迟加载视图？](example/stacks-grids-scrollviews/demo13/README.md)
- [如何使用 `HSplitViews` 创建左中右三栏布局？](example/stacks-grids-scrollviews/demo14/README.md)
- [如何添加视觉效果模糊？](example/stacks-grids-scrollviews/demo15/README.md)

## 用户界面控件

响应交互并控制程序状态

- [使用状态](example/user-interface-controls/demo1/README.md)
- [如何创建可点击的按钮？](example/user-interface-controls/demo2/README.md)
- [如何禁用 `Button` 和 `NavigationLink` 中的图像的覆盖颜色？](example/user-interface-controls/demo3/README.md)
- [如何从 `TextField` 读取文本？](example/user-interface-controls/demo4/README.md)
- [如何在 `TextField` 上添加边框？](example/user-interface-controls/demo5/README.md)
- [如何将占位符添加到 `TextField`？](example/user-interface-controls/demo6/README.md)
- [如何在 `TextField` 中禁用自动更正？](example/user-interface-controls/demo7/README.md)
- [如何关闭 `TextField` 的键盘？](example/user-interface-controls/demo8/README.md)
- [如何格式化数字的 `TextField`？](example/user-interface-controls/demo9/README.md)
- [如何使用 `SecureField` 创建安全的文本字段？](example/user-interface-controls/demo10/README.md)
- [如何创建拨动开关？](example/user-interface-controls/demo11/README.md)
- [如何创建滑块 `Slider` 并从中读取值？](example/user-interface-controls/demo12/README.md)
- [如何创建选择器 `Picker` 并从中读取值？](example/user-interface-controls/demo13/README.md)
- [如何创建日期选择器 `DatePicker` 并从中读取值？](example/user-interface-controls/demo14/README.md)
- [如何创建分段控件并从中读取值？](example/user-interface-controls/demo15/README.md)
- [如何创建步进器 `Stepper` 并从中读取值？](example/user-interface-controls/demo16/README.md)
- [如何使用 `labelsHidden()` 隐藏 `Picker`，`Stepper`，`Toggle` 等标签？](example/user-interface-controls/demo17/README.md)
- [如何使用文本编辑器创建多行可编辑文本 `TextEditor`？](example/user-interface-controls/demo18/README.md)
- [如何让用户使用 `ColorPicker` 选择颜色？](example/user-interface-controls/demo19/README.md)
- [如何使用 `ProgressView` 显示任务的进度？](example/user-interface-controls/demo20/README.md)
- [如何使用 `ProgressView` 显示不确定的进度？](example/user-interface-controls/demo21/README.md)
- [如何显示地图 `Map` 视图？](example/user-interface-controls/demo22/README.md)
- [如何在地图 `Map` 视图中显示注释？](example/user-interface-controls/demo23/README.md)
- [如何在 `Safari` 中打开 Web 链接？](example/user-interface-controls/demo24/README.md)
- [如何设置可编辑文本 `TextEditor` 背景颜色？](example/user-interface-controls/demo25/README.md)
- [如何自定义 `TextField`、`SecureField` 和 `TextEditor` 的提交按钮？](example/user-interface-controls/demo26/README.md)
- [当用户提交 TextField 时如何执行事件？](example/user-interface-controls/demo27/README.md)
- [如何获得突出的边框按钮？](example/user-interface-controls/demo28/README.md)

## 响应事件

快捷方式，旋转方式和外观

- [如何使用 `scenePhase` 检测您的应用何时移至背景或前景？](example/responding-to-events/demo1/README.md)
- [如何响应查看生命周期事件：`onAppear()` 和 `onDisappear()` ？](example/responding-to-events/demo2/README.md)
- [如何使用 `keyboardShortcut()` 添加键盘快捷键？](example/responding-to-events/demo3/README.md)
- [如何控制应用启动时显示的视图？](example/responding-to-events/demo4/README.md)
- [应用启动时如何运行代码？](example/responding-to-events/demo5/README.md)
- [如何将 `AppDelegate` 添加到 SwiftUI 应用？](example/responding-to-events/demo6/README.md)
- [如何检测设备旋转？](example/responding-to-events/demo7/README.md)
- [如何在键盘上添加工具栏？](example/responding-to-events/demo8/README.md)
- [显示视图时如何运行异步任务？](example/responding-to-events/demo9/README.md)

## 点击和手势

滑动，轻击，摇动和其他输入

- [如何在视图中添加手势识别器？](example/taps-and-gestures/demo1/README.md)
- [如何阅读点击和双击手势？](example/taps-and-gestures/demo2/README.md)
- [如何使用 `highPriorityGesture()` 强制一个手势先识别另一个手势？](example/taps-and-gestures/demo3/README.md)
- [如何使用 `simultaneousGesture()` 同时识别两个手势？](example/taps-and-gestures/demo4/README.md)
- [如何使用 `sequenced(before:)` 创建手势链？](example/taps-and-gestures/demo5/README.md)
- [如何检测到用户将鼠标悬停在视图上？](example/taps-and-gestures/demo6/README.md)
- [如何检测摇动手势？](example/taps-and-gestures/demo7/README.md)
- [如何使用 `contentShape()` 控制视图的可点击区域？](example/taps-and-gestures/demo8/README.md)
- [如何使用 `allowsHitTesting()` 禁用视图的点击？](example/taps-and-gestures/demo9/README.md)

## 状态

响应交互并控制程序状态

- [`@ObservedObject`，`@State` 和 `@EnvironmentObject` 有什么区别？](example/advanced-state/demo1/README.md)
- [如何使用 `@StateObject` 创建和监视外部对象？](example/advanced-state/demo2/README.md)
- [如何使用 `@ObservedObject` 管理外部对象的状态？](example/advanced-state/demo3/README.md)
- [如何使用 `@EnvironmentObject` 在视图之间共享数据？](example/advanced-state/demo4/README.md)
- [如何使用 `objectWillChange` 手动发送状态更新？](example/advanced-state/demo5/README.md)
- [如何创建常量绑定？](example/advanced-state/demo6/README.md)
- [如何创建自定义绑定？](example/advanced-state/demo7/README.md)
- [如何在 `SwiftUI` 中使用计时器？](example/advanced-state/demo8/README.md)
- [当使用 `onChange()` 改变状态时如何运行一些代码？](example/advanced-state/demo9/README.md)

## 列表

创建数据滚动表

- [使用列表 `List`](example/lists/demo1/README.md)
- [如何创建静态物品列表？](example/lists/demo2/README.md)
- [如何创建动态项目列表？](example/lists/demo3/README.md)
- [如何让用户从列表中删除行？](example/lists/demo4/README.md)
- [如何让用户在列表中移动行？](example/lists/demo5/README.md)
- [如何将 `Section` 添加到列表？](example/lists/demo6/README.md)
- [如何使用 `EditButton` 启用对列表的编辑？](example/lists/demo7/README.md)
- [如何使用 `listRowBackground()` 设置列表行的背景色？](example/lists/demo8/README.md)
- [如何创建分组和插入分组列表？](example/lists/demo9/README.md)
- [如何创建扩展列表？](example/lists/demo10/README.md)
- [如何滚动到列表中的特定行？](example/lists/demo11/README.md)
- [如何允许列表中的行选择？](example/lists/demo12/README.md)
- [如何使用隐式堆栈？](example/lists/demo13/README.md)

## 表单

快速有效地获得用户输入

- [使用表单 `Form`](example/forms/demo1/README.md)
- [基本表格设计](example/forms/demo2/README.md)
- [将表格分为几个部分](example/forms/demo3/README.md)
- [表单选择器 `Pickers`](example/forms/demo4/README.md)
- [启用和禁用表单中的元素](example/forms/demo5/README.md)
- [显示和隐藏表单行](example/forms/demo6/README.md)

## 容器

将视图放置在导航控制器等中

- [使用容器](example/containers/demo1/README.md)
- [如何在导航视图中嵌入视图？](example/containers/demo2/README.md)
- [如何将栏项目添加到导航视图？](example/containers/demo3/README.md)
- [如何使用 `TabView` 将视图嵌入选项卡栏中？](example/containers/demo4/README.md)
- [如何使用 `tabViewStyle()` 创建内容的滚动页面？](example/containers/demo5/README.md)
- [如何将视图组合 `Group` 在一起？](example/containers/demo6/README.md)
- [如何隐藏和显示状态栏？](example/containers/demo7/README.md)
- [如何使用 `DisclosureGroup` 隐藏和显示内容？](example/containers/demo8/README.md)
- [如何创建工具栏并向其中添加按钮？](example/containers/demo9/README.md)
- [如何为 `iPadOS` 添加侧边栏？](example/containers/demo10/README.md)
- [如何隐藏和显示 `NavigationView` 侧边栏？](example/containers/demo11/README.md)

## 对话框和菜单

发生某些情况时显示模式通知

- [使用简介](example/alerts-and-menus/demo1/README.md)
- [如何显示 `alert`？](example/alerts-and-menus/demo2/README.md)
- [如何为 `alert` 按钮添加动作？](example/alerts-and-menus/demo3/README.md)
- [如何在单个视图中显示多个 `alert`？](example/alerts-and-menus/demo4/README.md)
- [如何显示动作面板？](example/alerts-and-menus/demo5/README.md)
- [如何显示上下文菜单？](example/alerts-and-menus/demo6/README.md)
- [如何使用 `appStoreOverlay()` 推荐另一个应用程序？](example/alerts-and-menus/demo7/README.md)
- [按下按钮时如何显示菜单？](example/alerts-and-menus/demo8/README.md)
- [如何让用户从菜单中选择选项？](example/alerts-and-menus/demo9/README.md)
- [如何更改 macOS 应用中主菜单？](example/alerts-and-menus/demo10/README.md)
- [如何添加偏好设置界面？](example/alerts-and-menus/demo11/README.md)

## 切换界面

将您的用户从一个视图移动到另一个视图

- [如何将新视图推送到 `NavigationView` 上？](example/presenting-views/demo1/README.md)
- [点击列表行时如何推送新视图？](example/presenting-views/demo2/README.md)
- [如何在 `SwiftUI` 中使用程序化导航？](example/presenting-views/demo3/README.md)
- [如何使用 `sheets` 呈现新视图？](example/presenting-views/demo4/README.md)
- [如何使视图自行关闭？](example/presenting-views/demo5/README.md)
- [如何显示弹出视图？](example/presenting-views/demo6/README.md)

## 转换视图

剪辑，大小，比例，旋转等

- [如何使用其偏移量调整视图的位置 `offset`？](example/transforming-views/demo1/README.md)
- [如何为视图周围的填充着色？](example/transforming-views/demo2/README.md)
- [如何堆叠修改器以创建更高级的效果？](example/transforming-views/demo3/README.md)
- [如何在视图周围绘制边框？](example/transforming-views/demo4/README.md)
- [如何在视图内绘制边框？](example/transforming-views/demo5/README.md)
- [如何创建行军蚂蚁边框动画效果？](example/transforming-views/demo6/README.md)
- [如何在视图周围绘制阴影？](example/transforming-views/demo7/README.md)
- [如何裁剪视图，以便仅部分可见？](example/transforming-views/demo8/README.md)
- [如何旋转视图？](example/transforming-views/demo9/README.md)
- [如何旋转 3D 视图？](example/transforming-views/demo10/README.md)
- [如何放大或缩小视图？](example/transforming-views/demo11/README.md)
- [如何圆角化一个视图？](example/transforming-views/demo12/README.md)
- [如何调整视图的不透明度？](example/transforming-views/demo13/README.md)
- [如何调整视图的强调色？](example/transforming-views/demo14/README.md)
- [如何用一个视图掩盖另一个视图？](example/transforming-views/demo15/README.md)
- [如何模糊视图？](example/transforming-views/demo16/README.md)
- [如何将视图融合在一起？](example/transforming-views/demo17/README.md)
- [如何通过着色，去饱和等来调整视图？](example/transforming-views/demo18/README.md)
- [使用 `ButtonStyle` 自定义按钮](example/transforming-views/demo19/README.md)
- [使用 `ProgressViewStyle` 自定义 `ProgressView`](example/transforming-views/demo20/README.md)
- [使用 `ToggleStyle` 自定义 `Toggle`](example/transforming-views/demo21/README.md)
- [如何更改 `List` `TextEditor` 等的背景色](example/transforming-views/demo22/README.md)

## 绘画

使用自定义形状控制渲染

- [SwiftUI 的内置形状](example/drawing/demo1/README.md)
- [如何绘制自定义路径？](example/drawing/demo2/README.md)
- [如何绘制多边形和星星？](example/drawing/demo3/README.md)
- [如何画一个棋盘？](example/drawing/demo4/README.md)

## 动画

通过运动使您的界面栩栩如生

- [如何创建基本动画？](example/animation/demo1/README.md)
- [如何制作弹簧动画？](example/animation/demo2/README.md)
- [如何为绑定值的变化制作动画？](example/animation/demo3/README.md)
- [如何创建显式动画？](example/animation/demo4/README.md)
- [如何延迟动画？](example/animation/demo5/README.md)
- [视图出现后如何立即启动动画？](example/animation/demo6/README.md)
- [如何在一个视图中应用多个动画？](example/animation/demo7/README.md)
- [如何使用 matchedGeometryEffect() 将动画从一个视图同步到另一个视图？](example/animation/demo8/README.md)
- [如何通过过渡添加和删除视图？](example/animation/demo9/README.md)
- [如何创建不对称过渡？](example/animation/demo10/README.md)
- [如何创建自定义过渡？](example/animation/demo11/README.md)
- [如何设置文字大小的动画？](example/animation/demo12/README.md)
- [如何用事务覆盖动画？](example/animation/demo13/README.md)

## 排版视图

使您的UI结构更易于理解

- [如何创建和组合自定义视图？](example/composing-views/demo1/README.md)
- [如何将文本视图结合在一起？](example/composing-views/demo2/README.md)
- [如何将视图存储为属性？](example/composing-views/demo3/README.md)
- [如何创建自定义修改程序？](example/composing-views/demo4/README.md)
- [如何为 `SwiftUI` 包装自定义 `UIView`？](example/composing-views/demo5/README.md)
- [如何为 `UIViewRepresentable` 结构创建修饰符？](example/composing-views/demo6/README.md)
- [如何将图像插入文本？](example/composing-views/demo7/README.md)

## 跨平台 SwiftUI

学习让您的应用在任何地方都看起来很棒

- [学习一次，随处应用](example/cross-platform/demo1/README.md)
- [如何在 `macOS` 上获取半透明列表？](example/cross-platform/demo2/README.md)
- [如何在 `watchOS` 上制作轮播列表？](example/cross-platform/demo3/README.md)
- [如何使用 `digitalCrownRotation()` 在 `watchOS` 上读取 `Digital Crown`？](example/cross-platform/demo4/README.md)

## 数据

通过 `Core Data` 集成和更多功能处理数据

- [在 `SwiftUI` 中使用 `Core Data` 的简介](example/data/demo1/README.md)
- [如何配置核心数据以与 `SwiftUI` 一起使用？](example/data/demo2/README.md)
- [如何从 `SwiftUI` 视图访问 `Core Data` 管理的对象上下文？](example/data/demo3/README.md)
- [如何使用 `@FetchRequest` 创建核心数据获取请求？](example/data/demo4/README.md)
- [如何使用 `predicate` 过滤核心数据获取请求？](example/data/demo5/README.md)
- [如何从 `SwiftUI` 视图添加 `Core Data` 对象？](example/data/demo6/README.md)
- [如何从 `SwiftUI` 视图中删除 `Core Data` 对象？](example/data/demo7/README.md)
- [如何限制获取请求中的项目数？](example/data/demo8/README.md)
- [如何使用 `FileDocument` 和 `DocumentGroup` 创建基于文档的应用程序？](example/data/demo9/README.md)
- [如何使用 `fileExporter()` 导出文件？](example/data/demo10/README.md)
- [如何在 `SwiftUI` 中继续 `NSUserActivity`？](example/data/demo11/README.md)
- [如何使用 `LocationButton` 读取用户的位置？](example/data/demo12/README.md)

## 辅助功能

如何使每个人都能使用您的应用

- [SwiftUI 的可访问性简介](example/accessibility/demo1/README.md)
- [如何使用带有自定义字体的动态类型？](example/accessibility/demo2/README.md)
- [如何检测“减少运动”辅助功能设置？](example/accessibility/demo3/README.md)
- [如何检测暗模式？](example/accessibility/demo4/README.md)
- [如何使用装饰性图像减少屏幕阅读器的混乱？](example/accessibility/demo5/README.md)
- [如何在请求时减少动画？](example/accessibility/demo6/README.md)

## 工具

使用Xcode的帮助构建更好的应用程序

- [如何以不同的动态类型大小预览布局？](example/tooling/demo1/README.md)
- [如何在亮(light)和黑暗(dark)模式下预览布局？](example/tooling/demo2/README.md)
- [如何在不同的设备中预览布局？](example/tooling/demo3/README.md)
- [如何在导航视图中预览布局?](example/tooling/demo4/README.md)
- [如何使用 `Instruments` 来配置您的 SwiftUI 代码并识 `identify` 布局？](example/tooling/demo5/README.md)
- [如何在 `SwiftUI` 中使用 `Touch ID` 和 `Face ID`？](example/tooling/demo6/README.md)
- [如何在 Xcode 中添加创建 `Swift` 包依赖？](example/tooling/demo7/README.md)
- [如何以纵向或横向预览布局？](example/tooling/demo8/README.md)
- [如何查找导致 SwiftUI 视图更新的数据更改？](example/tooling/demo9/README.md)

## 附录A

如何使用每个 SwiftUI 属性包装器

- [了解 Swift 和 SwiftUI 中的属性包装器](example/appendix-a/demo1/README.md)
- [所有 SwiftUI 属性包装器都进行了解释和比较](example/appendix-a/demo2/README.md)
- [什么是 `@State` 属性包装器？](example/appendix-a/demo3/README.md)
- [什么是 `@StateObject` 属性包装器？](example/appendix-a/demo4/README.md)
- [什么是 `@Published` 属性包装器？](example/appendix-a/demo5/README.md)
- [什么是 `@ObservedObject` 属性包装器？](example/appendix-a/demo6/README.md)
- [什么是 `@EnvironmentObject` 属性包装器？](example/appendix-a/demo7/README.md)
- [什么是 `@Environment` 属性包装器？](example/appendix-a/demo8/README.md)
- [什么是 `@Binding` 属性包装器？](example/appendix-a/demo9/README.md)
- [什么是 `@GestureState` 属性包装器？](example/appendix-a/demo10/README.md)
- [什么是 `@FetchRequest` 属性包装器？](example/appendix-a/demo11/README.md)
- [什么是 `@AppStorage` 属性包装器？](example/appendix-a/demo12/README.md)
- [什么是 `@SceneStorage` 属性包装器？](example/appendix-a/demo13/README.md)
- [什么是 `@ScaledMetric` 属性包装器？](example/appendix-a/demo14/README.md)
- [什么是 `@UIApplicationDelegateAdaptor` 属性包装器？](example/appendix-a/demo15/README.md)

## 工具推荐

- [Swift 语法入门](https://github.com/jaywcjlove/swift-tutorial)
- [Swift 包索引](https://swiftpackageindex.com/)
- [hackingwithswift.com](https://www.hackingwithswift.com/quick-start/swiftui)

## 贡献者

一如既往，感谢我们出色的贡献者！

<a href="https://github.com/jaywcjlove/swiftui-example/graphs/contributors">
  <img src="https://jaywcjlove.github.io/swiftui-example/CONTRIBUTORS.svg" />
</a>

使用 [action-contributors](https://github.com/jaywcjlove/github-action-contributors) 制作。

## License

Licensed under the MIT License.
