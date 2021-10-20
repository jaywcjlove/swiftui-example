如何使用 foregroundStyle 提供视觉结构？
===

![Updated for Xcode 13.0](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.0&color=blue&logo=Xcode&logoColor=white)
![New in iOS 15](https://img.shields.io/static/v1?label=&message=New%20in%20iOS%2015&color=lightgrey&logo=apple)

`SwiftUI` 提供了一个 [`foregroundStyle()`](https://developer.apple.com/documentation/swiftui/view/foregroundstyle(_:)) 修饰符来同时控制文本、图像和形状的样式。 在最简单的形式中，这类似于将 `foregroundColor()` 与 `.secondary` 一起使用，但它不仅解锁了更多语义颜色 - `.tertiary` 和 `.quaternary`，它还增加了对任何符合 `ShapeStyle` 的支持。

因此，这是一个使用四元样式渲染的图像和一些文本的示例，这是内容四个重要性级别中最低的：

```swift
HStack {
    Image(systemName: "clock.fill")
    Text("Set the time")
}
.font(.largeTitle.bold())
.foregroundStyle(.quaternary)
```

![](./imgs/001.png)<!--rehype:style=max-width:320px-->

就像我说的，任何符合 `ShapeStyle` 的东西也可以使用，这意味着我们可以使用相同的修饰符用红色到黑色的线性渐变渲染我们的 `HStack`：

```swift
HStack {
    Image(systemName: "clock.fill")
    Text("Set the time")
}
.font(.largeTitle.bold())
.foregroundStyle(
    .linearGradient(
        colors: [.red, .black],
        startPoint: .top,
        endPoint: .bottom
    )
)
```

![](./imgs/002.png)<!--rehype:style=max-width:320px-->
