如何使用图像视图绘制图像？
---

使用图像视图在 `SwiftUI` 布局中呈现图像。 这些可以从您的包(bundle)，系统图标，`UIImage` 等加载图像，但是这三个是最常见的。

要从 `bundle` 中加载图片并将其显示在图片视图中，只需使用以下方法：

```swift
Image("dog")
```

需要在 `Assets.xcassets` 里面添加 `dog` 的图片。

![](imgs/1.png)

如果要使用 `Apple` 的 `SF Symbols` 图标集，则应使用 `Image(systemName:)` 初始化程序，如下所示：

```swift
Image(systemName: "cloud.heavyrain.fill")
    .font(.largeTitle)
```
