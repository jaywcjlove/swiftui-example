SwiftUI by Example
---

SwiftUI 示例，技巧和技术集合，帮助我构建应用程序，解决问题以及了解 SwiftUI 的实际工作方式。

## 介绍

简要介绍 SwiftUI 的基础

## 建立一个完整的项目

通过实际的应用程序项目学习SwiftUI

- [SwiftUI 教程：构建完整的项目](example/introduction/demo1)
- [使用列表构建菜单](example/introduction/demo2)

## 使用静态文本

整齐地布局文本

- [如何使用 `Text` 视图创建静态标签？](example/working-with-static-text/demo1)
- [如何使用字体，颜色，行距等为文本视图设置样式？](example/working-with-static-text/demo2)
- [如何使用 `multilineTextAlignment()` 调整文本对齐方式？](example/working-with-static-text/demo3)
- [如何在文本视图中设置文本格式？](example/working-with-static-text/demo4)
- [如何在文字中的字母之间增加空格？](example/working-with-static-text/demo5)
- [如何在文字检视中格式化日期？](example/working-with-static-text/demo6)
- [如何使用 `textCase()` 使 `TextField` 大写或小写？](example/working-with-static-text/demo7)
- [如何使用 `Label` 并排显示文本和图标？](example/working-with-static-text/demo8)
- [如何使用 `redacted()` 将内容标记为占位符？](example/working-with-static-text/demo9)

## 图像，形状和媒体

绘制图标，圆形，渐变等

- [如何使用图像视图绘制图像？](example/images-shapes-media/demo1)
- [如何调整图像适合其空间的展示方式？](example/images-shapes-media/demo2)
- [如何平铺图像？](example/images-shapes-media/demo3)
- [如何使用SF符号渲染图像？](example/images-shapes-media/demo4)
- [如何渲染渐变？](example/images-shapes-media/demo5)
- [如何使用图像和其他视图作为背景？](example/images-shapes-media/demo6)
- [如何显示实体形状？](example/images-shapes-media/demo7)
- [如何同时填充和描边形状？](example/images-shapes-media/demo8)
- [如何使用 `trim()` 绘制实体形状的一部分？](example/images-shapes-media/demo9)
- [什么时候应该使用 `ContainerRelativeShape`？](example/images-shapes-media/demo10)
- [如何使用 `VideoPlayer` 播放电影？](example/images-shapes-media/demo11)
- [如何使用 `SpriteView` 集成 `SpriteKit`？](example/images-shapes-media/demo12)

## 视图布局

布局大小，优先级和间距

- [如何给视图定制 `frame`？](example/images-shapes-media/demo1)
- [如何使用 `padding` 来控制各个视图之间的间距？](example/images-shapes-media/demo2)
- [如何使用 `GeometryReader` 提供相对大小？](example/images-shapes-media/demo3)
- [如何将内容放置在安全区域之外？](example/images-shapes-media/demo4)
- [如何返回不同的视图类型？](example/images-shapes-media/demo5)
- [如何使用 `ForEach` 循环创建视图？](example/images-shapes-media/demo6)
- [如何使用 `layoutPriority()` 控制布局优先级？](example/images-shapes-media/demo7)

## 状态

响应交互并控制程序状态

- [`@ObservedObject`，`@State` 和 `@EnvironmentObject` 有什么区别？](example/advanced-state/demo1)
- [如何使用 `@StateObject` 创建和监视外部对象？](example/advanced-state/demo2)
- [如何使用 `@ObservedObject` 管理外部对象的状态？](example/advanced-state/demo3)
- [如何使用 `@EnvironmentObject` 在视图之间共享数据？](example/advanced-state/demo4)
- [如何使用 `objectWillChange` 手动发送状态更新？](example/advanced-state/demo5)
- [如何创建常量绑定？](example/advanced-state/demo6)
- [如何创建自定义绑定？](example/advanced-state/demo7)
- [如何在 `SwiftUI` 中使用计时器？](example/advanced-state/demo8)
- [当使用 `onChange()` 改变状态时如何运行一些代码？](example/advanced-state/demo9)

## 切换界面

将您的用户从一个视图移动到另一个视图

- [如何将新视图推送到 `NavigationView` 上？](example/presenting-views/demo1)
- [点击列表行时如何推送新视图？](example/presenting-views/demo2)
- [如何在 `SwiftUI` 中使用程序化导航？](example/presenting-views/demo3)
- [如何显示弹出视图？](example/presenting-views/demo3)

## 转换视图

剪辑，大小，比例，旋转等

- [如何使用其偏移量调整视图的位置？](example/transforming-views/demo1)
- [如何为视图周围的填充着色？](example/transforming-views/demo2)
- [如何堆叠修改器以创建更高级的效果？](example/transforming-views/demo3)
- [如何在视图周围绘制边框？](example/transforming-views/demo4)
- [如何在视图内绘制边框？](example/transforming-views/demo5)
- [如何创建行军蚂蚁边框动画效果？](example/transforming-views/demo6)
- [如何在视图周围绘制阴影？](example/transforming-views/demo7)
- [如何裁剪视图，以便仅可见部分？](example/transforming-views/demo8)
- [如何旋转视图？](example/transforming-views/demo9)
- [如何旋转 3D 视图？](example/transforming-views/demo10)
- [如何放大或缩小视图？](example/transforming-views/demo11)
- [如何圆角化一个视图？](example/transforming-views/demo12)
- [如何调整视图的不透明度？](example/transforming-views/demo13)
- [如何调整视图的强调色？](example/transforming-views/demo14)
- [如何用一个视图掩盖另一个视图？](example/transforming-views/demo15)
- [如何模糊视图？](example/transforming-views/demo16)
- [如何将视图融合在一起？](example/transforming-views/demo17)
- [如何通过着色，去饱和等来调整视图？](example/transforming-views/demo18)
- [使用 `ButtonStyle` 自定义按钮](example/transforming-views/demo19)
- [使用 `ProgressViewStyle` 自定义 `ProgressView`](example/transforming-views/demo20)
- [使用 `ToggleStyle` 自定义 `Toggle`](example/transforming-views/demo21)

## 绘画

使用自定义形状控制渲染

- [SwiftUI 的内置形状](example/drawing/demo1)
- [如何绘制自定义路径？](example/drawing/demo2)
- [如何绘制多边形和星星？](example/drawing/demo3)
- [如何画一个棋盘？](example/drawing/demo4)

## 动画

通过运动使您的界面栩栩如生

- [如何创建基本动画？](example/animation/demo1)
- [如何制作弹簧动画？](example/animation/demo2)
- [如何为绑定值的变化制作动画？](example/animation/demo3)
- [如何创建显式动画？](example/animation/demo4)
- [如何延迟动画？](example/animation/demo5)
- [视图出现后如何立即启动动画？](example/animation/demo6)
- [如何在一个视图中应用多个动画？](example/animation/demo7)
- [如何使用 matchedGeometryEffect() 将动画从一个视图同步到另一个视图？](example/animation/demo8)
- [如何通过过渡添加和删除视图？](example/animation/demo9)
- [如何创建不对称过渡？](example/animation/demo10)
- [如何创建自定义过渡？](example/animation/demo11)
- [如何设置文字大小的动画？](example/animation/demo12)
- [如何用事务覆盖动画？](example/animation/demo13)