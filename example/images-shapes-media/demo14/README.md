如何使用 SF Symbols 获得自定义颜色和透明度？
===

![Updated for Xcode 13.0](https://img.shields.io/static/v1?label=&message=Updated%20for%20Xcode%2013.0&color=blue&logo=Xcode&logoColor=white)
![New in iOS 15](https://img.shields.io/static/v1?label=&message=New%20in%20iOS%2015&color=lightgrey&logo=apple)

如果您在 `SwiftUI` 的图像视图中使用 `SF Symbols`，您可以使用 `foregroundColor()` 属性获得简单的颜色，或者使用 `.renderingMode(.original)` 启用它们的多色变体。 但是，为了使图像的各个部分具有更大的灵活性，您可以使用分层变体或提供完全自定义的调色板。

分层渲染使用不透明度在屏幕上创建阴影变化。 例如，这将以透明方式绘制图像以提供额外的深度和清晰度：

```swift
Image(systemName: "theatermasks")
    .symbolRenderingMode(.hierarchical)
    .font(.system(size: 144))
```

![](./imgs/001.png)<!--rehype:style=max-width:650px-->

分层渲染与前景色结合使用，因此如果需要，您可以同时指定两者：

```swift
Image(systemName: "theatermasks")
    .symbolRenderingMode(.hierarchical)
    .foregroundColor(.blue)
    .font(.system(size: 144))
```

![](./imgs/002.png)<!--rehype:style=max-width:650px-->

为了获得更多功能，您可以使用 `.palette` 变体来完全控制图像中的颜色。 因此，我们可以同时将 `SharePlay` 图标渲染为蓝色和黑色，如下所示：

```swift
Image(systemName: "shareplay")
    .symbolRenderingMode(.palette)
    .foregroundStyle(.blue, .black)
    .font(.system(size: 144))
```

![](./imgs/003.png)<!--rehype:style=max-width:650px-->

这些颜色的应用方式取决于每个单独的符号 —— 有时符号定义为两层，有时定义为三层，您需要单独探索它们以了解它们是如何分解的。

对于包含三个变体的符号，只需添加额外的颜色：

```swift
Image(systemName: "person.3.sequence.fill")
    .symbolRenderingMode(.palette)
    .foregroundStyle(.blue, .green, .red)
    .font(.system(size: 144))
```

![](./imgs/004.png)<!--rehype:style=max-width:650px-->


这甚至适用于复杂的前景样式，例如为图标中的每个人提供一个渐变：

```swift
Image(systemName: "person.3.sequence.fill")
    .symbolRenderingMode(.palette)
    .foregroundStyle(
        .linearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottomTrailing),
        .linearGradient(colors: [.green, .black], startPoint: .top, endPoint: .bottomTrailing),
        .linearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottomTrailing)
    )
    .font(.system(size: 144))
```

![](./imgs/005.png)<!--rehype:style=max-width:650px-->